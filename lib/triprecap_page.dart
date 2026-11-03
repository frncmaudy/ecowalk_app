import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef RekapPerjalananPage = TripRecapPage;

class TripRecapPage extends StatefulWidget {
  const TripRecapPage({super.key});

  @override
  State<TripRecapPage> createState() => _TripRecapPageState();
}

class _TripRecapPageState extends State<TripRecapPage> {
  bool _isReviewCardVisible = true;

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
              child: Row(
                children: [
                  SizedBox(
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

                  const Text(
                    "Rekap Perjalanan",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  bottom: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner
                    Container(
                      width: double.infinity,
                      height: 138,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(38),
                          bottomRight: Radius.circular(38),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: 0.20,
                            ),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(38),
                          bottomRight: Radius.circular(38),
                        ),
                        child: Image.asset(
                          "lib/images/dufan_banner.png",
                          width: double.infinity,
                          height: 138,
                          fit: BoxFit.cover,
                          alignment: const Alignment(
                            0,
                            -0.01,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Destination info
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dunia Fantasi (DUFAN)",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 21,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 5),

                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: Color(0xFF666666),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "19 Febuari 2025 | 12:00 WIB",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 11,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 4),

                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 1,
                                ),
                                child: Icon(
                                  Icons.map_outlined,
                                  size: 14,
                                  color: Color(0xFF666666),
                                ),
                              ),

                              SizedBox(width: 6),

                              Expanded(
                                child: Text(
                                  "Jl. Lodan Timur No.7, Ancol, Kec. Pademangan, Jkt Utara, Daerah Khusus Ibukota Jakarta 14430",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 10,
                                    color: Color(0xFF444444),
                                    height: 1.25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 23),

                    // Route
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rute Perjalanan",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 9),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "lib/images/map_dufan.png",
                              width: double.infinity,
                              height: 126,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 21),

                    // Transportation
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Transportasi",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 9),

                          Container(
                            width: 76,
                            height: 112,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                    alpha: 0.12,
                                  ),
                                  blurRadius: 5,
                                  offset: const Offset(
                                    0,
                                    2,
                                  ),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    "lib/images/ojek_online.png",
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                  ),

                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(
                                        5,
                                        16,
                                        5,
                                        6,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withValues(
                                              alpha: 0.88,
                                            ),
                                          ],
                                        ),
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Ojek Online",
                                            style: TextStyle(
                                              fontFamily: "Kanit",
                                              fontSize: 9,
                                              fontWeight:
                                                  FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "Gojek, Grab, Maxim",
                                            style: TextStyle(
                                              fontFamily: "Kanit",
                                              fontSize: 6,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Text(
                                            "Nyaman, dan cepat",
                                            style: TextStyle(
                                              fontFamily: "Kanit",
                                              fontSize: 6,
                                              color: Colors.white70,
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
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Review prompt
                    if (_isReviewCardVisible)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/reviewdufan",
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(
                              14,
                              11,
                              14,
                              13,
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
                                  color: Colors.black.withValues(
                                    alpha: 0.08,
                                  ),
                                  blurRadius: 6,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Bagaimana Perjalananmu?",
                                      style: TextStyle(
                                        fontFamily: "Kanit",
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),

                                    GestureDetector(
                                      behavior:
                                          HitTestBehavior.opaque,
                                      onTap: () {
                                        setState(() {
                                          _isReviewCardVisible =
                                              false;
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Icon(
                                          Icons.close,
                                          size: 17,
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
                                    fontSize: 10,
                                    color: Color(0xFF555555),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Row(
                                  children: List.generate(
                                    5,
                                    (index) {
                                      return GestureDetector(
                                        behavior:
                                            HitTestBehavior.opaque,
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            "/reviewdufan",
                                          );
                                        },
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.only(
                                            right: 2,
                                          ),
                                          child: Icon(
                                            Icons.star_border,
                                            size: 26,
                                            color: Colors.black,
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
                      ),

                    const SizedBox(height: 38),

                    // Action button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              "/detaildufan",
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryGreen,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Pergi Lagi",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
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