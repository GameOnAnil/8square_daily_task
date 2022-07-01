import 'package:flutter/material.dart';
import 'package:intern_task_week2/models/success_model.dart';
import 'package:intern_task_week2/ui/authentication/screens/login_page.dart';
import 'package:intern_task_week2/ui/home/screens/home_page.dart';
import 'package:intern_task_week2/ui/home/screens/success_page.dart';
import 'package:intern_task_week2/utils/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map? arguments = settings.arguments as Map?;
    switch (settings.name) {
      case Routes.loginPage:
        return MaterialPageRoute(builder: ((context) => const LoginPage()));
      case Routes.homePage:
        return MaterialPageRoute(
            builder: ((context) => HomePage(
                  phone: arguments!["phone"] as String,
                )));
      case Routes.successPage:
        return MaterialPageRoute(
            builder: ((context) => SuccessPage(
                  successModel: arguments!["successModel"] as Success,
                )));
      default:
        return MaterialPageRoute(builder: ((context) => const LoginPage()));
    }
  }
}
