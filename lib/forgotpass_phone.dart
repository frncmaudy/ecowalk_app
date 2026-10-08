import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassPhonePage extends StatefulWidget {
  const ForgotPassPhonePage({super.key});

  @override
  State<ForgotPassPhonePage> createState() => _ForgotPassPhonePageState();
}

class _ForgotPassPhonePageState extends State<ForgotPassPhonePage> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void submitPhone() {
    FocusScope.of(context).unfocus();

    final phone = phoneController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Nomor HP wajib diisi")));
      return;
    }

    if (phone.length < 10) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Nomor HP tidak valid")));
      return;
    }

    Navigator.pushNamed(context, "/verify-pass-phone");
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
              ClipPath(
                clipper: ForgotPassPhoneHeaderClipper(),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: const Color(0xFFDCEAE8),
                ),
              ),

              Positioned(
                top: 169,
                left: 0,
                right: 0,
                child: Center(
                  child: SvgPicture.asset(
                    "lib/images/ecowalk_green.svg",
                    width: 180,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Positioned(
                top: 232,
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

              Positioned(
                top: 313,
                left: 20,
                child: SvgPicture.asset(
                  "lib/images/bell_icon.svg",
                  width: 21,
                  height: 25,
                  fit: BoxFit.contain,
                ),
              ),

              const Positioned(
                top: 311,
                left: 52,
                right: 20,
                child: Text(
                  "Periksa dan masukan Nomor Hp untuk mendapatkan\nkode verifikasi",
                  style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 12,
                    height: 1.2,
                    color: Colors.black,
                  ),
                ),
              ),

              const Positioned(
                top: 405,
                left: 20,
                child: Text(
                  "Nomor Hp",
                  style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
              ),

              Positioned(
                top: 425,
                left: 20,
                right: 20,
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  cursorColor: const Color(0xFF1A6556),
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 14, bottom: 14),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF777777),
                        width: 1,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF1A6556),
                        width: 1.3,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 505,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      "/forgotpass-email",
                    );
                  },
                  child: const Text(
                    "Gunakan Email",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 12,
                      color: Color(0xFF00BCE4),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 560,
                left: 20,
                right: 20,
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: submitPhone,
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
                      "KIRIM",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 12,
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
    );
  }
}

class ForgotPassPhoneHeaderClipper extends CustomClipper<Path> {
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
