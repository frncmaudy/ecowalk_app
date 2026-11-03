import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TransitDepartureType {
  transjakarta,
  mrt,
  lrt,
  krl,
  mikrotrans,
  ojekOnline,
  taxi,
}

class DeparturePage extends StatelessWidget {
  final TransitDepartureType mode;

  const DeparturePage({
    super.key,
    this.mode = TransitDepartureType.transjakarta,
  });

  static const primaryGreen = Color(0xFF176E5E);

  TransitDepartureType _resolveMode(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is TransitDepartureType) return args;
    if (args is String) {
      switch (args.toLowerCase()) {
        case 'mrt':
          return TransitDepartureType.mrt;
        case 'lrt':
          return TransitDepartureType.lrt;
        case 'krl':
          return TransitDepartureType.krl;
        case 'mikrotrans':
          return TransitDepartureType.mikrotrans;
        case 'ojek-online':
        case 'ojol':
          return TransitDepartureType.ojekOnline;
        case 'taxi':
        case 'taksi':
          return TransitDepartureType.taxi;
        default:
          return TransitDepartureType.transjakarta;
      }
    }
    return mode;
  }

  @override
  Widget build(BuildContext context) {
    final currentMode = _resolveMode(context);
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
        backgroundColor: primaryGreen,
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
                      "Keberangkatan",
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
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    // Map
                    SizedBox(
                      width: double.infinity,
                      height: 350,
                      child: Image.asset(
                        "lib/images/departure_map.png",
                        width: double.infinity,
                        height: 350,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFE5E3DF),
                            child: const Center(
                              child: Icon(
                                Icons.map_outlined,
                                size: 48,
                                color: Color(0xFF888888),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Cards List
                    Transform.translate(
                      offset: const Offset(0, -60),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          children: _buildCardsForMode(currentMode),
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

  static Widget _buildTimeWidget(String value, String unit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(
            fontFamily: "Kanit",
            fontSize: value.length > 3 ? 18 : 24,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            height: 1.0,
          ),
        ),
        Text(
          unit,
          style: const TextStyle(
            fontFamily: "Kanit",
            fontSize: 11,
            fontWeight: FontWeight.normal,
            color: Color(0xFF555555),
          ),
        ),
      ],
    );
  }

  static Widget _buildTextTimeWidget(String time) {
    return Text(
      time,
      style: const TextStyle(
        fontFamily: "Kanit",
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    );
  }

  List<Widget> _buildCardsForMode(TransitDepartureType mode) {
    switch (mode) {
      case TransitDepartureType.mrt:
        return [
          // MRT Card 1
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "MRT",
            routeText: "Lebak Bulus Grab → Bundaran HI Bank DKI",
            statusText: "Terdekat",
            statusColor: const Color(0xFF2E7D32),
            isStatusBold: true,
            substatusText: "Bisa berubah tergantung kepadatan penumpang",
            timeWidget: _buildTimeWidget("5", "mnt"),
          ),
          const SizedBox(height: 12),

          // MRT Card 2
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "MRT",
            routeText: "Lebak Bulus Grab → Bundaran HI Bank DKI",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kondisi operasional",
            timeWidget: _buildTimeWidget("10", "mnt"),
          ),
          const SizedBox(height: 12),

          // MRT Card 3
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "MRT",
            routeText: "Bundaran HI Bank DKI → Lebak Bulus Grab",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kondisi operasional",
            timeWidget: _buildTimeWidget("15", "mnt"),
          ),
          const SizedBox(height: 12),

          // MRT Card 4
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "MRT",
            routeText: "Lebak Bulus Grab → Bundaran HI Bank DKI",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kondisi operasional",
            timeWidget: _buildTimeWidget("20", "mnt"),
          ),
        ];

      case TransitDepartureType.lrt:
        return [
          // LRT Card 1
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "LRT",
            routeText: "Dukuh Atas BNI → Harjamukti",
            statusText: "Terdekat",
            statusColor: const Color(0xFF2E7D32),
            isStatusBold: true,
            substatusText: "Bisa berubah tergantung kondisi operasional",
            timeWidget: _buildTextTimeWidget("14.08"),
          ),
          const SizedBox(height: 12),

          // LRT Card 2
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "LRT",
            routeText: "Dukuh Atas BNI → Harjamukti",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kondisi operasional",
            timeWidget: _buildTextTimeWidget("14.12"),
          ),
          const SizedBox(height: 12),

          // LRT Card 3
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "LRT",
            routeText: "Dukuh Atas BNI → Jatimulya",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kondisi operasional",
            timeWidget: _buildTextTimeWidget("14.19"),
          ),
          const SizedBox(height: 12),

          // LRT Card 4
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "LRT",
            routeText: "Dukuh Atas BNI → Harjamukti",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kondisi operasional",
            timeWidget: _buildTextTimeWidget("14.23"),
          ),
        ];

      case TransitDepartureType.krl:
        return [
          // KRL Card 1
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "KRL",
            routeText: "Bogor Line • Manggarai → Jakarta Kota",
            statusText: "Terdekat",
            statusColor: const Color(0xFF2E7D32),
            isStatusBold: true,
            substatusText: "Waktu keberangkatan menyesuaikan perjalanan kereta",
            timeWidget: _buildTimeWidget("±5–10", "mnt"),
          ),
          const SizedBox(height: 12),

          // KRL Card 2
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "KRL",
            routeText: "Bogor Line • Manggarai → Bogor",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Bisa berubah sesuai perjalanan kereta",
            timeWidget: _buildTimeWidget("±10–15", "mnt"),
          ),
          const SizedBox(height: 12),

          // KRL Card 3
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "KRL",
            routeText: "Cikarang Line • Manggarai → Bekasi/Cikarang",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Periksa kembali tujuan kereta sebelum naik",
            timeWidget: _buildTimeWidget("±15–20", "mnt"),
          ),
          const SizedBox(height: 12),

          // KRL Card 4
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "KRL",
            routeText: "Bogor Line • Manggarai → Jakarta Kota",
            statusText: "Dijadwalkan",
            statusColor: const Color(0xFF757575),
            substatusText: "Bisa berubah sesuai perjalanan kereta",
            timeWidget: _buildTimeWidget("±20–30", "mnt"),
          ),
        ];

      case TransitDepartureType.mikrotrans:
        return [
          // Mikrotrans Card 1
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "JAK28",
            routeText: "Pasar Rebo → Stasiun LRT Harjamukti",
            statusText: "Terdekat",
            statusColor: const Color(0xFF2E7D32),
            isStatusBold: true,
            substatusText: "Estimasi dapat berubah tergantung lalu lintas",
            timeWidget: _buildTimeWidget("±5–10", "mnt"),
          ),
          const SizedBox(height: 12),

          // Mikrotrans Card 2
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "JAK73",
            routeText: "Jambore Cibubur → Pasar Rebo",
            statusText: "Menunggu armada",
            statusColor: const Color(0xFF757575),
            substatusText: "Estimasi dapat berubah tergantung lalu lintas",
            timeWidget: _buildTimeWidget("±10–15", "mnt"),
          ),
          const SizedBox(height: 12),

          // Mikrotrans Card 3
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "JAK46",
            routeText: "Jagakarsa → Pasar Minggu",
            statusText: "Menunggu armada",
            statusColor: const Color(0xFF757575),
            substatusText: "Estimasi dapat berubah tergantung lalu lintas",
            timeWidget: _buildTimeWidget("±15–20", "mnt"),
          ),
          const SizedBox(height: 12),

          // Mikrotrans Card 4
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "JAK03",
            routeText: "Lebak Bulus → Andara",
            statusText: "Menunggu armada",
            statusColor: const Color(0xFF757575),
            substatusText: "Estimasi dapat berubah tergantung lalu lintas",
            timeWidget: _buildTimeWidget("±20–25", "mnt"),
          ),
        ];

      case TransitDepartureType.transjakarta:
        return [
          // Card 1: Delayed
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Koridor",
            routeText: "Ta → Kota",
            statusText: "Terlambat 11 mnt",
            statusColor: const Color(0xFFE53935),
            isStatusBold: true,
            substatusText: "Bisa berubah tergantung kepadatan lalu lintas",
            timeWidget: _buildTimeWidget("11", "mnt"),
          ),
          const SizedBox(height: 12),

          // Card 2
          const _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Bus 2",
            routeText: "lorem ipsum → blablabla",
            statusText: "Dijadwalkan",
            statusColor: Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kepadatan lalu lintas",
            timeWidget: Text(
              "23.23",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 3
          const _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Bus 2",
            routeText: "lorem ipsum → blablabla",
            statusText: "Dijadwalkan",
            statusColor: Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kepadatan lalu lintas",
            timeWidget: Text(
              "23.23",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 4
          const _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Bus 2",
            routeText: "lorem ipsum → blablabla",
            statusText: "Dijadwalkan",
            statusColor: Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kepadatan lalu lintas",
            timeWidget: Text(
              "23.23",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 5
          const _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Bus 2",
            routeText: "lorem ipsum → blablabla",
            statusText: "Dijadwalkan",
            statusColor: Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kepadatan lalu lintas",
            timeWidget: Text(
              "23.23",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Card 6
          const _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Bus 2",
            routeText: "lorem ipsum → blablabla",
            statusText: "Dijadwalkan",
            statusColor: Color(0xFF757575),
            substatusText: "Bisa berubah tergantung kepadatan lalu lintas",
            timeWidget: Text(
              "23.23",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        ];

      case TransitDepartureType.ojekOnline:
        return [
          // Ojol Card 1: Tercepat
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Tercepat",
            routeText: "Driver terdekat → Titik Jemput",
            statusText: "Estimasi jemput: ±3–5 menit",
            statusColor: const Color(0xFF2E7D32),
            isStatusBold: true,
            descriptionText:
                "Cocok untuk perjalanan yang mengutamakan waktu penjemputan.",
            availableOptions: const [
              "Gojek GoRide CEPAAAT",
              "Grab GrabBike",
            ],
            substatusText:
                "Estimasi dapat berubah tergantung posisi dan ketersediaan pengemudi",
            timeWidget: _buildTimeWidget("±3–5", "mnt"),
          ),
          const SizedBox(height: 12),

          // Ojol Card 2: Reguler
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Reguler",
            routeText: "Driver tersedia → Titik Jemput",
            statusText: "Estimasi jemput: ±5–7 menit",
            statusColor: const Color(0xFF555555),
            isStatusBold: false,
            descriptionText:
                "Pilihan standar dengan keseimbangan antara harga dan waktu tunggu.",
            availableOptions: const [
              "Grab GrabBike",
              "Maxim Bike",
            ],
            substatusText:
                "Estimasi dapat berubah tergantung kondisi lalu lintas",
            timeWidget: _buildTimeWidget("±5–7", "mnt"),
          ),
          const SizedBox(height: 12),

          // Ojol Card 3: Hemat ⭐ Rekomendasi EcoWalk
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Hemat",
            secondaryBadgeText: "Rekomendasi EcoWalk",
            routeText: "Driver tersedia → Titik Jemput",
            statusText: "Estimasi jemput: ±6–10 menit",
            statusColor: const Color(0xFF176E5E),
            isStatusBold: true,
            descriptionText:
                "Pilihan dengan estimasi biaya lebih rendah dan waktu tunggu sedikit lebih lama.",
            availableOptions: const [
              "Gojek GoRide MURAAAH",
              "Grab GrabBike Hemat",
              "Maxim Bike",
            ],
            substatusText:
                "Estimasi dapat berubah tergantung ketersediaan pengemudi",
            timeWidget: _buildTimeWidget("±6–10", "mnt"),
          ),
          const SizedBox(height: 12),

          // Ojol Card 4: Nyaman
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Nyaman",
            routeText: "Driver tersedia → Titik Jemput",
            statusText: "Estimasi jemput: ±5–8 menit",
            statusColor: const Color(0xFF2E7D32),
            isStatusBold: true,
            descriptionText:
                "Mengutamakan kenyamanan untuk perjalanan jarak dekat maupun lebih jauh.",
            availableOptions: const [
              "Gojek GoRide Comfort",
              "Grab GrabBike XL",
            ],
            substatusText: "Waktu tunggu dapat berubah pada jam sibuk",
            timeWidget: _buildTimeWidget("±5–8", "mnt"),
          ),
        ];

      case TransitDepartureType.taxi:
        return [
          // Taxi Card 1: Reguler ⭐ Rekomendasi
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Reguler",
            secondaryBadgeText: "Rekomendasi",
            routeText: "Mobil tersedia → Titik Jemput",
            statusText: "Estimasi jemput: ±5–8 menit",
            statusColor: const Color(0xFF176E5E),
            isStatusBold: true,
            descriptionText: "Pilihan standar untuk perjalanan sehari-hari.",
            availableOptions: const [
              "Gojek GoCar Reguler / GoCar CEPAAAT",
              "Grab Car Standard",
              "Bluebird Bluebird",
            ],
            substatusText:
                "Estimasi dapat berubah tergantung kondisi lalu lintas",
            timeWidget: _buildTimeWidget("±5–8", "mnt"),
          ),
          const SizedBox(height: 12),

          // Taxi Card 2: Hemat
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Hemat",
            routeText: "Mobil tersedia → Titik Jemput",
            statusText: "Estimasi jemput: ±7–12 menit",
            statusColor: const Color(0xFF555555),
            isStatusBold: false,
            descriptionText:
                "Mengutamakan harga perjalanan yang lebih terjangkau.",
            availableOptions: const [
              "Gojek GoCar MURAAAH",
              "Grab GrabCar Hemat",
            ],
            substatusText:
                "Estimasi dapat berubah tergantung ketersediaan armada",
            timeWidget: _buildTimeWidget("±7–12", "mnt"),
          ),
          const SizedBox(height: 12),

          // Taxi Card 3: Kapasitas Besar
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Kapasitas Besar",
            routeText: "Mobil tersedia → Titik Jemput",
            statusText: "Estimasi jemput: ±7–12 menit",
            statusColor: const Color(0xFF2E7D32),
            isStatusBold: true,
            descriptionText:
                "Cocok untuk penumpang lebih banyak atau membawa barang.",
            availableOptions: const [
              "Gojek GoCar (L)",
              "Grab Car Standard 6 Kursi / XL",
              "Grab Car Plus",
            ],
            substatusText:
                "Estimasi dapat berubah tergantung ketersediaan kendaraan besar",
            timeWidget: _buildTimeWidget("±7–12", "mnt"),
          ),
          const SizedBox(height: 12),

          // Taxi Card 4: Premium
          _DepartureCard(
            title: "Keberangkatan",
            badgeText: "Premium",
            routeText: "Mobil premium → Titik Jemput",
            statusText: "Estimasi jemput: ±8–15 menit",
            statusColor: const Color(0xFF2E7D32),
            isStatusBold: true,
            descriptionText:
                "Pilihan kendaraan dengan tingkat kenyamanan lebih tinggi.",
            availableOptions: const [
              "Grab Car Premium",
              "Bluebird Bluebird Prime",
              "Bluebird Silverbird",
            ],
            substatusText:
                "Waktu tunggu bergantung pada ketersediaan kendaraan premium",
            timeWidget: _buildTimeWidget("±8–15", "mnt"),
          ),
        ];
    }
  }
}

// Departure Card
class _DepartureCard extends StatelessWidget {
  final String title;
  final String badgeText;
  final String? secondaryBadgeText;
  final String routeText;
  final String statusText;
  final Color statusColor;
  final bool isStatusBold;
  final String? descriptionText;
  final List<String>? availableOptions;
  final String? substatusText;
  final Widget timeWidget;

  const _DepartureCard({
    required this.title,
    required this.badgeText,
    this.secondaryBadgeText,
    required this.routeText,
    required this.statusText,
    required this.statusColor,
    this.isStatusBold = false,
    this.descriptionText,
    this.availableOptions,
    this.substatusText,
    required this.timeWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF176E5E),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Title + Route on the left, Time on the right
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2.5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF9F00),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badgeText,
                            style: const TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        if (secondaryBadgeText != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2.5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEBF5F3),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFF176E5E),
                                width: 0.8,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  size: 13.5,
                                  color: Color(0xFFFFB300),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  secondaryBadgeText!,
                                  style: const TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF176E5E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Text(
                          routeText,
                          style: const TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              timeWidget,
            ],
          ),

          const SizedBox(height: 5),

          // Status
          Text(
            statusText,
            style: TextStyle(
              fontFamily: "Kanit",
              fontSize: 13.0,
              fontWeight: isStatusBold ? FontWeight.bold : FontWeight.normal,
              color: statusColor,
            ),
          ),

          if (descriptionText != null) ...[
            const SizedBox(height: 3),
            Text(
              descriptionText!,
              style: const TextStyle(
                fontFamily: "Kanit",
                fontSize: 12.0,
                color: Color(0xFF444444),
              ),
            ),
          ],

          if (availableOptions != null && availableOptions!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xFFEEEEEE),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pilihan tersedia",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...availableOptions!.map(
                    (opt) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                              color: Color(0xFF176E5E),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            opt,
                            style: const TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 12.5,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF222222),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (substatusText != null && substatusText!.isNotEmpty) ...[
            const SizedBox(height: 7),
            // Substatus
            Text(
              substatusText!,
              style: const TextStyle(
                fontFamily: "Kanit",
                fontStyle: FontStyle.italic,
                fontSize: 11.5,
                color: Color(0xFFFF5252),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
