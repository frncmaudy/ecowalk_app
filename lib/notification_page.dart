import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Status bar
            Container(
              width: double.infinity,
              height: statusBarHeight,
              color: Colors.white,
            ),

            // Header
            Container(
              width: double.infinity,
              height: 54,
              color: primaryGreen,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    width: 48,
                    height: 54,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Positioned(
                    left: 48,
                    top: 14,
                    child: Text(
                      "Notifikasi",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 14, bottom: 28),
                children: [
                  _buildDestinationNotification(
                    context,
                    title: "Dunia Fantasi (DUFAN)",
                    date: "19 Febuari 2025",
                    transport: "Transportasi Umum",
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _buildDestinationNotification(
                    context,
                    title: "Dunia Fantasi (DUFAN)",
                    date: "19 Febuari 2025",
                    transport: "Transportasi Umum",
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _buildDestinationNotification(
                    context,
                    title: "Dunia Fantasi (DUFAN)",
                    date: "19 Febuari 2025",
                    transport: "Transportasi Umum",
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _buildDestinationNotification(
                    context,
                    title: "Dunia Fantasi (DUFAN)",
                    date: "19 Febuari 2025",
                    transport: "Transportasi Umum",
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _buildWeatherNotification(
                    context,
                    title: "Cuaca Sedang Cerah",
                    date: "19 Febuari 2025",
                    subtitle: "Yuk keluar dan jalan-jalan !",
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _buildDestinationNotification(
                    context,
                    title: "Dunia Fantasi (DUFAN)",
                    date: "19 Febuari 2025",
                    transport: "Transportasi Umum",
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
                  _buildDestinationNotification(
                    context,
                    title: "Dunia Fantasi (DUFAN)",
                    date: "19 Febuari 2025",
                    transport: "Transportasi Umum",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Notifikasi Destinasi
  Widget _buildDestinationNotification(
    BuildContext context, {
    required String title,
    required String date,
    required String transport,
  }) {
    const primaryGreen = Color(0xFF176E5E);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grey rounded rectangle placeholder
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 14),

          // Content info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 16.5,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF777777),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transport,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF444444),
                  ),
                ),
                const SizedBox(height: 3),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushNamed(context, "/triprecap");
                  },
                  child: const Text(
                    "Pergi Lagi",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF29B6F6),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Selesai badge
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 15,
                  color: primaryGreen,
                ),
                SizedBox(width: 4),
                Text(
                  "Selesai",
                  style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Notifikasi Cuaca
  Widget _buildWeatherNotification(
    BuildContext context, {
    required String title,
    required String date,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sun icon illustration
          SizedBox(
            width: 68,
            height: 68,
            child: Center(
              child: Image.asset(
                "lib/images/sun_icon.png",
                width: 60,
                height: 60,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.wb_sunny_rounded,
                    size: 52,
                    color: Color(0xFFFFD600),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Content info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 16.5,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF777777),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF444444),
                  ),
                ),
                const SizedBox(height: 3),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushNamed(context, "/category");
                  },
                  child: const Text(
                    "Lihat Destinasi Wisata",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF29B6F6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
