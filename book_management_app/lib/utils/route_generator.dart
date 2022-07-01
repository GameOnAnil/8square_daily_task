import 'package:authentication/ui/screens/login_page.dart';
import 'package:authentication/ui/screens/signup_page.dart';
import 'package:book_management_app/ui/home/screens/add_books_page.dart';
import 'package:book_management_app/ui/home/screens/home_page.dart';
import 'package:book_management_app/ui/splash/screens/auth_wrapper_page.dart';
import 'package:book_management_app/ui/splash/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: ((context) => const AuthWrapperPage()));
      case '/splash':
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
      case '/login':
        return MaterialPageRoute(builder: ((context) => const LoginPage()));
      case '/signup':
        return MaterialPageRoute(builder: ((context) => const SignUpPage()));
      case '/home':
        return MaterialPageRoute(
            builder: ((context) => HomePage(
                  userCredential: args as User,
                )));
      // case '/bookList':
      //   return MaterialPageRoute(
      //     builder: ((context) => BookListPage(
      //           category: args as Category,
      //         )),
      //   );
      case '/addBook':
        return MaterialPageRoute(
          builder: ((context) => AddBooksPage(
                categoryId: args as int,
              )),
        );
      default:
        return MaterialPageRoute(builder: ((context) {
          return const Scaffold(
            body: Center(child: Text("ERROR:")),
          );
        }));
    }
  }
}
