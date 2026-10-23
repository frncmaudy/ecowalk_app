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
import 'edit_profile_page.dart';
import 'camera_profile_page.dart';
import 'editprofile_preview.dart';
import 'settings_page.dart';
import 'change_phonenumber.dart';
import 'change_email.dart';
import 'change_password.dart';
import 'terms_page.dart';
import 'privacy_policy.dart';
import 'about_us.dart';

void main() {
  runApp(const MyApp());
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
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),

        "/verify-email": (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;

          final args = arguments is Map ? arguments : null;

          return VerifyEmailPage(
            email: args?["email"] as String?,
            nextRoute: args?["nextRoute"] as String? ?? "/login",
            returnToExistingRoute:
                args?["returnToExistingRoute"] as bool? ?? false,
          );
        },

        "/verify-phone": (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;

          final args = arguments is Map ? arguments : null;

          return VerifyPhonePage(
            phoneNumber: args?["phoneNumber"] as String?,
            nextRoute: args?["nextRoute"] as String? ?? "/login",
            returnToExistingRoute:
                args?["returnToExistingRoute"] as bool? ?? false,
          );
        },

        "/forgotpass-email": (context) => const ForgotPassEmailPage(),
        "/forgotpass-phone": (context) => const ForgotPassPhonePage(),
        "/new-password": (context) => const NewPasswordPage(),
        "/verify-pass-email": (context) => const VerifyPassEmailPage(),
        "/verify-pass-phone": (context) => const VerifyPassPhonePage(),
        "/profile": (context) => const ProfilePage(),
        "/edit-profile": (context) => const EditProfilePage(),
        "/camera-profile": (context) => const CameraProfilePage(),
        "/editprofile-preview": (context) => const EditProfilePreviewPage(),
        "/settings": (context) => const SettingsPage(),
        "/change-phonenumber": (context) => const ChangePhoneNumberPage(),
        "/change-email": (context) => const ChangeEmailPage(),
        "/change-password": (context) => const ChangePasswordPage(),
        "/terms": (context) => const TermsPage(),
        "/privacy-policy": (context) => const PrivacyPolicy(),
        "/about-us": (context) => const AboutUs(),
      },
    );
  }
}
