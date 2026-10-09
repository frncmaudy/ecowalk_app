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
      style: const TextStyle(fontFamily: "Kanit", fontSize: 12),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: "Kanit",
          fontSize: 12,
          fontStyle: FontStyle.italic,
          color: Color(0xFF8A8A8A),
        ),

        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(Icons.lock, size: 18, color: Color(0xFF777777)),
        ),

        suffixIcon: IconButton(
          onPressed: toggle,
          icon: Icon(
            visible ? Icons.visibility : Icons.visibility_off,
            size: 18,
            color: const Color(0xFF888888),
          ),
        ),

        isDense: true,

        contentPadding: const EdgeInsets.symmetric(vertical: 12),

        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF777777)),
        ),

        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF1A6556), width: 1.3),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          ClipPath(
            clipper: NewPasswordHeaderClipper(),

            child: Container(
              width: double.infinity,
              height: 300,
              color: const Color(0xFFDCEAE8),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 23),

              child: Form(
                key: formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 115),

                    Center(
                      child: SvgPicture.asset(
                        "lib/images/ecowalk_green.svg",
                        width: 180,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Center(
                      child: SvgPicture.asset(
                        "lib/images/lupakatasandi_title.svg",
                        width: 198,
                        height: 16,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 80),

                    const Text(
                      "Masukan Kata Sandi Baru",

                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 35),

                    passwordField(
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

                    const SizedBox(height: 28),

                    passwordField(
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

                    const SizedBox(height: 55),

                    SizedBox(
                      width: double.infinity,

                      height: 45,

                      child: ElevatedButton(
                        onPressed: changePassword,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1A6556),

                          foregroundColor: Colors.white,

                          elevation: 0,

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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewPasswordHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 145);

    path.lineTo(size.width, 290);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
