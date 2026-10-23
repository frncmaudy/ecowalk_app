import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);

    const bodyStyle = TextStyle(
      fontFamily: "Kanit",
      fontSize: 13,
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
              // Header
              Container(
                height: 54,
                width: double.infinity,
                color: green,
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
                      "Tentang Kami",
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

              // Konten tanpa scroll
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: constraints.maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Logo ECOWALK
                              Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(
                                  "lib/images/ecowalk_green.svg",
                                  width: 45,
                                  height: 14,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Deskripsi aplikasi
                              const Text(
                                "ECOWALK adalah aplikasi wisata yang membantu "
                                "pengguna menemukan destinasi terbaik dengan "
                                "rekomendasi berdasarkan lokasi, perbandingan "
                                "harga, serta informasi transportasi.",
                                style: bodyStyle,
                              ),

                              const SizedBox(height: 20),

                              // Misi Kami
                              const Text(
                                "Misi Kami",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 13.5,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 1,
                                ),
                              ),

                              const Text(
                                "Menyediakan pengalaman wisata yang lebih "
                                "mudah, informatif, dan terjangkau bagi semua "
                                "orang dengan fokus pada ekowisata yang ramah "
                                "lingkungan.",
                                style: bodyStyle,
                              ),

                              const SizedBox(height: 20),

                              // Apa yang kami tawarkan
                              const Text(
                                "Apa yang Kami Tawarkan?",
                                style: bodyStyle,
                              ),

                              const AboutBulletText(
                                text:
                                    "Rekomendasi tempat wisata berdasarkan "
                                    "lokasi dan preferensi Anda.",
                              ),

                              const AboutBulletText(
                                text:
                                    "Informasi harga tiket, ketersediaan "
                                    "fasilitas, dan ulasan pengguna.",
                              ),

                              const AboutBulletText(
                                text:
                                    "Peta interaktif untuk membantu navigasi "
                                    "di area wisata.",
                              ),

                              const AboutBulletText(
                                text:
                                    "Perbandingan harga transportasi untuk "
                                    "perjalanan yang lebih hemat.",
                              ),

                              const SizedBox(height: 2),

                              // Penutup
                              const Text(
                                "Kami percaya bahwa menjelajahi dunia harus "
                                "menjadi pengalaman yang menyenangkan dan "
                                "mudah diakses oleh semua orang, dengan tetap "
                                "menjaga kelestarian lingkungan.",
                                style: bodyStyle,
                              ),

                              const SizedBox(height: 2),

                              const Text(
                                "Untuk pertanyaan atau saran, hubungi kami di:",
                                style: bodyStyle,
                              ),

                              const SizedBox(height: 12),

                              // Email
                              const ContactRow(
                                icon: Icons.email,
                                text: "support@ecowalk.com",
                              ),

                              const SizedBox(height: 8),

                              // Nomor telepon
                              const ContactRow(
                                icon: Icons.phone,
                                text: "0899-1234-4567",
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Bullet dengan baris lanjutan sejajar dengan teks
class AboutBulletText extends StatelessWidget {
  final String text;

  const AboutBulletText({super.key, required this.text});

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

// Baris kontak
class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: "Kanit",
              fontSize: 13,
              color: Colors.black,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
