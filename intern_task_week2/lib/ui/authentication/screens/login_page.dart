import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task_week2/models/country_model.dart';
import 'package:intern_task_week2/ui/authentication/widgets/country_code_tile.dart';
import 'package:intern_task_week2/ui/authentication/widgets/country_langage_tile.dart';
import 'package:intern_task_week2/ui/authentication/widgets/profile_icon_button.dart';
import 'package:intern_task_week2/ui/authentication/widgets/title_text.dart';
import 'package:intern_task_week2/utils/background_painter.dart';
import 'package:intern_task_week2/utils/constants.dart';
import 'package:intern_task_week2/utils/my_colors.dart';
import 'package:intern_task_week2/utils/routes.dart';
import 'package:intern_task_week2/utils/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  late TextEditingController phoneController;
  Country selectedCountry = countryList[0];
  String selectedLanguage = languageList[0].language;
  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomPaint(
          painter: BackgroundPainterLogin(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _header(),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          _countryCode(context),
                          Expanded(child: _phoneTextField()),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _preferedLanguage(context),
                          SizedBox(width: 16.w),
                          Expanded(child: _loginButton(context))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              _poweredBy(),
            ],
          ),
        ),
      ),
    );
  }

  Text _poweredBy() {
    return Text(
      'Powered By',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      ),
    );
  }

  _validate() async {
    if (_key.currentState!.validate()) {
      _resetKeyboardFocus();
      Navigator.pushNamed(
        context,
        Routes.homePage,
        arguments: {
          "phone":
              "${selectedCountry.countryCode} ${phoneController.text.trim()}"
        },
      );
    }
  }

  _resetKeyboardFocus() {
    FocusScope.of(context).unfocus();
  }

  InkWell _preferedLanguage(BuildContext context) {
    return InkWell(
      onTap: () {
        /* TO CLOSE KEYBOARD ON PRESS*/
        _resetKeyboardFocus();
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return _languageBottomSheet(context);
            });
      },
      child: Text(
        "Your Prefered Language?",
        style: TextStyle(decoration: TextDecoration.underline, color: mainBlue),
      ),
    );
  }

  SizedBox _loginButton(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        onPressed: () async {
          await _validate();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainBlue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        child: const Text("Login"),
      ),
    );
  }

  Container _countryCodeBottomSheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(top: 16.0.h, left: 16.w, bottom: 8.h),
            child: TitleText(title: "Select Country Code", fontSize: 22.sp),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: countryList.length,
              itemBuilder: ((context, index) {
                return CountryCodeTile(
                  selectedCountryCode: selectedCountry.countryCode,
                  country: countryList[index],
                  onTap: (country) {
                    setState(() {
                      selectedCountry = country;
                      Navigator.pop(context);
                    });
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Container _languageBottomSheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(top: 16.0.h, left: 16.w, bottom: 8.h),
            child: TitleText(title: "Select Language", fontSize: 22.sp),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: languageList.length,
              itemBuilder: ((context, index) {
                return CountryLanguageTile(
                  languageModel: languageList[index],
                  onTap: (language) {
                    setState(() => selectedLanguage = language);
                    Navigator.pop(context);
                  },
                  selectedLanguage: selectedLanguage,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _countryCode(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /* TO CLOSE KEYBOARD ON PRESS*/
        FocusScope.of(context).unfocus();
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return _countryCodeBottomSheet(context);
            });
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(selectedCountry.url))),
            ),
            SizedBox(width: 8.w),
            Text(
              selectedCountry.countryCode,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
            const Icon(Icons.arrow_downward)
          ],
        ),
      ),
    );
  }

  Widget _phoneTextField() {
    return TextFormField(
      controller: phoneController,
      decoration: InputDecoration(
        label: const Text("Phone Number"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      keyboardType: defaultTargetPlatform == TargetPlatform.iOS
          ? const TextInputType.numberWithOptions(decimal: true, signed: true)
          : TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) {
        if (selectedCountry.mindigits == selectedCountry.maxdigits) {
          return Validator()
              .validatePhone(value: value, digit: selectedCountry.mindigits);
        } else {
          return Validator().validatePhone(
              value: value,
              digit: selectedCountry.mindigits,
              max: selectedCountry.maxdigits);
        }
      },
    );
  }

  Column _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: "Login",
          fontSize: 32.sp,
        ),
        Text(
          "We'll need some information from you",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      actions: [
        ProfileIconButton(onTap: () {}),
        SizedBox(width: 20.w),
      ],
    );
  }
}
