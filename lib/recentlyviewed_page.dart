import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecentlyViewedItem {
  final String title;
  final double rating;
  final String openHours;
  final String location;
  final String price;
  final String? image;
  final String? route;

  const RecentlyViewedItem({
    required this.title,
    required this.rating,
    required this.openHours,
    required this.location,
    required this.price,
    this.image,
    this.route,
  });
}

class RecentlyViewedPage extends StatelessWidget {
  final List<RecentlyViewedItem>? items;

  const RecentlyViewedPage({super.key, this.items});

  static const List<RecentlyViewedItem> _defaultItems = [
    RecentlyViewedItem(
      title: "Dunia Fantasi (DUFAN)",
      rating: 4.75,
      openHours: "Open 10:00 - 22:00",
      location: "Ancol, Jakarta utara",
      price: "Mulai dari Rp. 200.000",
      route: "/detail-dufan",
    ),
    RecentlyViewedItem(
      title: "Dunia Fantasi (DUFAN)",
      rating: 4.75,
      openHours: "Open 10:00 - 22:00",
      location: "Ancol, Jakarta utara",
      price: "Mulai dari Rp. 200.000",
      route: "/detail-dufan",
    ),
    RecentlyViewedItem(
      title: "Dunia Fantasi (DUFAN)",
      rating: 4.75,
      openHours: "Open 10:00 - 22:00",
      location: "Ancol, Jakarta utara",
      price: "Mulai dari Rp. 200.000",
      route: "/detail-dufan",
    ),
    RecentlyViewedItem(
      title: "Dunia Fantasi (DUFAN)",
      rating: 4.75,
      openHours: "Open 10:00 - 22:00",
      location: "Ancol, Jakarta utara",
      price: "Mulai dari Rp. 200.000",
      route: "/detail-dufan",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);
    final displayItems = items ?? _defaultItems;
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
                      "Terakhir Dilihat",
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
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: displayItems.length,
                itemBuilder: (context, index) {
                  final item = displayItems[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildItemRow(context, item),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFEEEEEE),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(BuildContext context, RecentlyViewedItem item) {
    return InkWell(
      onTap: () {
        if (item.route != null && item.route!.isNotEmpty) {
          Navigator.pushNamed(context, item.route!);
        } else {
          Navigator.pushNamed(context, "/detail-dufan");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular placeholder or thumbnail
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                shape: BoxShape.circle,
              ),
              child: item.image != null
                  ? ClipOval(
                      child: Image.asset(
                        item.image!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 14),

            // Item Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 15.5,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 13,
                        color: Color(0xFFFFB800),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.rating.toStringAsFixed(2),
                        style: const TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        " | ${item.openHours}",
                        style: const TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 10.5,
                          color: Color(0xFF555555),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.location,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 10.5,
                      color: Color(0xFF555555),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    item.price,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 10.5,
                      color: Color(0xFF555555),
                    ),
                  ),
                ],
              ),
            ),

            // Chevron Right
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: Color(0xFF333333),
            ),
          ],
        ),
      ),
    );
  }
}

// Backward compatibility alias
typedef TerakhirDilihatPage = RecentlyViewedPage;
