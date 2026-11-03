import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RouteRecommendationPage extends StatefulWidget {
  final String? origin;
  final String? destination;

  const RouteRecommendationPage({
    super.key,
    this.origin,
    this.destination,
  });

  @override
  State<RouteRecommendationPage> createState() =>
      _RouteRecommendationPageState();
}

class _RouteRecommendationPageState extends State<RouteRecommendationPage> {
  static const primaryGreen = Color(0xFF176E5E);

  int _selectedModeIndex = 0;

  final List<_TransportMode> _modes = const [
    _TransportMode(
      icon: Icons.directions_walk,
      time: "13 menit",
    ),
    _TransportMode(
      icon: Icons.directions_car,
      time: "5 menit",
    ),
    _TransportMode(
      icon: Icons.two_wheeler,
      time: "4 menit",
    ),
    _TransportMode(
      icon: Icons.directions_bus,
      time: "18 menit",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final originText = widget.origin ??
        args?["origin"] as String? ??
        "KLAPANUNGGAL";
    final destinationText = widget.destination ??
        args?["destination"] as String? ??
        "Trans Studio Cibubur";

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
                    const SizedBox(height: 35),

                    // Route Summary Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  ...List.generate(
                                    4,
                                    (index) => Container(
                                      width: 2,
                                      height: 3,
                                      margin:
                                          const EdgeInsets.symmetric(vertical: 1),
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 19,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Titik Awal",
                                    style: TextStyle(
                                      fontFamily: "Kanit",
                                      fontSize: 9,
                                      color: Color(0xFFCBE5DF),
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  Text(
                                    originText,
                                    style: const TextStyle(
                                      fontFamily: "Kanit",
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Divider(
                                    height: 1,
                                    thickness: 0.8,
                                    color: Colors.white.withValues(alpha: 0.35),
                                  ),
                                  const SizedBox(height: 6),
                                  const Text(
                                    "Titik Akhir",
                                    style: TextStyle(
                                      fontFamily: "Kanit",
                                      fontSize: 9,
                                      color: Color(0xFFCBE5DF),
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  Text(
                                    destinationText,
                                    style: const TextStyle(
                                      fontFamily: "Kanit",
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Logo
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset(
                        "lib/images/ecowalk_green.svg",
                        width: 120,
                        height: 25,
                        fit: BoxFit.contain,
                        alignment: Alignment.centerLeft,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Transport Mode Selector
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(_modes.length, (index) {
                          final mode = _modes[index];
                          final isSelected = _selectedModeIndex == index;

                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                _selectedModeIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3.5,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFE8E8E8)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.16,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    mode.icon,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    mode.time,
                                    style: const TextStyle(
                                      fontFamily: "Kanit",
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Map View
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          height: 212,
                          color: const Color(0xFFE5E5E5),
                          child: Image.asset(
                            "lib/images/map_route.png",
                            width: double.infinity,
                            height: 212,
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

                    // Vehicle Options Heading
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Opsi Kendaraan",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Vehicle Options Cards
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _VehicleCard(
                            title: "Transportasi Umum",
                            subtitle1: "Bus, KRL, MRT, LRT",
                            subtitle2: "Hemat, dan murah",
                            image: "lib/images/transport_umum.png",
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/public-transport",
                              );
                            },
                          ),
                          const SizedBox(width: 14),
                          _VehicleCard(
                            title: "Transportasi Pribadi",
                            subtitle1: "Ojol, Taxi, Mobil",
                            subtitle2: "Nyaman, dan cepat",
                            image: "lib/images/ojek_online.png",
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/private-transport",
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Transport Tips Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _TipRow(
                              question: "Mau cepat & murah?",
                              recommendation: "Ojek Online",
                            ),
                            SizedBox(height: 4),
                            _TipRow(
                              question: "Mau murah banget?",
                              recommendation: "Kendaraan Umum",
                            ),
                            SizedBox(height: 4),
                            _TipRow(
                              question: "Mau nyaman & santai?",
                              recommendation: "Taksi",
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

class _TransportMode {
  final IconData icon;
  final String time;

  const _TransportMode({
    required this.icon,
    required this.time,
  });
}

// Vehicle Card
class _VehicleCard extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String image;
  final VoidCallback onTap;

  const _VehicleCard({
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 98,
          height: 145,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFD9D9D9),
                    child: const Center(
                      child: Icon(
                        Icons.directions_transit,
                        color: Color(0xFF777777),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.62),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          maxLines: 1,
                          style: const TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 1.5),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          subtitle1,
                          maxLines: 1,
                          style: const TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 7.2,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          subtitle2,
                          maxLines: 1,
                          style: const TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 6.8,
                            color: Color(0xFFE0E0E0),
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
      ),
    );
  }
}

// Transport Tips Card
class _TipRow extends StatelessWidget {
  final String question;
  final String recommendation;

  const _TipRow({
    required this.question,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          question,
          style: const TextStyle(
            fontFamily: "Kanit",
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 6),
        const Text(
          "👉",
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            recommendation,
            style: const TextStyle(
              fontFamily: "Kanit",
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

