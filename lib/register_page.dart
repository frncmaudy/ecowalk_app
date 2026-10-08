import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool agreeTerms = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Nama pengguna wajib diisi";
    }

    if (value.trim().length < 3) {
      return "Nama pengguna minimal 3 karakter";
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email wajib diisi";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return "Format email tidak valid";
    }

    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Nomor HP wajib diisi";
    }

    if (value.trim().length < 10) {
      return "Nomor HP tidak valid";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Kata sandi wajib diisi";
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

  void register() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Silakan setujui persyaratan terlebih dahulu"),
        ),
      );
      return;
    }

    Navigator.pushNamed(context, "/verify-email");
  }

  Widget inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    VoidCallback? toggle,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscure,
      cursorColor: const Color(0xFF1A6556),
      style: const TextStyle(
        fontFamily: "Kanit",
        fontSize: 13,
        color: Color(0xFF444444),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: "Kanit",
          fontSize: 13,
          fontStyle: FontStyle.italic,
          color: Color(0xFF818181),
        ),
        prefixIcon: Icon(icon, size: 21, color: const Color(0xFF777777)),
        suffixIcon: toggle == null
            ? null
            : IconButton(
                onPressed: toggle,
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: const Color(0xFF777777),
                ),
              ),
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        contentPadding: const EdgeInsets.symmetric(vertical: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFC2C2C2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFC2C2C2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1A6556), width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final contentHeight = screenHeight < 852 ? 852.0 : screenHeight;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SizedBox(
            width: double.infinity,
            height: contentHeight,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 119,
                      left: 80,
                      child: SvgPicture.asset(
                        "lib/images/buatakun_title.svg",
                        width: 129,
                        height: 16,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Positioned(
                      top: 143,
                      left: 80,
                      child: SvgPicture.asset(
                        "lib/images/ecowalk_green.svg",
                        width: 232,
                        height: 47,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Positioned(
                      top: 249,
                      left: 16,
                      right: 16,
                      child: inputField(
                        controller: usernameController,
                        hint: "Nama Pengguna",
                        icon: Icons.person,
                        validator: validateUsername,
                      ),
                    ),

                    Positioned(
                      top: 321,
                      left: 16,
                      right: 16,
                      child: inputField(
                        controller: emailController,
                        hint: "Email",
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                    ),

                    Positioned(
                      top: 390,
                      left: 16,
                      right: 16,
                      child: inputField(
                        controller: phoneController,
                        hint: "Nomor Hp",
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validator: validatePhone,
                      ),
                    ),

                    Positioned(
                      top: 461,
                      left: 16,
                      right: 16,
                      child: inputField(
                        controller: passwordController,
                        hint: "Kata Sandi",
                        icon: Icons.lock,
                        obscure: !passwordVisible,
                        validator: validatePassword,
                        toggle: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),

                    Positioned(
                      top: 530,
                      left: 16,
                      right: 16,
                      child: inputField(
                        controller: confirmPasswordController,
                        hint: "Konfirmasi Kata Sandi",
                        icon: Icons.lock,
                        obscure: !confirmPasswordVisible,
                        validator: validateConfirmPassword,
                        toggle: () {
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible;
                          });
                        },
                      ),
                    ),

                    Positioned(
                      top: 611,
                      left: 16,
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: Checkbox(
                          value: agreeTerms,
                          activeColor: const Color(0xFF1A6556),
                          checkColor: Colors.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          side: const BorderSide(
                            color: Color(0xFF666666),
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          onChanged: (value) {
                            setState(() {
                              agreeTerms = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),

                    Positioned(
                      top: 608,
                      left: 45,
                      right: 16,
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 13,
                            color: Color(0xFF666666),
                            height: 1.2,
                          ),
                          children: [
                            TextSpan(
                              text: "Saya telah membaca dan menyetujui ",
                            ),
                            TextSpan(
                              text: "persyaratan dan\n",
                              style: TextStyle(color: Color(0xFF38A8C7)),
                            ),
                            TextSpan(
                              text: "privasi pengguna",
                              style: TextStyle(color: Color(0xFF38A8C7)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 667,
                      left: 16,
                      right: 16,
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A6556),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            "BUAT AKUN",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 742,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Sudah punya akun? ",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 12,
                              color: Color(0xFF333333),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Masuk",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 12,
                                color: Color(0xFF38A8C7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
