import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePhoneNumberPage extends StatefulWidget {
  const ChangePhoneNumberPage({super.key});

  @override
  State<ChangePhoneNumberPage> createState() => _ChangePhoneNumberPageState();
}

class _ChangePhoneNumberPageState extends State<ChangePhoneNumberPage> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void sendPhoneNumber() {
    FocusScope.of(context).unfocus();

    final phoneNumber = phoneController.text.trim();
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Masukkan nomor HP baru")));
      return;
    }

    if (digitsOnly.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nomor HP minimal 10 digit")),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      "/verify-phone",
      arguments: {
        "phoneNumber": phoneNumber,
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
                      "Ubah Nomor Hp",
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
              left: 18,
              child: Text(
                "Masukan Nomor Baru",
                style: TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 13.5,
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
                height: 49,
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  cursorColor: green,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Nomor Hp",
                    hintStyle: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF7A7A7A),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 18, right: 13),
                      child: Icon(
                        Icons.phone,
                        size: 21,
                        color: Color(0xFF777777),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(minWidth: 50),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
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
                  onPressed: sendPhoneNumber,
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
                      fontSize: 14,
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
