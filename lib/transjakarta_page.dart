import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransjakartaPage extends StatefulWidget {
  const TransjakartaPage({super.key});

  static const primaryGreen = Color(0xFF176E5E);

  @override
  State<TransjakartaPage> createState() => _TransjakartaPageState();
}

class _TransjakartaPageState extends State<TransjakartaPage> {
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
                      "Transportasi Umum",
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
                            "lib/images/transjakarta_banner.png",
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFF0072BC),
                                child: const Center(
                                  child: Icon(
                                    Icons.directions_bus,
                                    size: 48,
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
                              "Rekomendasi",
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
                        "TRANSJAKARTA",
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
                          _AccordionTile(
                            title: "Biaya",
                            isExpanded: _expandedState[0] ?? false,
                            onTap: () => _toggleExpand(0),
                            content: const Text(
                              "Rp 3.500 (tarif flat TransJakarta)",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: Color(0xFF222222),
                              ),
                            ),
                          ),
                          const SizedBox(height: 11),
                          _AccordionTile(
                            title: "Estimasi",
                            isExpanded: _expandedState[1] ?? false,
                            onTap: () => _toggleExpand(1),
                            content: const Text(
                              "±60-75 menit (tergantung kondisi lalu lintas\ndan waktu tunggu)",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                height: 1.35,
                                color: Color(0xFF222222),
                              ),
                            ),
                          ),
                          const SizedBox(height: 11),
                          _AccordionTile(
                            title: "Keberangkatan",
                            isExpanded: _expandedState[2] ?? false,
                            onTap: () => _toggleExpand(2),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Perkiraan keberangkatan dari Halte Duri Kepa:\nPukul 18.00 WIB",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    height: 1.35,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Bisa berubah tergantung kepadatan lalu lintas",
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
                                          context, "/departure");
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
                          _AccordionTile(
                            title: "Informasi Kepadatan",
                            isExpanded: _expandedState[3] ?? false,
                            onTap: () => _toggleExpand(3),
                            content: const Text.rich(
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
                                    text:
                                        "Kepadatan di Halte SSSSS tergolong ",
                                  ),
                                  TextSpan(
                                    text: "Rendah",
                                    style: TextStyle(
                                      color: Color(0xFF34A853),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(text: "/\u200B"),
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
                          ),
                          const SizedBox(height: 11),
                          _AccordionTile(
                            title: "Rute yang dilalui",
                            isExpanded: _expandedState[4] ?? false,
                            onTap: () => _toggleExpand(4),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Dari Kedoya Selatan, naik mikrotrans atau ojek online menuju ke halte Kedoya Green Garden",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 15,
                                    height: 1.35,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    "⋮",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF888888),
                                      height: 1.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Naik Koridor 8 TransJakarta menuju Halte Harmoni",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 15,
                                    height: 1.35,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    "⋮",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF888888),
                                      height: 1.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Transit di Halte Harmoni, lalu naik ke Koridor 1 ke Halte Monas",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 15,
                                    height: 1.35,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 11),
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
                                  "• Biaya Terjangkau\n• Jalur khusus bus mengurangi risiko\n  terjebak macet",
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
                                  "• Perlu transit dan menunggu bus di setiap\n  halte\n• Kepadatan penumpang pada jam sibuk",
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
