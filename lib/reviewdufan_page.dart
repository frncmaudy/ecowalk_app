import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef UlasanDufanPage = ReviewDufanPage;

class ReviewDufanPage extends StatefulWidget {
  const ReviewDufanPage({super.key});

  @override
  State<ReviewDufanPage> createState() => _ReviewDufanPageState();
}

class _ReviewDufanPageState extends State<ReviewDufanPage> {
  int _selectedRating = 0;
  bool _hideUsername = false;

  final TextEditingController _reviewController =
      TextEditingController();

  final List<String> _attachedImages = [
    "lib/images/home_dufan_small.png",
  ];

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  String get _ratingLabel {
    switch (_selectedRating) {
      case 1:
        return "Sangat Buruk";
      case 2:
        return "Buruk";
      case 3:
        return "Cukup";
      case 4:
        return "Bagus";
      case 5:
        return "Sangat Bagus";
      default:
        return "Bagus";
    }
  }

  Color get _ratingColor {
    switch (_selectedRating) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.deepOrange;
      case 3:
        return Colors.orange;
      case 4:
        return const Color(0xFF4CAF50);
      case 5:
        return const Color(0xFF2E7D32);
      default:
        return const Color(0xFF4CAF50);
    }
  }

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
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: statusBarHeight,
              color: Colors.white,
            ),

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
                    "Beri Ulasan",
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

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 155,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(40),
                              bottomRight:
                                  Radius.circular(40),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withValues(alpha: 0.22),
                                blurRadius: 12,
                                spreadRadius: 0,
                                offset:
                                    const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(38),
                              bottomRight:
                                  Radius.circular(38),
                            ),
                            child: Image.asset(
                              "lib/images/dufan_banner.png",
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                              alignment:
                                  const Alignment(
                                0,
                                -0.1,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          right: 20,
                          bottom: -16,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              borderRadius:
                                  BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withValues(
                                    alpha: 0.18,
                                  ),
                                  blurRadius: 6,
                                  offset:
                                      const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Text(
                              "Dunia Fantasi\n(DUFAN)",
                              textAlign:
                                  TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 11.5,
                                fontWeight:
                                    FontWeight.bold,
                                color: Colors.white,
                                height: 1.15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hai, Kaisyarani !",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 3),

                          const Text(
                            "bagaimana perjalananmu?",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 14.5,
                              fontWeight:
                                  FontWeight.w400,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              ...List.generate(
                                5,
                                (index) {
                                  final starIndex =
                                      index + 1;

                                  final isSelected =
                                      starIndex <=
                                          _selectedRating;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_selectedRating ==
                                            starIndex) {
                                          _selectedRating =
                                              0;
                                        } else {
                                          _selectedRating =
                                              starIndex;
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(
                                        right: 4,
                                      ),
                                      child: SizedBox(
                                        width: 36,
                                        height: 38,
                                        child: Stack(
                                          alignment:
                                              Alignment.center,
                                          children: [
                                            if (isSelected)
                                              const Icon(
                                                Icons.star,
                                                size: 34,
                                                color: Color(
                                                  0xFFFFB800,
                                                ),
                                              ),
                                            const Icon(
                                              Icons.star_border,
                                              size: 38,
                                              color:
                                                  Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(width: 5),

                              Padding(
                                padding:
                                    const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Text(
                                  _ratingLabel,
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 12,
                                    fontWeight:
                                        FontWeight.w600,
                                    color:
                                        _ratingColor,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          Container(
                            height: 110,
                            width: double.infinity,
                            color:
                                const Color(0xFFF6F6F6),
                            child: TextField(
                              controller:
                                  _reviewController,
                              maxLines: 5,
                              style: const TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              decoration:
                                  const InputDecoration(
                                hintText:
                                    "Ketik disini . . .",
                                hintStyle: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 11,
                                  fontStyle:
                                      FontStyle.italic,
                                  color:
                                      Color(0xFF9E9E9E),
                                ),
                                border:
                                    InputBorder.none,
                                contentPadding:
                                    EdgeInsets.all(12),
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          const Text(
                            "Tambahkan Gambar?",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(
                                    context,
                                  ).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Pilih gambar dari galeri...",
                                      ),
                                      duration:
                                          Duration(
                                        seconds: 1,
                                      ),
                                    ),
                                  );
                                },
                                child: CustomPaint(
                                  painter:
                                      DashedBorderPainter(
                                    color:
                                        Colors.black,
                                    strokeWidth: 1.2,
                                    dash: 4,
                                    gap: 3,
                                    radius: 0,
                                  ),
                                  child:
                                      const SizedBox(
                                    width: 62,
                                    height: 62,
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 28,
                                        color:
                                            Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              ..._attachedImages.map(
                                (imagePath) {
                                  return Container(
                                    width: 62,
                                    height: 62,
                                    decoration:
                                        BoxDecoration(
                                      border:
                                          Border.all(
                                        color: Colors
                                            .black54,
                                        width: 0.8,
                                      ),
                                    ),
                                    child: ClipRect(
                                      child:
                                          Transform.translate(
                                       
                                        offset:
                                            const Offset(
                                          -20,
                                          -15,
                                        ),
                                        child:
                                            Transform.scale(
                                          scale: 2.30,
                                          alignment:
                                              Alignment
                                                  .center,
                                          child:
                                              Image.asset(
                                            imagePath,
                                            width: 62,
                                            height: 62,
                                            fit:
                                                BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _hideUsername =
                                    !_hideUsername;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration:
                                      BoxDecoration(
                                    border:
                                        Border.all(
                                      color:
                                          Colors.black,
                                      width: 1.3,
                                    ),
                                    borderRadius:
                                        BorderRadius
                                            .circular(2),
                                    color:
                                        _hideUsername
                                            ? primaryGreen
                                            : Colors
                                                .white,
                                  ),
                                  child:
                                      _hideUsername
                                          ? const Icon(
                                              Icons.check,
                                              size: 14,
                                              color: Colors
                                                  .white,
                                            )
                                          : null,
                                ),

                                const SizedBox(width: 8),

                                const Text(
                                  "Sembunyikan Nama Pengguna",
                                  style: TextStyle(
                                    fontFamily:
                                        "Kanit",
                                    fontSize: 11.5,
                                    color:
                                        Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 32),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Ulasan berhasil dikirim! Terima kasih.",
                                    ),
                                    backgroundColor:
                                        primaryGreen,
                                    duration:
                                        Duration(
                                      seconds: 2,
                                    ),
                                  ),
                                );

                                Navigator
                                    .pushReplacementNamed(
                                  context,
                                  "/nilai-ulasan",
                                );
                              },
                              style: ElevatedButton
                                  .styleFrom(
                                backgroundColor:
                                    primaryGreen,
                                elevation: 0,
                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .circular(8),
                                ),
                              ),
                              child: const Text(
                                "Kirim",
                                style: TextStyle(
                                  fontFamily:
                                      "Kanit",
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.bold,
                                  color:
                                      Colors.white,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),
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

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dash;
  final double gap;
  final double radius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dash,
    required this.gap,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ),
          Radius.circular(radius),
        ),
      );

    for (final metric in path.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        final len =
            distance + dash < metric.length
                ? dash
                : metric.length - distance;

        canvas.drawPath(
          metric.extractPath(
            distance,
            distance + len,
          ),
          paint,
        );

        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}