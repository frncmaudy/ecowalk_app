import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PublicTransportPage extends StatelessWidget {
  const PublicTransportPage({super.key});

  static const primaryGreen = Color(0xFF176E5E);

  @override
  Widget build(BuildContext context) {
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
            // Status Bar
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
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Positioned(
                    left: 48,
                    top: 14,
                    child: Text(
                      "Rekomendasi",
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 190,
                          child: Image.asset(
                            "lib/images/transportasi_umum.png",
                            width: double.infinity,
                            height: 190,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFD9D9D9),
                                child: const Center(
                                  child: Icon(
                                    Icons.train,
                                    size: 48,
                                    color: Color(0xFF777777),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 16,
                          bottom: -13,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 4.5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFFD0D4DA),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.22),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2.5),
                                ),
                              ],
                            ),
                            child: const Text(
                              "Termurah",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 12.5,
                                fontWeight: FontWeight.w800,
                                color: primaryGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Title and Meta Info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "TRANSPORTASI UMUM",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 18.5,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Image.asset(
                                "lib/images/money_icon.png",
                                width: 17,
                                height: 12,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Rp. 0 - 20.000",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.black87,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "1 Jam 45 Menit",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Map View
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          height: 185,
                          color: const Color(0xFFE5E5E5),
                          child: Image.asset(
                            "lib/images/map_route.png",
                            width: double.infinity,
                            height: 185,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.map_outlined,
                                  size: 48,
                                  color: Color(0xFF888888),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Travel Analysis Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFE0E0E0),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.10),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Analisis Perjalanan",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 12),

                            // Analysis Section: Dibandingkan Transportasi Pribadi
                            _AnalysisSection(
                              title: "Dibandingkan Transportasi Pribadi",
                              rows: [
                                _AnalysisRow(
                                  label: "Waktu",
                                  value: "15 mnt Lebih lambat",
                                ),
                                _AnalysisRow(
                                  label: "Hemat",
                                  value: "Transportasi Umum",
                                ),
                                _AnalysisRow(
                                  label: "Kenyamanan",
                                  value: "Transportasi Pribadi",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Public Transport Options Heading
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Opsi Transportasi Umum",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Public Transport Options Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFE0E0E0),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _TransitOptionItem(
                              title: "TransJakarta",
                              duration: "± 40 menit",
                              iconImage: "lib/images/icon_transjakarta.png",
                              onTap: () {
                                Navigator.pushNamed(context, "/transjakarta");
                              },
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              indent: 14,
                              endIndent: 14,
                              color: Color(0xFFCDD1D7),
                            ),
                            _TransitOptionItem(
                              title: "MRT Jakarta",
                              duration: "± 25 menit",
                              iconImage: "lib/images/icon_mrt.png",
                              onTap: () {
                                Navigator.pushNamed(context, "/mrt");
                              },
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              indent: 14,
                              endIndent: 14,
                              color: Color(0xFFCDD1D7),
                            ),
                            _TransitOptionItem(
                              title: "LRT Jabodetabek",
                              duration: "± 30 menit",
                              iconImage: "lib/images/icon_lrt.png",
                              onTap: () {
                                Navigator.pushNamed(context, "/lrt");
                              },
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              indent: 14,
                              endIndent: 14,
                              color: Color(0xFFCDD1D7),
                            ),
                            _TransitOptionItem(
                              title: "KRL Commuter Line",
                              duration: "± 35 menit",
                              iconImage: "lib/images/icon_krl.png",
                              onTap: () {
                                Navigator.pushNamed(context, "/krl");
                              },
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              indent: 14,
                              endIndent: 14,
                              color: Color(0xFFCDD1D7),
                            ),
                            _TransitOptionItem(
                              title: "Mikrotrans (JakLingko)",
                              duration: "± 50 menit",
                              iconImage: "lib/images/icon_mikrotrans.png",
                              onTap: () {
                                Navigator.pushNamed(context, "/mikrotrans");
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Analysis Section
class _AnalysisSection extends StatelessWidget {
  final String title;
  final List<_AnalysisRow> rows;

  const _AnalysisSection({
    required this.title,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Kanit",
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: primaryGreen,
          ),
        ),
        const SizedBox(height: 6),
        for (int i = 0; i < rows.length; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rows[i].label,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 12.5,
                    color: Color(0xFF555555),
                  ),
                ),
                Text(
                  rows[i].value,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          if (i < rows.length - 1)
            const Divider(
              height: 10,
              thickness: 1,
              color: Color(0xFFCDD1D7),
            ),
        ],
      ],
    );
  }
}

class _AnalysisRow {
  final String label;
  final String value;

  const _AnalysisRow({
    required this.label,
    required this.value,
  });
}

// Transit Option Item
class _TransitOptionItem extends StatelessWidget {
  final String title;
  final String duration;
  final String? iconImage;
  final VoidCallback onTap;

  const _TransitOptionItem({
    required this.title,
    required this.duration,
    this.iconImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: iconImage != null
                    ? Image.asset(
                        iconImage!,
                        width: 18,
                        height: 18,
                        fit: BoxFit.contain,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    duration,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Detail",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

