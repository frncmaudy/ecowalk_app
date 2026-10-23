import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hideOldPassword = true;
  bool hideNewPassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void changePassword() {
    FocusScope.of(context).unfocus();

    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      return;
    }

    if (newPassword != confirmPassword) {
      return;
    }

    Navigator.pop(context);
  }

  Widget passwordField({
    required TextEditingController controller,
    required String hint,
    required bool obscureText,
    required VoidCallback onVisibilityTap,
  }) {
    const green = Color(0xFF176E5E);

    return SizedBox(
      height: 46,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: green,
        style: const TextStyle(
          fontFamily: "Kanit",
          fontSize: 14,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: "Kanit",
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Color(0xFF858585),
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 17, right: 13),
            child: Icon(Icons.lock, size: 19, color: Color(0xFF777777)),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 50),
          suffixIcon: GestureDetector(
            onTap: onVisibilityTap,
            child: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              size: 20,
              color: const Color(0xFF858585),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 48),
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFC6C6C6), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: green, width: 1),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 73,
              left: 0,
              right: 0,
              child: Container(
                height: 54,
                color: green,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 18),
                    const Text(
                      "Ubah Kata Sandi",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 165,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Kata Sandi Lama",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 7),

                  passwordField(
                    controller: oldPasswordController,
                    hint: "Kata Sandi Lama",
                    obscureText: hideOldPassword,
                    onVisibilityTap: () {
                      setState(() {
                        hideOldPassword = !hideOldPassword;
                      });
                    },
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/forgotpass-email");
                      },
                      child: const Text(
                        "Lupa Kata Sandi?",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF00BCE4),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Kata Sandi Baru",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 7),

                  passwordField(
                    controller: newPasswordController,
                    hint: "Kata Sandi Baru",
                    obscureText: hideNewPassword,
                    onVisibilityTap: () {
                      setState(() {
                        hideNewPassword = !hideNewPassword;
                      });
                    },
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    "Konfirmasi Kata Sandi",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 7),

                  passwordField(
                    controller: confirmPasswordController,
                    hint: "Konfirmasi Kata Sandi",
                    obscureText: hideConfirmPassword,
                    onVisibilityTap: () {
                      setState(() {
                        hideConfirmPassword = !hideConfirmPassword;
                      });
                    },
                  ),

                  const SizedBox(height: 78),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: changePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "UBAH",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
