import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Kata sandi baru wajib diisi";
    }

    if (value.length < 6) {
      return "Kata sandi minimal 6 karakter";
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Konfirmasi kata sandi wajib diisi";
    }

    if (value != passwordController.text) {
      return "Kata sandi tidak sama";
    }

    return null;
  }

  void changePassword() {
    FocusScope.of(context).unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Kata sandi berhasil diubah")));

    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  }

  Widget passwordField({
    required TextEditingController controller,
    required String hint,
    required bool visible,
    required VoidCallback toggle,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !visible,
      validator: validator,
      cursorColor: const Color(0xFF1A6556),
      style: const TextStyle(
        fontFamily: "Kanit",
        fontSize: 12,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: "Kanit",
          fontSize: 12,
          fontStyle: FontStyle.italic,
          color: Color(0xFF8A8A8A),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 6, right: 4),
          child: Icon(Icons.lock, size: 18, color: Color(0xFF777777)),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 22,
        ),
        suffixIcon: IconButton(
          onPressed: toggle,
          icon: Icon(
            visible ? Icons.visibility : Icons.visibility_off,
            size: 18,
            color: const Color(0xFF8A8A8A),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 34,
          minHeight: 22,
        ),
        isDense: true,
        contentPadding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 6,
          right: 6,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF777777), width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF1A6556), width: 1.3),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final contentHeight = screenHeight < 852 ? 852.0 : screenHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: contentHeight,
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                ClipPath(
                  clipper: NewPasswordHeaderClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 270,
                    color: const Color(0xFFDCEAE8),
                  ),
                ),

                Positioned(
                  top: 146,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SvgPicture.asset(
                      "lib/images/ecowalk_green.svg",
                      width: 160,
                      height: 46,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Positioned(
                  top: 204,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SvgPicture.asset(
                      "lib/images/lupakatasandi_title.svg",
                      width: 198,
                      height: 16,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const Positioned(
                  top: 302,
                  left: 23,
                  child: Text(
                    "Masukan Kata Sandi Baru",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),

                Positioned(
                  top: 346,
                  left: 23,
                  right: 23,
                  child: passwordField(
                    controller: passwordController,
                    hint: "Kata Sandi Baru",
                    visible: passwordVisible,
                    validator: validatePassword,
                    toggle: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),

                Positioned(
                  top: 405,
                  left: 23,
                  right: 23,
                  child: passwordField(
                    controller: confirmPasswordController,
                    hint: "Konfirmasi Kata Sandi",
                    visible: confirmPasswordVisible,
                    validator: validateConfirmPassword,
                    toggle: () {
                      setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      });
                    },
                  ),
                ),

                Positioned(
                  top: 523,
                  left: 23,
                  right: 23,
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: changePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A6556),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "UBAH KATA SANDI",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewPasswordHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 115);
    path.lineTo(size.width, 260);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
