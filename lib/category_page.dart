import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef KategoriPage = CategoryPage;

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = "Semua";
  String? _selectedSort;

  final List<String> _categories = [
    "Semua",
    "Kuliner",
    "Sejarah",
    "Alam",
    "Religi",
    "Seni",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.25),
      builder: (context) => const FilterKategoriSheet(),
    );
  }

  void _openUrutkanSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.25),
      builder: (context) => UrutkanKategoriSheet(
        initialSelected: _selectedSort,
        onSelected: (val) {
          setState(() {
            _selectedSort = val;
          });
        },
      ),
    );
  }

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
                        size: 23,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Text(
                    "Kategori",
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

            // Search Bar & Filter / Urutkan
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFCCCCCC),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.search,
                            size: 19,
                            color: Color(0xFF333333),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: const TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Cari destinasi wisata",
                                hintStyle: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFF777777),
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Filter action button
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _openFilterSheet,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.tune,
                          size: 20,
                          color: primaryGreen,
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Filter",
                          style: TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 8.5,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Urutkan action button
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _openUrutkanSheet,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.swap_vert,
                          size: 20,
                          color: primaryGreen,
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Urutkan",
                          style: TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 8.5,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Category Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: _categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.black
                                  : const Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 2.5,
                            width: 44,
                            color: isSelected
                                ? primaryGreen
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Divider under tabs
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFE5E5E5),
            ),

            // Destination Items List
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: 7,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFEFEFEF),
                ),
                itemBuilder: (context, index) {
                  return _buildDestinationItem(
                    title: "Dunia Fantasi (DUFAN)",
                    rating: "4.75",
                    hours: "Open 10:00 - 22:00",
                    location: "Ancol, Jakarta utara",
                    price: "Mulai dari Rp. 200.000",
                    onTap: () {
                      Navigator.pushNamed(context, "/detail-dufan");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationItem({
    required String title,
    required String rating,
    required String hours,
    required String location,
    required String price,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            // Grey circular placeholder avatar
            Container(
              width: 58,
              height: 58,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 14),

            // Title, Rating, Hours, Location, Price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 14.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xFFFFD600),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        rating,
                        style: const TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        " | $hours",
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
                    location,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 10.5,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    price,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 10.5,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),

            // Chevron right arrow
            const Icon(
              Icons.chevron_right,
              size: 22,
              color: Color(0xFF444444),
            ),
          ],
        ),
      ),
    );
  }
}

/// Modal Bottom Sheet for "Urutkan"
class UrutkanKategoriSheet extends StatefulWidget {
  final String? initialSelected;
  final ValueChanged<String>? onSelected;

  const UrutkanKategoriSheet({
    super.key,
    this.initialSelected,
    this.onSelected,
  });

  @override
  State<UrutkanKategoriSheet> createState() => _UrutkanKategoriSheetState();
}

class _UrutkanKategoriSheetState extends State<UrutkanKategoriSheet> {
  String? _selectedOption;

  final List<String> _sortOptions = [
    "Direkomendasikan",
    "Harga Tertinggi",
    "Harga Terendah",
    "Ulasan Terbaik",
    "Jarak Terdekat",
  ];

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);

    return Container(
      height: MediaQuery.of(context).size.height * 0.42,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(26),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Drag handle
            Center(
              child: Container(
                width: 105,
                height: 11,
                decoration: BoxDecoration(
                  color: const Color(0xFFC7C7C7),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Header: "Urutkan" and Close (X)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Urutkan",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 18.5,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      size: 21,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Divider
            const Divider(
              height: 1,
              thickness: 1.2,
              color: Color(0xFFD0D0D0),
            ),

            const SizedBox(height: 8),

            // Options List
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _sortOptions.map((option) {
                    final isSelected = _selectedOption == option;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedOption = option;
                        });
                        widget.onSelected?.call(option);
                        Future.delayed(const Duration(milliseconds: 200), () {
                          if (context.mounted) Navigator.pop(context);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              option,
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 15.5,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                color: Colors.black87,
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF5A8E85),
                                  width: 1.5,
                                ),
                                color: isSelected
                                    ? primaryGreen
                                    : Colors.transparent,
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      size: 13,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Modal Bottom Sheet for "Filter"
class FilterKategoriSheet extends StatefulWidget {
  const FilterKategoriSheet({super.key});

  @override
  State<FilterKategoriSheet> createState() => _FilterKategoriSheetState();
}

class _FilterKategoriSheetState extends State<FilterKategoriSheet> {
  // Rentang Jarak
  String _selectedJarakPill = "500 M";
  double _sliderDistance = 0.12;

  // Rentang Harga
  String _selectedPriceQuick = "";

  // Lokasi Populer
  String? _selectedLokasi;

  // Zona
  String? _selectedZona;

  final List<String> _lokasiList = [
    "Blok M",
    "Gelora Bung Karno",
    "Senayan",
    "Citra Delapan",
  ];

  void _resetFilters() {
    setState(() {
      _selectedJarakPill = "500 M";
      _sliderDistance = 0.12;
      _selectedPriceQuick = "";
      _selectedLokasi = null;
      _selectedZona = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Filter telah direset"),
        duration: Duration(milliseconds: 700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);

    return Container(
      height: MediaQuery.of(context).size.height * 0.87,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(26),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 14),

          // Top drag handle
          Center(
            child: Container(
              width: 76,
              height: 7.5,
              decoration: BoxDecoration(
                color: const Color(0xFFC7C7C7),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),

          const SizedBox(height: 22),

          // Header: Filter, Reset, Close (X)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  "Filter",
                  style: TextStyle(
                    fontFamily: "Kanit",
                    fontSize: 18.5,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _resetFilters,
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF29B6F6),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    size: 21,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 26),

          // Content scrollable
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Rentang Jarak
                  const Text(
                    "Rentang Jarak",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 15.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Distance Pills
                  Row(
                    children: [
                      _buildJarakPill("500 M"),
                      const SizedBox(width: 8),
                      _buildJarakPill("Terdekat"),
                      const SizedBox(width: 8),
                      _buildJarakPill("Terjauh"),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Distance Slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackShape: const FullWidthSliderTrackShape(),
                      trackHeight: 2.5,
                      activeTrackColor: primaryGreen,
                      inactiveTrackColor: const Color(0xFFD6D6D6),
                      thumbColor: primaryGreen,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 6,
                      ),
                      overlayColor: primaryGreen.withValues(alpha: 0.15),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 11,
                      ),
                    ),
                    child: Slider(
                      value: _sliderDistance,
                      onChanged: (val) {
                        setState(() {
                          _sliderDistance = val;
                        });
                      },
                    ),
                  ),

                  // Slider labels
                  const Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Terdekat",
                          style: TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 8.5,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Terjauh",
                          style: TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 8.5,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Thin divider between distance section and price section
                  const Divider(
                    height: 1,
                    thickness: 0.8,
                    color: Color(0xFFEEEEEE),
                  ),

                  const SizedBox(height: 18),

                  // 2. Rentang Harga
                  const Text(
                    "Rentang Harga",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 15.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Minimal & Maksimal green boxes
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 12,
                            top: 4,
                            right: 12,
                            bottom: 7.5,
                          ),
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Minimal",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 8.5,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                "Rp 100.000,00",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 12,
                            top: 4,
                            right: 12,
                            bottom: 7.5,
                          ),
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maksimal",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 8.5,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                "Rp 99.999.999,00",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Quick price filter pills
                  Row(
                    children: [
                      Expanded(child: _buildQuickPricePill("< Rp 50.000,00")),
                      const SizedBox(width: 12),
                      Expanded(child: _buildQuickPricePill("< Rp 100.000,00")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: _buildQuickPricePill("< Rp 300.000,00")),
                      const SizedBox(width: 12),
                      Expanded(child: _buildQuickPricePill("Gratis")),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Divider
                  const Divider(
                    height: 20,
                    thickness: 1,
                    color: Color(0xFFEEEEEE),
                  ),

                  const SizedBox(height: 8),

                  // 3. Lokasi Populer
                  const Text(
                    "Lokasi Populer",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 15.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 6),

                  ..._lokasiList.map((lokasi) {
                    final isSelected = _selectedLokasi == lokasi;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedLokasi = isSelected ? null : lokasi;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lokasi,
                              style: const TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 12.5,
                                color: Colors.black87,
                              ),
                            ),
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF5A8E85),
                                  width: 1.5,
                                ),
                                color: isSelected
                                    ? primaryGreen
                                    : Colors.transparent,
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 14),

                  // 4. Zona
                  const Text(
                    "Zona",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 15.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      // Dalam Ruangan
                      _buildZonaCard(
                        id: "dalam",
                        label: "Dalam Ruangan",
                        iconWidget: CustomPaint(
                          size: const Size(22, 22),
                          painter: IndoorIconPainter(),
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Luar Ruangan
                      _buildZonaCard(
                        id: "luar",
                        label: "Luar Ruangan",
                        iconWidget: Image.asset(
                          "lib/images/soccer_ball_icon.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return CustomPaint(
                              size: const Size(20, 20),
                              painter: SoccerBallPainter(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJarakPill(String label) {
    const primaryGreen = Color(0xFF176E5E);
    final isSelected = _selectedJarakPill == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedJarakPill = label;
          if (label == "500 M") _sliderDistance = 0.12;
          if (label == "Terdekat") _sliderDistance = 0.0;
          if (label == "Terjauh") _sliderDistance = 1.0;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6.5),
        decoration: BoxDecoration(
          color: isSelected ? primaryGreen : const Color(0xFF176E5E),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: "Kanit",
            fontSize: 11.5,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickPricePill(String label) {
    final isSelected = _selectedPriceQuick == label;
    const primaryGreen = Color(0xFF176E5E);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPriceQuick = isSelected ? "" : label;
        });
      },
      child: Container(
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? primaryGreen : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? primaryGreen : const Color(0xFF333333),
            width: 1.2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: "Kanit",
            fontSize: 12.5,
            fontWeight: FontWeight.w800,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildZonaCard({
    required String id,
    required String label,
    required Widget iconWidget,
  }) {
    final isSelected = _selectedZona == id;
    const primaryGreen = Color(0xFF176E5E);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedZona = isSelected ? null : id;
        });
      },
      child: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          color: isSelected ? primaryGreen.withValues(alpha: 0.08) : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ? primaryGreen : const Color(0xFFCCCCCC),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 8.5,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? primaryGreen : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom painter to draw the indoor roof icon with airflow waves
class IndoorIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    final path = Path();
    path.moveTo(size.width * 0.5, 2);
    path.lineTo(size.width - 2, size.height * 0.4);
    path.lineTo(size.width - 2, size.height - 2);
    path.lineTo(2, size.height - 2);
    path.lineTo(2, size.height * 0.4);
    path.close();
    canvas.drawPath(path, paint);

    for (int i = 0; i < 2; i++) {
      final y = size.height * 0.55 + (i * 4.5);
      final wave = Path();
      wave.moveTo(size.width * 0.28, y);
      wave.quadraticBezierTo(size.width * 0.4, y - 2, size.width * 0.5, y);
      wave.quadraticBezierTo(size.width * 0.6, y + 2, size.width * 0.72, y);
      canvas.drawPath(wave, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom slider track that spans edge-to-edge across the available parent width
class FullWidthSliderTrackShape extends RoundedRectSliderTrackShape {
  const FullWidthSliderTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 2.5;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

/// Custom painter to draw the outdoor soccer ball icon
class SoccerBallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final bgPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;
    final blackFill = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius - 1, bgPaint);
    canvas.drawCircle(center, radius - 1, strokePaint);

    final pentaRadius = radius * 0.38;
    final pentaPath = Path();
    for (int i = 0; i < 5; i++) {
      final angle = -pi / 2 + (i * 2 * pi / 5);
      final pt = Offset(
        center.dx + pentaRadius * cos(angle),
        center.dy + pentaRadius * sin(angle),
      );
      if (i == 0) {
        pentaPath.moveTo(pt.dx, pt.dy);
      } else {
        pentaPath.lineTo(pt.dx, pt.dy);
      }
    }
    pentaPath.close();
    canvas.drawPath(pentaPath, blackFill);

    for (int i = 0; i < 5; i++) {
      final angle = -pi / 2 + (i * 2 * pi / 5);
      final p1 = Offset(
        center.dx + pentaRadius * cos(angle),
        center.dy + pentaRadius * sin(angle),
      );
      final p2 = Offset(
        center.dx + (radius - 1) * cos(angle),
        center.dy + (radius - 1) * sin(angle),
      );
      canvas.drawLine(p1, p2, strokePaint);

      final leftAngle = angle - 0.28;
      final rightAngle = angle + 0.28;
      final patchPath = Path();
      patchPath.moveTo(
        center.dx + (radius - 1) * cos(leftAngle),
        center.dy + (radius - 1) * sin(leftAngle),
      );
      patchPath.lineTo(
        center.dx + (radius - 1) * cos(rightAngle),
        center.dy + (radius - 1) * sin(rightAngle),
      );
      patchPath.lineTo(
        center.dx + (radius * 0.72) * cos(angle),
        center.dy + (radius * 0.72) * sin(angle),
      );
      patchPath.close();
      canvas.drawPath(patchPath, blackFill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
