import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef DetailUlasanPage = ReviewDetailPage;

class ReviewDetailPage extends StatelessWidget {
  final String? userName;
  final String? rating;
  final String? review;
  final String? date;
  final bool? hasPhotos;

  const ReviewDetailPage({
    super.key,
    this.userName,
    this.rating,
    this.review,
    this.date,
    this.hasPhotos,
  });

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);

    final statusBarHeight =
        MediaQuery.of(context).padding.top;

    // Ambil arguments dari Navigator.pushNamed
    final args =
        ModalRoute.of(context)?.settings.arguments
            as Map<String, dynamic>?;

    final displayUserName =
        userName ??
        args?["userName"] ??
        "Kaisyarani Zahra";

    final displayRating =
        rating ??
        args?["rating"] ??
        "5.0 / 5.0";

    final incomingReview = review ?? args?["review"];

    const additionalReview =
        "pokoknya sngat bagus makcik "
        "pokoknya sngat bagus makcik "
        "pokoknya sngat bagus makcik "
        "pokoknya sngat bagus makcik "
        "pokoknya sngat bagus makcik "
        "pokoknya sngat bagus makcik ";

    final displayReview = incomingReview != null &&
            incomingReview.trim().isNotEmpty
        ? "${incomingReview.trim()} $additionalReview"
        : additionalReview;

    final displayDate =
        date ?? args?["date"] ?? "Diulas pada 12 Febuari 2025";

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
                    "Nilai & Ulasan",
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User and rating
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFFD9D9D9),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            displayUserName,
                            style: const TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3.5,
                          ),
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            displayRating,
                            style: const TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Review text
                    Text(
                      displayReview,
                      style: const TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 8.8,
                        color: Colors.black87,
                        height: 1.35,
                      ),
                    ),

                    const SizedBox(height: 22),

                    // Photos and date
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          color: const Color(0xFFD9D9D9),
                        ),

                        const SizedBox(width: 12),

                        Container(
                          width: 68,
                          height: 68,
                          color: const Color(0xFFD9D9D9),
                        ),

                        const Spacer(),

                        Text(
                          displayDate,
                          style: const TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 8.5,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFCCCCCC),
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