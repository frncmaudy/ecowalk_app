import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({super.key});

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void sendEmail() {
    FocusScope.of(context).unfocus();

    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Masukkan email baru")));
      return;
    }

    Navigator.pushNamed(
      context,
      "/verify-email",
      arguments: {
        "email": email,
        "nextRoute": "/settings",
        "returnToExistingRoute": true,
      },
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
                      "Ubah Email",
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

            const Positioned(
              top: 165,
              left: 20,
              child: Text(
                "Masukan Email Baru",
                style: TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),

            Positioned(
              top: 188,
              left: 16,
              right: 16,
              child: SizedBox(
                height: 52,
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: green,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 13,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF7A7A7A),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 18, right: 13),
                      child: Icon(
                        Icons.email,
                        size: 21,
                        color: Color(0xFF777777),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(minWidth: 50),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    filled: true,
                    fillColor: const Color(0xFFFAFAFA),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFFC6C6C6),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: green, width: 1),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 305,
              left: 16,
              right: 16,
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: sendEmail,
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
                    "KIRIM",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
