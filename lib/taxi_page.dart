import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaxiPage extends StatefulWidget {
  const TaxiPage({super.key});

  static const primaryGreen = Color(0xFF176E5E);

  @override
  State<TaxiPage> createState() => _TaxiPageState();
}

class _TaxiPageState extends State<TaxiPage> {
  static const primaryGreen = Color(0xFF176E5E);

  final Map<int, bool> _expandedState = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
  };

  void _toggleExpand(int index) {
    setState(() {
      _expandedState[index] = !(_expandedState[index] ?? false);
    });
  }

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
                      "Transportasi Pribadi",
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
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 180,
                          child: Image.asset(
                            "lib/images/taxi_banner.png",
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFF0072BC),
                                child: const Center(
                                  child: Icon(
                                    Icons.local_taxi_rounded,
                                    size: 56,
                                    color: Colors.white,
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
                                  color: Colors.black.withValues(alpha: 0.24),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Text(
                              "Paling Nyaman",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                color: primaryGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // Title
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "TAXI",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Accordion List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          // 1. Biaya
                          _AccordionTile(
                            title: "Biaya",
                            isExpanded: _expandedState[0] ?? false,
                            onTap: () => _toggleExpand(0),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "± Rp 100.000 – Rp 120.000",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "Estimasi perjalanan sekitar 18,5 km; belum termasuk tol, parkir, dan biaya tambahan. Sebagai acuan taksi reguler Bluebird Jabodetabek, tarif awal Rp9.000 dan tarif per kilometer berada sekitar Rp5.000–Rp6.000 tergantung jarak. Untuk pemesanan Bluebird di Jakarta, tarif minimum saat ini Rp25.000 dan biaya platform MyBluebird Rp4.000.",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    height: 1.35,
                                    color: Color(0xFFE53935),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 11),

                          // 2. Estimasi
                          _AccordionTile(
                            title: "Estimasi",
                            isExpanded: _expandedState[1] ?? false,
                            onTap: () => _toggleExpand(1),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "±35–55 menit",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    height: 1.35,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "tergantung waktu penjemputan, kondisi lalu lintas, dan rute perjalanan.",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    color: Color(0xFFE53935),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 11),

                          // 3. Keberangkatan
                          _AccordionTile(
                            title: "Keberangkatan",
                            isExpanded: _expandedState[2] ?? false,
                            onTap: () => _toggleExpand(2),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Menunggu kendaraan ±5–15 menit",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "tergantung ketersediaan taxi di sekitar titik penjemputan.",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    color: Color(0xFFE53935),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/departure-taxi");
                                    },
                                    child: const Text(
                                      "Selengkapnya",
                                      style: TextStyle(
                                        fontFamily: "Kanit",
                                        fontSize: 12,
                                        color: Color(0xFF38BDF8),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                          const SizedBox(height: 11),

                          // 4. Informasi Lalu Lintas
                          _AccordionTile(
                            title: "Informasi Lalu Lintas",
                            isExpanded: _expandedState[3] ?? false,
                            onTap: () => _toggleExpand(3),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text.rich(
                                  TextSpan(
                                    style: TextStyle(
                                      fontFamily: "Kanit",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15.0,
                                      height: 1.35,
                                      color: Color(0xFF222222),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Kondisi perjalanan tergolong ",
                                      ),
                                      TextSpan(
                                        text: "Sedang",
                                        style: TextStyle(
                                          color: Color(0xFFFB8C00),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      TextSpan(text: "/"),
                                      TextSpan(
                                        text: "Tinggi",
                                        style: TextStyle(
                                          color: Color(0xFFE53935),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "waktu dan tarif perjalanan dapat bertambah akibat kemacetan pada layanan berargo.",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    color: Color(0xFFE53935),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 11),

                          // 5. Rute yang dilalui
                          _AccordionTile(
                            title: "Rute yang dilalui",
                            isExpanded: _expandedState[4] ?? false,
                            onTap: () => _toggleExpand(4),
                            content: const Text(
                              "Titik jemput → Cileungsi → Jl. Alternatif Cibubur → Harjamukti → Trans Studio Cibubur.",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 15,
                                height: 1.45,
                                color: Color(0xFF222222),
                              ),
                            ),
                          ),
                          const SizedBox(height: 11),

                          // 6. Kelebihan & Kekurangan
                          _AccordionTile(
                            title: "Kelebihan & Kekurangan",
                            isExpanded: _expandedState[5] ?? false,
                            onTap: () => _toggleExpand(5),
                            isHighlighted: true,
                            customExpanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Kelebihan",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "• Nyaman dan terlindung dari cuaca\n• Tidak perlu mengemudikan kendaraan sendiri\n• Dapat membawa beberapa penumpang dan barang\n• Cocok untuk perjalanan bersama keluarga",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 15,
                                    height: 1.35,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Kekurangan",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "• Biaya perjalanan paling tinggi\n• Waktu perjalanan terpengaruh kemacetan\n• Terdapat biaya tambahan untuk tol dan parkir\n• Perlu menunggu kendaraan datang\n• Tarif argo dapat berubah mengikuti kondisi aktual",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 15,
                                    height: 1.35,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            content: const SizedBox.shrink(),
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
}

// Accordion Tile
class _AccordionTile extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget content;
  final bool isHighlighted;
  final Widget? customExpanded;

  const _AccordionTile({
    required this.title,
    required this.isExpanded,
    required this.onTap,
    required this.content,
    this.isHighlighted = false,
    this.customExpanded,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);

    final backgroundColor = isHighlighted ? primaryGreen : Colors.white;
    final textColor = isHighlighted ? Colors.white : Colors.black;
    final iconColor = isHighlighted ? Colors.white : Colors.black;
    final border = isHighlighted
        ? null
        : Border.all(
            color: Colors.black,
            width: 1.0,
          );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: border,
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 9, 14, 11),
            child: customExpanded != null && isExpanded
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: customExpanded!),
                      Transform.rotate(
                        angle: 3.14159,
                        child: Image.asset(
                          "lib/images/dropdown_arrow.png",
                          width: 17,
                          height: 10,
                          fit: BoxFit.contain,
                          color: iconColor,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0.0,
                            duration: const Duration(milliseconds: 200),
                            child: Image.asset(
                              "lib/images/dropdown_arrow.png",
                              width: 17,
                              height: 10,
                              fit: BoxFit.contain,
                              color: iconColor,
                            ),
                          ),
                        ],
                      ),
                      if (isExpanded) ...[
                        const SizedBox(height: 2),
                        content,
                        const SizedBox(height: 4),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

