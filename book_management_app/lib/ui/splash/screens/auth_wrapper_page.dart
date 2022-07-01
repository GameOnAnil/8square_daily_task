import 'package:authentication/services/auth_sevice.dart';
import 'package:authentication/ui/screens/login_page.dart';
import 'package:book_management_app/ui/home/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWrapperPage extends ConsumerWidget {
  const AuthWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(authServiceProvider).authStateChange,
      builder: ((context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.data != null) {
          return HomePage(userCredential: snapshot.data!);
        }
        return const LoginPage();
      }),
    );
  }
}
