import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isVisibility = true;

  final String validUsername = "user123";
  final String validPassword = "user123";

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    FocusScope.of(context).unfocus();

    final username = usernameController.text.trim();
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nama pengguna dan kata sandi wajib diisi"),
        ),
      );
      return;
    }

    if (username == validUsername && password == validPassword) {
      Navigator.pushReplacementNamed(context, "/profile");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama pengguna atau kata sandi salah")),
      );
    }
  }

  InputDecoration inputDecoration({
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon, size: 20, color: const Color(0xFF858585)),
      suffixIcon: suffixIcon,
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
          height: contentHeight,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 140,
                left: 0,
                right: 0,
                child: Center(
                  child: SvgPicture.asset(
                    'lib/images/masuk_title.svg',
                    width: 81,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Positioned(
                top: 164,
                left: 0,
                right: 0,
                child: Center(
                  child: SvgPicture.asset(
                    'lib/images/ecowalk_green.svg',
                    width: 230,
                    height: 47,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const Positioned(
                top: 278,
                left: 16,
                child: Text(
                  "Nama Pengguna",
                  style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),

              Positioned(
                top: 302,
                left: 16,
                right: 16,
                child: SizedBox(
                  height: 47,
                  child: TextFormField(
                    controller: usernameController,
                    style: const TextStyle(fontFamily: "Kanit", fontSize: 13),
                    decoration: inputDecoration(icon: Icons.person),
                  ),
                ),
              ),

              const Positioned(
                top: 371,
                left: 16,
                child: Text(
                  "Kata Sandi",
                  style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),

              Positioned(
                top: 392,
                left: 16,
                right: 16,
                child: SizedBox(
                  height: 47,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: isVisibility,
                    style: const TextStyle(fontFamily: "Kanit", fontSize: 13),
                    decoration: inputDecoration(
                      icon: Icons.lock,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisibility = !isVisibility;
                          });
                        },
                        icon: Icon(
                          isVisibility
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: const Color(0xFF858585),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 493,
                left: 16,
                right: 16,
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: login,
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
                      "MASUK",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 560,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/forgotpass-email");
                    },
                    child: const Text(
                      "Lupa Kata Sandi?",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF00BCE4),
                      ),
                    ),
                  ),
                ),
              ),

              const Positioned(
                top: 620,
                left: 29,
                right: 29,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.7, color: Color(0xFFE0E0E0)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26),
                      child: Text(
                        "Atau",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 10,
                          color: Color(0xFF777777),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.7, color: Color(0xFFE0E0E0)),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 671,
                left: 16,
                right: 16,
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6F6F6),
                      foregroundColor: Colors.black,
                      elevation: 2,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'lib/images/google_logo.svg',
                          width: 22,
                          height: 22,
                        ),
                        const SizedBox(width: 14),
                        const Text(
                          "Lanjutkan dengan Google",
                          style: TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 130,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Tidak punya akun? ",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 12,
                        color: Color(0xFF444444),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text(
                        "Daftar disini",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 12,
                          color: Color(0xFF00BCE4),
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
    );
  }
}
