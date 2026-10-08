import 'package:flutter/material.dart';
import 'package:project1/splash_page.dart';
import 'package:project1/login_page.dart';

import 'register_page.dart';
import 'verify_email.dart';
import 'verify_phone.dart';
import 'forgotpass_email.dart';
import 'forgotpass_phone.dart';
import 'new_password.dart';
import 'verify_pass_email.dart';
import 'verify_pass_phone.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecowalk",
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/verify-email": (context) => const VerifyEmailPage(),
        "/verify-phone": (context) => const VerifyPhonePage(),
        "/forgotpass-email": (context) => const ForgotPassEmailPage(),
        "/forgotpass-phone": (context) => const ForgotPassPhonePage(),
        "/new-password": (context) => const NewPasswordPage(),
        "/verify-pass-email": (context) => const VerifyPassEmailPage(),
        "/verify-pass-phone": (context) => const VerifyPassPhonePage(),
        "/profile": (context) => const ProfilePage(),
      },
    );
  }
}
