import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef CuacaPage = WeatherPage;

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF176E5E);
    const pageBgColor = Color(0xFFD6E3DE);

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
        backgroundColor: pageBgColor,
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
                    "Cuaca",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 18,
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
                padding: const EdgeInsets.fromLTRB(
                  16,
                  0,
                  16,
                  28,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),

                    // Weather forecast
                    SizedBox(
                      height: 168,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Positioned(
                            left: 0,
                            top: 0,
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Prakiraan Cuaca",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  "Klapanunggal, Bogor",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 13,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 17),
                                Text(
                                  "30°C",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 50,
                                    height: 0.95,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 9),
                                Text(
                                  "Cerah Berawan",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            right: 5,
                            top: -9,
                            child: SizedBox(
                              width: 175,
                              height: 150,
                              child: Transform.scale(
                                scale: 1.45,
                                child: Image.asset(
                                  "lib/images/cerah_berawan.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Humidity and air quality
                    Transform.translate(
                      offset: const Offset(0, -5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 67,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: primaryGreen,
                                borderRadius:
                                    BorderRadius.circular(9),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "lib/images/humidity_icon.png",
                                        width: 13,
                                        height: 13,
                                        color: Colors.white,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return const Icon(
                                            Icons.water_drop_outlined,
                                            size: 13,
                                            color: Colors.white,
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 6),
                                      const Text(
                                        "Kelembapan",
                                        style: TextStyle(
                                          fontFamily: "Kanit",
                                          fontSize: 9.5,
                                          fontWeight:
                                              FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "92%",
                                    style: TextStyle(
                                      fontFamily: "Kanit",
                                      fontSize: 23,
                                      height: 1,
                                      fontWeight:
                                          FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Container(
                              height: 67,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: primaryGreen,
                                borderRadius:
                                    BorderRadius.circular(9),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "lib/images/air_quality_icon.png",
                                        width: 13,
                                        height: 13,
                                        color: Colors.white,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return const Icon(
                                            Icons.air,
                                            size: 13,
                                            color: Colors.white,
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 6),
                                      const Text(
                                        "Kualitas Udara",
                                        style: TextStyle(
                                          fontFamily: "Kanit",
                                          fontSize: 9.5,
                                          fontWeight:
                                              FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "39.1",
                                    style: TextStyle(
                                      fontFamily: "Kanit",
                                      fontSize: 23,
                                      height: 1,
                                      fontWeight:
                                          FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Today forecast
                    const Text(
                      "Hari ini",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Hourly forecast list
                    SizedBox(
                      height: 90,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.hardEdge,
                        child: const Row(
                          children: [
                            _HourlyWeatherCard(
                              temperature: "30°C",
                              time: "Sekarang",
                            ),

                            SizedBox(width: 16),

                            _HourlyWeatherCard(
                              temperature: "30°C",
                              time: "07:00",
                            ),

                            SizedBox(width: 16),

                            _HourlyWeatherCard(
                              temperature: "30°C",
                              time: "07:00",
                            ),

                            SizedBox(width: 16),

                            _HourlyWeatherCard(
                              temperature: "30°C",
                              time: "07:00",
                            ),

                            SizedBox(width: 16),

                            _HourlyWeatherCard(
                              temperature: "30°C",
                              time: "07:00",
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),

                    // Daily forecast
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 11,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: 0.15,
                            ),
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _DailyForecastRow(
                            day: "Hari Ini",
                            temperature: "30°C / 20°C",
                          ),

                          SizedBox(height: 9),

                          _DailyForecastRow(
                            day: "Besok",
                            temperature: "30°C / 20°C",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Daily activities
                    const Text(
                      "Aktivitas Harian",
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 32,
                          child: Icon(
                            Icons.sentiment_very_satisfied,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(width: 13),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Berjalan-jalan adalah pilihan terbaik saat ini !",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Colors.black,
                                ),
                              ),

                              const SizedBox(height: 2),

                              GestureDetector(
                                behavior:
                                    HitTestBehavior.opaque,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/kategori",
                                  );
                                },
                                child: const Text(
                                  "Lihat Destinasi Wisata",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 10,
                                    height: 1.1,
                                    fontWeight:
                                        FontWeight.w500,
                                    color:
                                        Color(0xFF29B6F6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 32,
                          child: Center(
                            child: Image.asset(
                              "lib/images/umbrella_icon.png",
                              width: 20,
                              height: 27,
                              fit: BoxFit.contain,
                              errorBuilder: (
                                context,
                                error,
                                stackTrace,
                              ) {
                                return const Icon(
                                  Icons.beach_access_outlined,
                                  size: 26,
                                  color: Colors.black87,
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 13),

                        const Expanded(
                          child: Text(
                            "Jangan lupa bawa payung untuk berjaga-jaga",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 32,
                          child: Center(
                            child: Image.asset(
                              "lib/images/outdoor_icon.png",
                              width: 27,
                              height: 27,
                              fit: BoxFit.contain,
                              errorBuilder: (
                                context,
                                error,
                                stackTrace,
                              ) {
                                return const Icon(
                                  Icons.home_outlined,
                                  size: 26,
                                  color: Colors.black87,
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 13),

                        const Expanded(
                          child: Text(
                            "Aktivitas outdoor direkomendasikan",
                            style: TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
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
}

// Hourly weather card
class _HourlyWeatherCard extends StatelessWidget {
  final String temperature;
  final String time;

  const _HourlyWeatherCard({
    required this.temperature,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Transform.translate(
          offset: const Offset(0, -5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 68,
                height: 45,
                child: Transform.scale(
                  scale: 1.20,
                  child: Image.asset(
                    "lib/images/cerah_berawan.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 1),

              Text(
                temperature,
                style: const TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 10,
                  height: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                time,
                style: const TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 10,
                  height: 1,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Forecast summary row
class _DailyForecastRow extends StatelessWidget {
  final String day;
  final String temperature;

  const _DailyForecastRow({
    required this.day,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          SizedBox(
            width: 72,
            child: Text(
              day,
              style: const TextStyle(
                fontFamily: "Kanit",
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          Image.asset(
            "lib/images/cerah_berawan.png",
            width: 32,
            height: 26,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 20),

          const Expanded(
            child: Text(
              "Cerah Berawan",
              style: TextStyle(
                fontFamily: "Kanit",
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(width: 8),

          Text(
            temperature,
            style: const TextStyle(
              fontFamily: "Kanit",
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}