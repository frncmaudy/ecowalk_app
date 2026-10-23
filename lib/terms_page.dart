import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 54,
              width: double.infinity,
              color: const Color(0xFF176E5E),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "Ketentuan Layanan",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 16.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "lib/images/ecowalk_green.svg",
                          width: 45,
                          height: 14,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        "KETENTUAN PENGGUNAAN APLIKASI ECOWALK",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 2),

                      const Text(
                        "Diperbaharui tanggal 16 Februari 2024",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 10.5,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF777777),
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        "Selamat datang di ECOWALK! Dengan menggunakan "
                        "aplikasi ini, Anda setuju dengan ketentuan dan "
                        "persyaratan berikut:",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "1. Dengan menggunakan aplikasi ECOWALK, Anda dapat "
                        "menemukan informasi tentang tempat wisata, rekomendasi "
                        "tempat, perbandingan harga, dan layanan peta berbasis lokasi.",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "2. Anda bertanggung jawab atas keakuratan data, "
                        "termasuk ulasan dan foto, yang Anda masukkan.",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "3. Perubahan Layanan ECOWALK berhak mengubah, "
                        "menambah, atau menghentikan layanan tanpa pemberitahuan "
                        "sebelumnya. Pengguna bertanggung jawab atas keamanan "
                        "akun mereka, termasuk kata sandi. Pengguna juga dilarang "
                        "menggunakan aplikasi untuk tujuan yang dapat merugikan "
                        "pihak lain.\n"
                        "Informasi yang diberikan oleh sumber seperti tiket "
                        "atau biaya transportasi tidak akurat, dan kami tidak "
                        "bertanggung jawab atas kesalahan tersebut.",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "4. Penolakan Tanggung Jawab",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),

                      const SizedBox(height: 4),

                      const BulletText(
                        text:
                            "ECOWALK hanya menyediakan informasi sebagai "
                            "referensi dan bukan penyedia layanan wisata "
                            "atau transportasi.",
                      ),

                      const SizedBox(height: 4),

                      const BulletText(
                        text:
                            "Kami tidak bertanggung jawab atas perubahan "
                            "harga, ketersediaan tempat, atau keterlambatan "
                            "transportasi.",
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "Dengan menggunakan aplikasi ini, Anda menyetujui "
                        "semua ketentuan di atas.",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13,
                          color: Colors.black,
                          height: 1.8,
                        ),
                      ),
                    ],
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

class BulletText extends StatelessWidget {
  final String text;

  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 12,
          child: Text(
            "•",
            style: TextStyle(
              fontFamily: "Kanit",
              fontSize: 13,
              height: 1.8,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: "Kanit",
              fontSize: 13,
              height: 1.8,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
