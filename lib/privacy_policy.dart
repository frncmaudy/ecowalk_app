import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);

    const bodyStyle = TextStyle(
      fontFamily: "Kanit",
      fontSize: 12.5,
      color: Colors.black,
      height: 1.8,
    );

    const sectionStyle = TextStyle(
      fontFamily: "Kanit",
      fontSize: 12.5,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.8,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 54,
                width: double.infinity,
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
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Text(
                      "Kebijakan Privasi",
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
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

                      const SizedBox(height: 25),

                      const Text(
                        "\nKEBIJAKAN PRIVASI APLIKASI ECOWALK",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 13.5,
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
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF777777),
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Kami menghargai privasi pengguna. Kebijakan ini "
                        "menjelaskan bagaimana ECOWALK mengumpulkan, "
                        "menggunakan, dan melindungi data Anda.",
                        style: bodyStyle,
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "1. Data yang Kami Kumpulkan",
                        style: sectionStyle,
                      ),

                      const SizedBox(height: 2),

                      const Text(
                        "Kami dapat mengumpulkan data berikut:",
                        style: bodyStyle,
                      ),

                      const PrivacyBulletText(
                        text: "Data Pribadi: Nama, email, dan informasi akun.",
                      ),

                      const PrivacyBulletText(
                        text: "Data Lokasi: Untuk memberikan rekomendasi wisata dan perhitungan jarak.",
                      ),

                      const PrivacyBulletText(
                        text: "Ulasan dan Foto: Jika Anda memposting ulasan atau berbagi pengalaman wisata.",
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "2. Cara Kami Menggunakan Data",
                        style: sectionStyle,
                      ),

                      const SizedBox(height: 2),

                      const PrivacyBulletText(
                        text: "Memberikan rekomendasi tempat wisata berdasarkan lokasi.",
                      ),

                      const PrivacyBulletText(
                        text: "Memproses pencarian dan filter destinasi sesuai preferensi.",
                      ),

                      const PrivacyBulletText(
                        text: "Menampilkan ulasan dan foto yang dibagikan pengguna lain.",
                      ),

                      const PrivacyBulletText(
                        text: "Menyediakan informasi transportasi berdasarkan data lokasi.",
                      ),

                      const SizedBox(height: 22),

                      const Text("3. Keamanan Data", style: sectionStyle),

                      const SizedBox(height: 2),

                      const Text(
                        "Kami menggunakan enkripsi dan metode keamanan lainnya "
                        "untuk melindungi data Anda.",
                        style: bodyStyle,
                      ),

                      const SizedBox(height: 22),

                      const Text("4. Hak Pengguna", style: sectionStyle),

                      const SizedBox(height: 2),

                      const PrivacyBulletText(
                        text: "Anda dapat memperbarui atau menghapus informasi akun kapan saja.",
                      ),

                      const PrivacyBulletText(
                        text: "Anda dapat menonaktifkan fitur lokasi jika tidak ingin berbagi data lokasi.",
                      ),

                      const PrivacyBulletText(
                        text: "Kami tidak akan membagikan data pribadi Anda kepada \npihak ketiga tanpa izin.",
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "Jika Anda memiliki pertanyaan mengenai kebijakan ini, "
                        "silakan hubungi:",
                        style: bodyStyle,
                      ),

                      const SizedBox(height: 8),

                      const Row(
                        children: [
                          Icon(Icons.email, size: 17, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            "privacy@ecowalk.com",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 12.5,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
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

class PrivacyBulletText extends StatelessWidget {
  final String text;

  const PrivacyBulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 18,
          child: Text(
            "•",
            style: TextStyle(
              fontFamily: "Kanit",
              fontSize: 12.5,
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
              fontSize: 12.5,
              height: 1.8,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
