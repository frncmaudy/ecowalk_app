import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrafficConditionsPage extends StatelessWidget {
  const TrafficConditionsPage({super.key});

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
        backgroundColor: const Color(0xFFF8F9FA),
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
                      "Kondisi Lalu Lintas",
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
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card 1: Kepadatan Keseluruhan
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFD0D4DA),
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEBF5F3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.traffic_rounded,
                              color: primaryGreen,
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Kepadatan Keseluruhan",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 13,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFF3E0),
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: const Color(0xFFFFB74D),
                                          width: 0.8,
                                        ),
                                      ),
                                      child: const Text(
                                        "Sedang",
                                        style: TextStyle(
                                          fontFamily: "Kanit",
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFE65100),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6),
                                      child: Text(
                                        "–",
                                        style: TextStyle(
                                          fontFamily: "Kanit",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFEBEE),
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: const Color(0xFFEF9A9A),
                                          width: 0.8,
                                        ),
                                      ),
                                      child: const Text(
                                        "Padat",
                                        style: TextStyle(
                                          fontFamily: "Kanit",
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFC62828),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Section Title: Detail Kondisi Jalan
                    const Text(
                      "Detail Kondisi Jalan",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Card 2: Detail Kondisi Jalan Items
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFD0D4DA),
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildRoadSegmentTile(
                            segment: "Klapanunggal → Cileungsi",
                            status: "Lancar",
                            statusColor: const Color(0xFF2E7D32),
                            statusBgColor: const Color(0xFFE8F5E9),
                            description: "Arus kendaraan relatif stabil.",
                            showDivider: true,
                          ),
                          _buildRoadSegmentTile(
                            segment: "Cileungsi → Jl. Alternatif Cibubur",
                            status: "Padat",
                            statusColor: const Color(0xFFC62828),
                            statusBgColor: const Color(0xFFFFEBEE),
                            description:
                                "Potensi perlambatan cukup tinggi pada jam sibuk.",
                            showDivider: true,
                          ),
                          _buildRoadSegmentTile(
                            segment: "Jl. Alternatif Cibubur → Harjamukti",
                            status: "Sedang",
                            statusColor: const Color(0xFFE65100),
                            statusBgColor: const Color(0xFFFFF3E0),
                            description:
                                "Lalu lintas masih bergerak dengan beberapa titik perlambatan.",
                            showDivider: true,
                          ),
                          _buildRoadSegmentTile(
                            segment: "Harjamukti → Trans Studio Cibubur",
                            status: "Lancar",
                            statusColor: const Color(0xFF2E7D32),
                            statusBgColor: const Color(0xFFE8F5E9),
                            description:
                                "Arus kendaraan relatif stabil mendekati lokasi tujuan.",
                            showDivider: false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Card 3: Jam Rawan Macet
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFD0D4DA),
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.access_time_filled,
                                size: 20,
                                color: Color(0xFFE53935),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Jam Rawan Macet",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildTimeSlotItem("06.30 – 09.00 WIB", "Pagi Hari"),
                          const SizedBox(height: 8),
                          _buildTimeSlotItem("16.30 – 19.30 WIB", "Sore Hari"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Card 4: Saran Perjalanan
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBF5F3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: primaryGreen.withValues(alpha: 0.35),
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.lightbulb_outline,
                              color: primaryGreen,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Saran Perjalanan",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: primaryGreen,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Hindari jam sibuk untuk mengurangi waktu tempuh dan konsumsi bahan bakar.",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 13.5,
                                    height: 1.4,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  static Widget _buildRoadSegmentTile({
    required String segment,
    required String status,
    required Color statusColor,
    required Color statusBgColor,
    required String description,
    required bool showDivider,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      segment,
                      style: const TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 12.5,
                  height: 1.35,
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 0.8,
            color: Color(0xFFEEEEEE),
            indent: 14,
            endIndent: 14,
          ),
      ],
    );
  }

  static Widget _buildTimeSlotItem(String time, String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFFEEEEEE),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFFE53935),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                time,
                style: const TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF222222),
                ),
              ),
            ],
          ),
          Text(
            tag,
            style: const TextStyle(
              fontFamily: "Kanit",
              fontSize: 12,
              color: Color(0xFF777777),
            ),
          ),
        ],
      ),
    );
  }
}

