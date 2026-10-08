import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget menuItem({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    IconData? icon,
    String? svgAsset,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFD0D0D0), width: 1),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 27,
              height: 27,
              child: svgAsset != null
                  ? SvgPicture.asset(svgAsset, fit: BoxFit.contain)
                  : Icon(icon, size: 26, color: Colors.black),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, size: 30, color: Colors.black),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);
    const lightGreen = Color.fromARGB(255, 47, 123, 107);

    final topPadding = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: topPadding + 38,
              color: lightGreen,
            ),

            SizedBox(
              height: 230,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 88, color: green),
                  ),

                  Positioned(
                    top: 18,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 132,
                        height: 132,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: ClipOval(
                          child: Image.asset(
                            "lib/images/profile.jpeg",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFFEAEAEA),
                                child: const Icon(
                                  Icons.person,
                                  size: 75,
                                  color: green,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Positioned(
                    top: 158,
                    left: 0,
                    right: 0,
                    child: Text(
                      "FIORENCIA MAUDY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 195,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 192,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "frncmaudy@gmail.com",
                          style: TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 18),

                    menuItem(
                      context: context,
                      icon: Icons.settings_outlined,
                      title: "Pengaturan",
                      onTap: () {},
                    ),

                    menuItem(
                      context: context,
                      svgAsset: "lib/images/edit_profile_icon.svg",
                      title: "Edit Profil",
                      onTap: () {},
                    ),

                    menuItem(
                      context: context,
                      icon: Icons.lock_outline,
                      title: "Kebijakan Privasi",
                      onTap: () {},
                    ),

                    menuItem(
                      context: context,
                      icon: Icons.info_outline,
                      title: "Tentang Kami",
                      onTap: () {},
                    ),

                    menuItem(
                      context: context,
                      icon: Icons.task_outlined,
                      title: "Ketentuan Layanan",
                      onTap: () {},
                    ),

                    menuItem(
                      context: context,
                      icon: Icons.logout,
                      title: "Keluar",
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/login",
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: SizedBox(
          height: 85,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 22,
                bottom: 0,
                child: Container(color: green),
              ),

              Positioned.fill(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {},
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
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: SvgPicture.asset(
                              "lib/images/shield_nav_icon.svg",
                              width: 18,
                              height: 22,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
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
                    ),

                    Expanded(
                      child: Transform.translate(
                        offset: const Offset(0, -5),
                        child: Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: green, width: 9),
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 28,
                                color: green,
                              ),
                            ),
                            const Text(
                              "AKUN",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
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
            ],
          ),
        ),
      ),
    );
  }
}
