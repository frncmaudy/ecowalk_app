import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef NilaiUlasanPage = ReviewPage;

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  String _selectedFilter = "Semua";

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);
    final statusBarHeight =
        MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness:
            Brightness.dark,
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
                        size: 23,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Text(
                    "Nilai & Ulasan",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),

                    // Rating summary
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "4.75",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 22,
                                  fontWeight:
                                      FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              const SizedBox(width: 8),

                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                children: [
                                  SvgPicture.asset(
                                    "lib/images/star_full.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  SvgPicture.asset(
                                    "lib/images/star_full.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  SvgPicture.asset(
                                    "lib/images/star_full.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  SvgPicture.asset(
                                    "lib/images/star_full.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  SvgPicture.asset(
                                    "lib/images/half_star.svg",
                                    width: 16,
                                    height: 16,
                                  ),
                                ],
                              ),

                              const Spacer(),

                              SvgPicture.asset(
                                "lib/images/ecowalk_green.svg",
                                width: 72,
                                height: 14.5,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),

                          const SizedBox(height: 2),

                          const Row(
                            children: [
                              Text(
                                "24.543",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 13,
                                  fontWeight:
                                      FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Ulasan",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 9.5,
                                  color:
                                      Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Filter
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          _buildFilterChip("Semua"),

                          const SizedBox(width: 16),

                          _buildFilterChip(
                            "Dengan Foto",
                          ),

                          const SizedBox(width: 16),

                          _buildStarDropdownChip(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Review cards
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Column(
                        children: const [
                          _ReviewItemCard(
                            userName:
                                "Kaisyarani Zahra",
                            rating: "5.0 / 5.0",
                            review:
                                "pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik ",
                            date:
                                "Diulas pada 12 Februari 2025",
                            hasPhotos: false,
                          ),

                          _ReviewItemCard(
                            userName:
                                "Kaisyarani Zahra",
                            rating: "5.0 / 5.0",
                            review:
                                "pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik ",
                            date:
                                "Diulas pada 12 Februari 2025",
                            hasPhotos: true,
                          ),

                          _ReviewItemCard(
                            userName:
                                "Kaisyarani Zahra",
                            rating: "5.0 / 5.0",
                            review:
                                "pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik ",
                            date:
                                "Diulas pada 12 Februari 2025",
                            hasPhotos: false,
                          ),

                          _ReviewItemCard(
                            userName:
                                "Kaisyarani Zahra",
                            rating: "5.0 / 5.0",
                            review:
                                "pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik pokoknya sngat bagus makcik ",
                            date:
                                "Diulas pada 12 Februari 2025",
                            hasPhotos: false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filter chip
  Widget _buildFilterChip(String label) {
    const primaryGreen = Color(0xFF176E5E);

    final isSelected =
        _selectedFilter == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryGreen
              : const Color(0xFF176E5E),
          borderRadius:
              BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: "Kanit",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Star dropdown chip
  Widget _buildStarDropdownChip() {
    const primaryGreen = Color(0xFF176E5E);

    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius:
            BorderRadius.circular(6),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Bintang",
            style: TextStyle(
              fontFamily: "Kanit",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

// Review item card
class _ReviewItemCard
    extends StatelessWidget {
  final String userName;
  final String rating;
  final String review;
  final String date;
  final bool hasPhotos;

  const _ReviewItemCard({
    required this.userName,
    required this.rating,
    required this.review,
    required this.date,
    required this.hasPhotos,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen =
        Color(0xFF176E5E);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(
          context,
          "/review-detail",
          arguments: {
            "userName": userName,
            "rating": rating,
            "review": review,
            "date": date,
            "hasPhotos": hasPhotos,
          },
        );
      },
      child: Container(
        margin:
            const EdgeInsets.only(
          bottom: 22,
        ),

        padding:
            const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(10),

          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withValues(
                alpha: 0.24,
              ),
              blurRadius: 12,
              spreadRadius: 0.8,
              offset:
                  const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // User and rating
            Row(
              children: [
                const CircleAvatar(
                  radius: 13,
                  backgroundColor:
                      Color(0xFFD9D9D9),
                ),

                const SizedBox(width: 9),

                Text(
                  userName,
                  style:
                      const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 12.5,
                    fontWeight:
                        FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const Spacer(),

                Container(
                  padding:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 6,
                    vertical: 2.5,
                  ),
                  decoration:
                      BoxDecoration(
                    color: primaryGreen,
                    borderRadius:
                        BorderRadius
                            .circular(
                      3,
                    ),
                  ),
                  child: Text(
                    rating,
                    style:
                        const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 9,
                      fontWeight:
                          FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Review text
            Text(
              review,
              style:
                  const TextStyle(
                fontFamily: "Kanit",
                fontSize: 8.6,
                color: Colors.black87,
                height: 1.35,
              ),
            ),

            const SizedBox(height: 3),

            const Text(
              "Selengkapnya",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 9.5,
                color:
                    Color(0xFF29B6F6),
              ),
            ),

            // Photos
            if (hasPhotos) ...[
              const SizedBox(height: 8),

              Row(
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    color:
                        const Color(
                      0xFFD9D9D9,
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  Container(
                    width: 62,
                    height: 62,
                    color:
                        const Color(
                      0xFFD9D9D9,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 6),

            // Date
            Align(
              alignment:
                  Alignment.centerRight,
              child: Text(
                date,
                style:
                    const TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 7.5,
                  color:
                      Color(0xFF888888),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}