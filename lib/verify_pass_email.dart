import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyPassEmailPage extends StatefulWidget {
  const VerifyPassEmailPage({super.key});

  @override
  State<VerifyPassEmailPage> createState() => _VerifyPassEmailPageState();
}

class _VerifyPassEmailPageState extends State<VerifyPassEmailPage> {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> otpFocus = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in otpControllers) {
      controller.dispose();
    }

    for (final focus in otpFocus) {
      focus.dispose();
    }

    super.dispose();
  }

  void verifyCode() {
    final code = otpControllers.map((controller) => controller.text).join();

    if (code.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Masukkan kode verifikasi dengan lengkap"),
        ),
      );
      return;
    }

    Navigator.pushNamed(context, "/new-password");
  }

  void resendCode() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Kode verifikasi telah dikirim ulang")),
    );
  }

  Widget otpField(int index) {
    return SizedBox(
      width: 78,
      height: 76,
      child: TextField(
        controller: otpControllers[index],
        focusNode: otpFocus[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: const TextStyle(
          fontFamily: "Kanit",
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: const Color(0xFFFCFCFC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Color(0xFFD0D0D0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Color(0xFF1A6556), width: 1.3),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            otpFocus[index + 1].requestFocus();
          }

          if (value.isEmpty && index > 0) {
            otpFocus[index - 1].requestFocus();
          }
        },
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
            clipper: VerifyPassEmailHeaderClipper(),
            child: Container(
              width: double.infinity,
              height: 300,
              color: const Color(0xFFDCEAE8),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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

                  const SizedBox(height: 60),

                  const Row(
                    children: [
                      Icon(Icons.check, size: 23, color: Colors.black),
                      SizedBox(width: 15),
                      Text(
                        "VERIFIKASI",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "lib/images/phonechat_icon.svg",
                        width: 32,
                        height: 32,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 13,
                              color: Colors.black,
                              height: 1.25,
                            ),
                            children: [
                              TextSpan(
                                text: "Periksa dan ketik kode verifikasi yang telah dikirimkan\nke ",
                              ),
                              TextSpan(
                                text: "contohsample@gmail.com",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 41),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      otpField(0),
                      otpField(1),
                      otpField(2),
                      otpField(3),
                    ],
                  ),

                  const SizedBox(height: 31),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        "/verify-pass-phone",
                      );
                    },
                    child: const Text(
                      "Verifikasi menggunakan No. Hp",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 13,
                        color: Color(0xFF00BCE4),
                      ),
                    ),
                  ),

                  const SizedBox(height: 31),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: verifyCode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A6556),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        "KIRIM",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  Center(
                    child: GestureDetector(
                      onTap: resendCode,
                      child: const Text(
                        "Kirim Ulang Kode",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 12,
                          color: Color(0xFF1A6556),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyPassEmailHeaderClipper extends CustomClipper<Path> {
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
