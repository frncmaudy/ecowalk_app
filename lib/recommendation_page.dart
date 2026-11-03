import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef RekomendasiPage = RecommendationPage;

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  static const primaryGreen = Color(0xFF176E5E);

  @override
  void dispose() {
    _originController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 27,
                  ),
                  child: SvgPicture.asset(
                    "lib/images/ecowalk_green.svg",
                    width: 100,
                    height: 25,
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),
                ),

                const SizedBox(height: 31),

                // Heading
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "MAU KEMANA HARI INI?",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 18.5,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Location Search Form
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      color: primaryGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _LocationField(
                          controller: _originController,
                          hint: "Masukan Lokasi Asal",
                          icon: Icons.search,
                        ),
                        const SizedBox(height: 14),
                        _LocationField(
                          controller: _destinationController,
                          hint: "Masukan Lokasi Tujuan",
                          icon: Icons.location_on_outlined,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                // Route Button
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    width: 144,
                    height: 33,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        final origin = _originController.text.trim().isNotEmpty
                            ? _originController.text.trim()
                            : "KLAPANUNGGAL";
                        final destination =
                            _destinationController.text.trim().isNotEmpty
                                ? _destinationController.text.trim()
                                : "Trans Studio Cibubur";
                        Navigator.pushNamed(
                          context,
                          "/route-recommendation",
                          arguments: {
                            "origin": origin,
                            "destination": destination,
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: primaryGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Cari Rute",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Recommendations Heading
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Rekomendasi Tujuan",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Horizontal Cards
                SizedBox(
                  height: 285,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: const Row(
                      children: [
                        _DestinationCard(
                          image: "lib/images/moja_museum.png",
                          title: "Moja Museum",
                          location: "Jakarta Pusat",
                          price: "Mulai dari Rp. 136.500",
                          rating: 4.8,
                          imageScale: 1.0,
                          imageAlignment: Alignment.center,
                          imageOffset: Offset.zero,
                        ),
                        SizedBox(width: 20),
                        _DestinationCard(
                          image: "lib/images/ocean_park.png",
                          title: "Ocean Park BSD City Serpong",
                          location: "Tangerang",
                          price: "Mulai dari Rp. 65.000",
                          rating: 4.8,
                          imageScale: 1.0,
                          imageAlignment: Alignment.center,
                          imageOffset: Offset.zero,
                        ),
                        SizedBox(width: 20),
                        _DestinationCard(
                          image: "lib/images/kebun_raya.png",
                          title: "Kebun Raya Bogor",
                          location: "Bogor",
                          price: "Mulai dari Rp. 25.000",
                          rating: 4.7,
                          imageScale: 1.0,
                          imageAlignment: Alignment.center,
                          imageOffset: Offset.zero,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const RecommendationBottomNav(),
      ),
    );
  }
}

// Location Field
class _LocationField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;

  const _LocationField({
    required this.controller,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontFamily: "Kanit",
          fontSize: 13,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 11),
          prefixIcon: Icon(
            icon,
            size: 24,
            color: const Color(0xFF656565),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: "Kanit",
            fontSize: 12.5,
            fontStyle: FontStyle.italic,
            color: Color(0xFF666666),
          ),
        ),
      ),
    );
  }
}

// Destination Card
class _DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;
  final double rating;
  final double imageScale;
  final Alignment imageAlignment;
  final Offset imageOffset;

  const _DestinationCard({
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    this.imageScale = 0.80,
    this.imageAlignment = Alignment.center,
    this.imageOffset = Offset.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 285,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(11),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Transform.translate(
              offset: imageOffset,
              child: Transform.scale(
                scale: imageScale,
                alignment: imageAlignment,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  alignment: imageAlignment,
                  errorBuilder: (context, error, stack) {
                    return Container(
                      color: const Color(0xFFD8D8D8),
                      child: const Center(
                        child: Icon(
                          Icons.image_outlined,
                          size: 42,
                          color: Color(0xFF777777),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.58),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(11),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 11,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 7.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => const Padding(
                          padding: EdgeInsets.only(right: 1.5),
                          child: Icon(
                            Icons.star,
                            size: 11.5,
                            color: Color(0xFFFFD600),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Lebih Lanjut ›",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 7,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
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
    );
  }
}

// Bottom Navigation Bar
class RecommendationBottomNav extends StatelessWidget {
  const RecommendationBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);

    return Container(
      color: green,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 65,
          child: Row(
            children: [
              // Beranda
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      "/home",
                    );
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: SvgPicture.asset(
                      "lib/images/home_nav_icon.svg",
                      width: 25,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Rekomendasi
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: -35,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 76,
                            height: 76,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: green,
                                width: 9,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "lib/images/recommendation_nav_icon.png",
                              width: 22,
                              height: 26,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            "REKOMENDASI",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 9.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Chat
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Center(
                    child: SvgPicture.asset(
                      "lib/images/chat_nav_icon.svg",
                      width: 25,
                      height: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Akun
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      "/profile",
                    );
                  },
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 29,
                    ),
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
