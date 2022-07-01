import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task_week2/ui/authentication/widgets/back_arrow_button.dart';
import 'package:intern_task_week2/ui/authentication/widgets/profile_icon_button.dart';
import 'package:intern_task_week2/ui/authentication/widgets/title_text.dart';
import 'package:intern_task_week2/ui/home/widgets/choose_gender.dart';
import 'package:intern_task_week2/ui/home/widgets/custom_text_field.dart';
import 'package:intern_task_week2/utils/background_painter.dart';
import 'package:intern_task_week2/utils/constants.dart';
import 'package:intern_task_week2/utils/my_colors.dart';
import 'package:intern_task_week2/utils/validator.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String phone;
  const HomePage({Key? key, required this.phone}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController idNameController;
  late TextEditingController nameController;
  late TextEditingController idController;
  late TextEditingController doaController;
  late TextEditingController emailController;
  late TextEditingController madenController;
  late TextEditingController promoController;

  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    idNameController = TextEditingController();
    nameController = TextEditingController();
    idController = TextEditingController();
    doaController = TextEditingController();
    emailController = TextEditingController();
    madenController = TextEditingController();
    promoController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idNameController.dispose();
    nameController.dispose();
    idController.dispose();
    doaController.dispose();
    emailController.dispose();
    madenController.dispose();
    promoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: CustomPaint(
        painter: BackgroundPainter2(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  _headerText(context),
                  SizedBox(height: 16.h),
                  _chooseName(),
                  SizedBox(height: 16.h),
                  _preferedTextFied(),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: "Id Number",
                    controller: idController,
                    inputType: defaultTargetPlatform == TargetPlatform.iOS
                        ? const TextInputType.numberWithOptions(
                            decimal: true, signed: true)
                        : TextInputType.number,
                    formatter: FilteringTextInputFormatter.digitsOnly,
                    onValidate: (value) {
                      return Validator().validateId(value);
                    },
                  ),
                  SizedBox(height: 16.h),
                  _dateTextField(context),
                  SizedBox(height: 16.h),
                  const ChooseGender(),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: "Email Address",
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    onValidate: (value) {
                      return Validator().validateEmail(value);
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: "Mother's Maden Name",
                    controller: madenController,
                    inputType: TextInputType.name,
                    onValidate: (value) {
                      return Validator().validateMaden(value);
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: "Refered/ Promo Code (Optional)",
                    controller: promoController,
                    inputType: defaultTargetPlatform == TargetPlatform.iOS
                        ? const TextInputType.numberWithOptions(
                            decimal: true, signed: true)
                        : TextInputType.number,
                    formatter: FilteringTextInputFormatter.digitsOnly,
                    onValidate: (value) {},
                  ),
                  SizedBox(height: 16.h),
                  _continueButton(context),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomTextField _preferedTextFied() {
    return CustomTextField(
      label: "Your Prefered Name",
      controller: idNameController,
      inputType: TextInputType.name,
      onValidate: (value) {
        return Validator().validateName(value);
      },
    );
  }

  SizedBox _headerText(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: TitleText(title: "Tell us more about yourself", fontSize: 32.sp),
    );
  }

  Widget _dateTextField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          label: const Text("Date of Birth"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          suffixIcon: const Icon(Icons.calendar_month)),
      readOnly: true,
      controller: doaController,
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1900),
          lastDate: DateTime(2200),
        );
        if (date != null) {
          final formattedDate = DateFormat('yyyy-MM-dd').format(date);
          doaController.text = formattedDate;
        }
      },
      validator: (value) {
        return Validator().validateDoa(value);
      },
    );
  }

  Widget _chooseName() {
    return Row(
      children: [
        SizedBox(
          width: 90.w,
          height: 60.h,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r)),
                fillColor: Colors.white,
                filled: true),
            elevation: 10,
            hint: Text(
              "Choose Semester",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            isExpanded: true,
            value: mrType[0],
            borderRadius: BorderRadius.circular(10.r),
            items: [
              ...mrType
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList()
            ],
            onChanged: (item) {},
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: CustomTextField(
            label: "Your name? (As per ID)",
            controller: idNameController,
            inputType: TextInputType.name,
            onValidate: (value) {
              return Validator().validateIdName(value);
            },
          ),
        )
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      leadingWidth: 80.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0.w),
        child: BackArrowButton(
          onTap: () => Navigator.pop(context),
        ),
      ),
      actions: [
        ProfileIconButton(onTap: () {}),
        SizedBox(width: 20.w),
      ],
    );
  }

  SizedBox _continueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          if (_globalKey.currentState!.validate()) {
            Navigator.pushNamed(
              context,
              "/success",
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainBlue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0.r)),
          ),
        ),
        child: const Text("Continue"),
      ),
    );
  }
}
