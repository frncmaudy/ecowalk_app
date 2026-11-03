import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'user_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: green,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "lib/images/ecowalk_green.svg",
                        width: 150,
                        height: 27,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            "/profile",
                          );
                        },
                        child: ClipOval(
                          child: ValueListenableBuilder<String>(
                            valueListenable: UserProfile.imageNotifier,
                            builder: (context, currentImage, _) {
                              return Image.asset(
                                currentImage,
                                width: 38,
                                height: 38,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/notification",
                          );
                        },
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: green,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "lib/images/bell_icon.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/cuaca",
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF176E5E),
                            Color(0xFF4D9184),
                            Color(0xFFE0E0E0),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.16),
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 22,
                            top: 42,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Minggu, 16 Febuari 2025",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Klapanunggal, Bogor",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "30°C",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 43,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(height: 14),
                                Text(
                                  "Cerah Berawan",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            right: -6,
                            top: 2,
                            child: Image.asset(
                              "lib/images/cerah_berawan.png",
                              width: 250,
                              height: 220,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Rekomendasi",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  height: 250,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Row(
                      children: [
                        DestinationCard(
                          image: "lib/images/home_dufan.png",
                          title: "Dunia Fantasi (DUFAN)",
                          location: "Ancol, Jakarta Utara",
                          price: "Rp. 200.000",
                          distance: "1.68 KM",
                        ),
                        SizedBox(width: 20),
                        DestinationCard(
                          image: "lib/images/home_tmii.png",
                          title: "Taman Mini Indonesia Indah (TMII)",
                          location: "Jakarta Timur",
                          price: "Mulai dari Rp. 35.000",
                          distance: "3.88 KM",
                        ),
                        SizedBox(width: 20),
                        DestinationCard(
                          image: "lib/images/home_tmii.png",
                          title: "Taman Mini Indonesia Indah (TMII)",
                          location: "Jakarta Timur",
                          price: "Mulai dari Rp. 35.000",
                          distance: "3.88 KM",
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ReviewPromptCard(),
                ),

                const SizedBox(height: 24),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Kategori",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 7),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                        height: 27,
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Semua",
                          style: TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const CategoryText(text: "Kuliner"),
                      const CategoryText(text: "Sejarah"),
                      const CategoryText(text: "Alam"),
                      const CategoryText(text: "Religi"),
                      const CategoryText(text: "Seni"),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        "Pilihan Teratas",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/kategori",
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              "Jelajahi",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 7),
                            Icon(
                              Icons.chevron_right,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  height: 112,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Row(
                      children: [
                        SmallDestinationCard(),
                        SizedBox(width: 16),
                        SmallDestinationCard(),
                        SizedBox(width: 16),
                        SmallDestinationCard(),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 31),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    height: 104,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4D8D80),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 13,
                          top: 18,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Banyak pilihan tempat wisata bikin bingung?",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Bandingkan sekarang dan temukan yang terbaik!",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          left: 13,
                          bottom: 17,
                          child: Container(
                            height: 23,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 13,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "Bandingkan Sekarang",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 7.5,
                                fontWeight: FontWeight.w600,
                                color: green,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          right: -17,
                          bottom: -38,
                          child: Container(
                            width: 125,
                            height: 125,
                            decoration: const BoxDecoration(
                              color: Color(0xFFA7CDC3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        Positioned(
                          right: -3,
                          bottom: -5,
                          child: Image.asset(
                            "lib/images/banner_girl.png",
                            width: 105,
                            height: 104,
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        "Kunjungi Lagi",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          Text(
                            "Selengkapnya",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 7),
                          Icon(
                            Icons.chevron_right,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  height: 112,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Row(
                      children: [
                        SmallDestinationCard(),
                        SizedBox(width: 16),
                        SmallDestinationCard(),
                        SizedBox(width: 16),
                        SmallDestinationCard(),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 31),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        "Terakhir Dilihat",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/recentlyviewed",
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              "Selengkapnya",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 7),
                            Icon(
                              Icons.chevron_right,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const DestinationCard(
                        image: "lib/images/home_dufan.png",
                        title: "Dunia Fantasi (DUFAN)",
                        location: "Ancol, Jakarta Utara",
                        price: "Rp. 200.000",
                        distance: "",
                        width: 153,
                        height: 220,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Halo! Saya asisten virtual Ecowalk 🤖",
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Image.asset(
                          "lib/images/robot.png",
                          width: 130,
                          height: 155,
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomRight,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),
              ],
            ),
          ),
        ),

        bottomNavigationBar: HomeBottomNavigation(
          onProfileTap: () {
            Navigator.pushReplacementNamed(
              context,
              "/profile",
            );
          },
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;
  final String distance;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const DestinationCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.distance,
    this.width = 170,
    this.height = 245,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            if (title.contains("DUFAN") ||
                title.contains("Dufan")) {
              Navigator.pushNamed(
                context,
                "/detail-dufan",
              );
            }
          },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 76,
                  padding: const EdgeInsets.fromLTRB(
                    7,
                    7,
                    7,
                    5,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.35),
                        Colors.black.withValues(alpha: 0.9),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 9.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 1),

                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 8.5,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 7.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 2),

                      Text(
                        price,
                        style: const TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 7.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                "lib/images/star_full.svg",
                                width: 9,
                                height: 9,
                              ),
                              const SizedBox(width: 0.5),
                              SvgPicture.asset(
                                "lib/images/star_full.svg",
                                width: 9,
                                height: 9,
                              ),
                              const SizedBox(width: 0.5),
                              SvgPicture.asset(
                                "lib/images/star_full.svg",
                                width: 9,
                                height: 9,
                              ),
                              const SizedBox(width: 0.5),
                              SvgPicture.asset(
                                "lib/images/star_full.svg",
                                width: 9,
                                height: 9,
                              ),
                              const SizedBox(width: 0.5),
                              SvgPicture.asset(
                                "lib/images/half_star.svg",
                                width: 9,
                                height: 9,
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "Lebih Lanjut  >",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 6.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              if (distance.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 22,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFF177A6C),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      distance,
                      style: const TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 8.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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

class SmallDestinationCard extends StatelessWidget {
  final VoidCallback? onTap;

  const SmallDestinationCard({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.pushNamed(
              context,
              "/detail-dufan",
            );
          },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 156,
        height: 112,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "lib/images/home_dufan_small.png",
                fit: BoxFit.cover,
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 38,
                  padding: const EdgeInsets.fromLTRB(
                    6,
                    5,
                    6,
                    3,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.2),
                        Colors.black.withValues(alpha: 0.85),
                      ],
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dunia Fantasi (DUFAN)",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 7.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 7.5,
                            color: Colors.red,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "Ancol, Jakarta Utara",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 6.5,
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
        ),
      ),
    );
  }
}

class CategoryText extends StatelessWidget {
  final String text;

  const CategoryText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: "Kanit",
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}

class ReviewPromptCard extends StatefulWidget {
  const ReviewPromptCard({super.key});

  @override
  State<ReviewPromptCard> createState() =>
      _ReviewPromptCardState();
}

class _ReviewPromptCardState extends State<ReviewPromptCard> {
  bool isVisible = true;
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(
          context,
          "/ulasan-dufan",
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(
          16,
          14,
          16,
          16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE2E2E2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Bagaimana Perjalananmu?",
                  style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = false;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: const Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Color(0xFF444444),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 2),

            const Text(
              "Yuk beri ulasan untuk tempat yang baru kamu kunjungi !",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 11,
                color: Color(0xFF555555),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: List.generate(
                5,
                (index) {
                  final isFilled =
                      index < selectedRating;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRating =
                            index + 1;
                      });

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Terima kasih atas ulasan ${index + 1} bintang! ⭐",
                          ),
                          duration:
                              const Duration(
                            seconds: 2,
                          ),
                        ),
                      );
                    },
                    behavior:
                        HitTestBehavior.opaque,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(
                        right: 3,
                      ),
                      child: Icon(
                        isFilled
                            ? Icons.star
                            : Icons.star_border,
                        size: 28,
                        color: isFilled
                            ? const Color(
                                0xFFFFD600,
                              )
                            : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBottomNavigation extends StatelessWidget {
  final VoidCallback onProfileTap;

  const HomeBottomNavigation({
    super.key,
    required this.onProfileTap,
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
                            child: SvgPicture.asset(
                              "lib/images/home_nav_icon.svg",
                              width: 30,
                              height: 30,
                              fit: BoxFit.contain,
                              colorFilter: const ColorFilter.mode(
                                green,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            "BERANDA",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 10,
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


              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      "/rekomendasi",
                    );
                  },
                  child: Center(
                    child: SvgPicture.asset(
                      "lib/images/shield_nav_icon.svg",
                      width: 25,
                      height: 27,
                      fit: BoxFit.contain,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: SvgPicture.asset(
                    "lib/images/chat_nav_icon.svg",
                    width: 27,
                    height: 27,
                    fit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onProfileTap,
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 29,
                      color: Colors.white,
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
