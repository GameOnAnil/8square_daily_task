import 'package:book_management_app/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child:
              Lottie.asset('assets/json/splashanimation.json', repeat: false),
        ),
        RichText(
          text: TextSpan(children: [
            const TextSpan(
              text: "B",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.orange),
            ),
            TextSpan(
              text: "ook",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: MyColors.splashBlue,
              ),
            ),
            const TextSpan(
              text: "M",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.orange),
            ),
            TextSpan(
              text: "anagement",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: MyColors.splashBlue,
              ),
            ),
            const TextSpan(
              text: "A",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.orange),
            ),
            TextSpan(
              text: "pp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: MyColors.splashBlue,
              ),
            ),
          ]),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .35,
        ),
      ],
    ));
  }
}
