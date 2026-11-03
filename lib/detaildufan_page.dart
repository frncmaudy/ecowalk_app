import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailDufanPage extends StatefulWidget {
  const DetailDufanPage({super.key});

  @override
  State<DetailDufanPage> createState() =>
      _DetailDufanPageState();
}

class _DetailDufanPageState
    extends State<DetailDufanPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness:
            Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Container(
                width: double.infinity,
                height: 54,
                color: primaryGreen,
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(
                        minWidth: 42,
                        minHeight: 54,
                      ),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      "Dunia Fantasi (DUFAN)",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 17,
                        fontWeight:
                            FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -6),
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Banner
                          SizedBox(
                            width: double.infinity,
                            height: 257,
                            child: ClipRect(
                              child:
                                  Transform.scale(
                                scale: 1.08,
                                alignment:
                                    const Alignment(
                                  0,
                                  -0.30,
                                ),
                                child: Image.asset(
                                  "lib/images/dufan_banner.png",
                                  width:
                                      double.infinity,
                                  height: 257,
                                  fit: BoxFit.cover,
                                  alignment:
                                      Alignment.center,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            height: 120,
                            child: IgnorePointer(
                              child: Container(
                                decoration:
                                    BoxDecoration(
                                  gradient:
                                      LinearGradient(
                                    begin: Alignment
                                        .topCenter,
                                    end: Alignment
                                        .bottomCenter,
                                    colors: [
                                      Colors.white
                                          .withValues(
                                        alpha: 0.0,
                                      ),
                                      Colors.white
                                          .withValues(
                                        alpha: 0.35,
                                      ),
                                      Colors.white
                                          .withValues(
                                        alpha: 0.85,
                                      ),
                                      Colors.white,
                                    ],
                                    stops: const [
                                      0.0,
                                      0.35,
                                      0.75,
                                      1.0,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Rating
                          Positioned(
                            left: 16,
                            bottom: 9,
                            child: Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 8,
                                vertical: 3.5,
                              ),
                              decoration:
                                  BoxDecoration(
                                color: primaryGreen
                                    .withValues(
                                  alpha: 0.88,
                                ),
                                borderRadius:
                                    BorderRadius
                                        .circular(5),
                              ),
                              child: const Row(
                                mainAxisSize:
                                    MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 13,
                                    color: Color(
                                      0xFFFFD600,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "4.75",
                                    style: TextStyle(
                                      fontFamily:
                                          "Kanit",
                                      fontSize: 11,
                                      fontWeight:
                                          FontWeight
                                              .w700,
                                      color:
                                          Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Favorite
                          Positioned(
                            right: 20,
                            bottom: -16,
                            child:
                                GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorite =
                                      !isFavorite;
                                });

                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isFavorite
                                          ? "Ditambahkan ke Favorit ❤️"
                                          : "Dihapus dari Favorit",
                                    ),
                                    duration:
                                        const Duration(
                                      seconds: 1,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration:
                                    BoxDecoration(
                                  color:
                                      const Color(
                                    0xFF4B887A,
                                  ),
                                  shape:
                                      BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors
                                          .black
                                          .withValues(
                                        alpha: 0.18,
                                      ),
                                      blurRadius: 6,
                                      offset:
                                          const Offset(
                                        0,
                                        3,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons
                                          .favorite_border,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Transform.translate(
                        offset:
                            const Offset(0, -4),
                        child: Padding(
                          padding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal: 16,
                          ),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              const Text(
                                "Dunia Fantasi (DUFAN)",
                                style: TextStyle(
                                  fontFamily:
                                      "Kanit",
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  color:
                                      Colors.black,
                                ),
                              ),

                              const SizedBox(
                                height: 4,
                              ),

                              const Row(
                                children: [
                                  Icon(
                                    Icons
                                        .access_time,
                                    size: 15,
                                    color: Colors
                                        .black87,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Open",
                                    style:
                                        TextStyle(
                                      fontFamily:
                                          "Kanit",
                                      fontSize: 12.5,
                                      fontWeight:
                                          FontWeight
                                              .w800,
                                      color: Color(
                                        0xFF24E34B,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    " | 10:00 - 22:00",
                                    style:
                                        TextStyle(
                                      fontFamily:
                                          "Kanit",
                                      fontSize: 12.5,
                                      fontWeight:
                                          FontWeight
                                              .w500,
                                      color:
                                          Colors.black,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              const Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets
                                            .only(
                                      top: 1,
                                    ),
                                    child: Icon(
                                      Icons
                                          .location_on_outlined,
                                      size: 16,
                                      color: Colors
                                          .black87,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      "Jl. Lodan Timur No.7, Ancol, Kec. Pademangan, Jkt Utara, Daerah Khusus Ibukota Jakarta 14430",
                                      style:
                                          TextStyle(
                                        fontFamily:
                                            "Kanit",
                                        fontSize: 11,
                                        color: Color(
                                          0xFF333333,
                                        ),
                                        height: 1.35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 14,
                              ),

                              const Text(
                                "Dufan (Dunia Fantasi) adalah taman hiburan yang terletak di kawasan Taman Impian Ancol, Jakarta Utara. Dufan merupakan salah satu taman hiburan terbesar dan terpopuler di Indonesia.",
                                style: TextStyle(
                                  fontFamily:
                                      "Kanit",
                                  fontSize: 12.5,
                                  color: Color(
                                    0xFF262626,
                                  ),
                                  height: 1.45,
                                ),
                              ),

                              const SizedBox(
                                height: 18,
                              ),

                              const Text(
                                "Harga Tiket Mulai Dari",
                                style: TextStyle(
                                  fontFamily:
                                      "Kanit",
                                  fontSize: 9.5,
                                  fontWeight:
                                      FontWeight
                                          .w500,
                                  color: Color(
                                    0xFF333333,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 4,
                              ),

                              Container(
                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration:
                                    BoxDecoration(
                                  color:
                                      primaryGreen,
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                    6,
                                  ),
                                ),
                                child:
                                    const Text(
                                  "Rp. 190.000 - Rp. 400.000",
                                  style: TextStyle(
                                    fontFamily:
                                        "Kanit",
                                    fontSize: 14,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    color:
                                        Colors.white,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 3,
                              ),

                              const Text(
                                "*Harga tergantung hari dan dapat berubah sewaktu-waktu",
                                style: TextStyle(
                                  fontFamily:
                                      "Kanit",
                                  fontSize: 7.5,
                                  fontStyle:
                                      FontStyle
                                          .italic,
                                  color: Color(
                                    0xFF888888,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 24,
                              ),

                              const Text(
                                "Nilai & Ulasan",
                                style: TextStyle(
                                  fontFamily:
                                      "Kanit",
                                  fontSize: 15.5,
                                  fontWeight:
                                      FontWeight
                                          .w600,
                                  color:
                                      Colors.black,
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              Row(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets
                                            .symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    decoration:
                                        BoxDecoration(
                                      color:
                                          primaryGreen,
                                      borderRadius:
                                          BorderRadius
                                              .circular(
                                        5,
                                      ),
                                    ),
                                    child:
                                        const Row(
                                      mainAxisSize:
                                          MainAxisSize
                                              .min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 13,
                                          color: Color(
                                            0xFFFFD600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "4.75",
                                          style:
                                              TextStyle(
                                            fontFamily:
                                                "Kanit",
                                            fontSize:
                                                12,
                                            fontWeight:
                                                FontWeight
                                                    .w600,
                                            color:
                                                Colors
                                                    .white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ),

                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    children: [
                                      Text(
                                        "Rekomendasi Istimewa",
                                        style:
                                            TextStyle(
                                          fontFamily:
                                              "Kanit",
                                          fontSize:
                                              11.5,
                                          fontWeight:
                                              FontWeight
                                                  .w600,
                                          color:
                                              Colors
                                                  .black,
                                        ),
                                      ),
                                      Text(
                                        "24.543 Ulasan",
                                        style:
                                            TextStyle(
                                          fontFamily:
                                              "Kanit",
                                          fontSize:
                                              10,
                                          color: Color(
                                            0xFF666666,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const Spacer(),

                                  GestureDetector(
                                    behavior:
                                        HitTestBehavior
                                            .opaque,
                                    onTap: () {
                                      Navigator
                                          .pushNamed(
                                        context,
                                        "/nilai-ulasan",
                                      );
                                    },
                                    child:
                                        const Row(
                                      children: [
                                        Text(
                                          "Lihat Semua",
                                          style:
                                              TextStyle(
                                            fontFamily:
                                                "Kanit",
                                            fontSize:
                                                11.5,
                                            color:
                                                Colors
                                                    .black87,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons
                                              .chevron_right,
                                          size: 15,
                                          color:
                                              Colors
                                                  .black87,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 14,
                              ),

                              const SingleChildScrollView(
                                scrollDirection:
                                    Axis.horizontal,
                                child: Row(
                                  children: [
                                    ReviewCardItem(
                                      userName:
                                          "Kaisyarani Zahra",
                                      rating:
                                          "5.0 / 5.0",
                                      review:
                                          "pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik",
                                      date:
                                          "Ulasan pada 12 Februari 2025",
                                      hasPhotos:
                                          false,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    ReviewCardItem(
                                      userName:
                                          "Kaisyarani Zahra",
                                      rating:
                                          "5.0 / 5.0",
                                      review:
                                          "pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik pokoknya sangat bagus mantik",
                                      date:
                                          "Diulas pada 12 Febuari 2025",
                                      hasPhotos:
                                          true,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 24,
                              ),

                              const Text(
                                "Lihat Peta",
                                style: TextStyle(
                                  fontFamily:
                                      "Kanit",
                                  fontSize: 15.5,
                                  fontWeight:
                                      FontWeight
                                          .w600,
                                  color:
                                      Colors.black,
                                ),
                              ),

                              const SizedBox(
                                height: 2,
                              ),

                              const Text(
                                "1.68 KM dari lokasimu saat ini",
                                style: TextStyle(
                                  fontFamily:
                                      "Kanit",
                                  fontSize: 11.5,
                                  color: Color(
                                    0xFF666666,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 12,
                              ),

                              ClipRRect(
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  14,
                                ),
                                child:
                                    Image.asset(
                                  "lib/images/map_dufan.png",
                                  width: double
                                      .infinity,
                                  height: 160,
                                  fit:
                                      BoxFit.cover,
                                ),
                              ),

                              const SizedBox(
                                height: 36,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCardItem extends StatelessWidget {
  final String userName;
  final String rating;
  final String review;
  final String date;
  final bool hasPhotos;

  const ReviewCardItem({
    super.key,
    required this.userName,
    required this.rating,
    required this.review,
    required this.date,
    this.hasPhotos = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 232,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration:
                    const BoxDecoration(
                  color: Color(0xFFE53935),
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  userName,
                  maxLines: 1,
                  overflow:
                      TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 10.5,
                    fontWeight:
                        FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color:
                      const Color(0xFF176E5E),
                  borderRadius:
                      BorderRadius.circular(
                    3,
                  ),
                ),
                child: Text(
                  rating,
                  style: const TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 7.5,
                    fontWeight:
                        FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            review,
            maxLines: hasPhotos ? 3 : 5,
            overflow:
                TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: "Kanit",
              fontSize: 8,
              color: Color(0xFF444444),
              height: 1.3,
            ),
          ),

          if (hasPhotos) ...[
            const SizedBox(height: 6),

            Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                    2,
                  ),
                  child: Image.asset(
                    "lib/images/home_dufan_small.png",
                    width: 26,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 4),
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                    2,
                  ),
                  child: Image.asset(
                    "lib/images/home_dufan_small.png",
                    width: 26,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 4),
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                    2,
                  ),
                  child: Image.asset(
                    "lib/images/home_dufan_small.png",
                    width: 26,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 6),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              date,
              style: const TextStyle(
                fontFamily: "Kanit",
                fontSize: 6.5,
                color: Color(0xFF888888),
              ),
            ),
          ),
        ],
      ),
    );
  }
}