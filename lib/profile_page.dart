import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'user_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> showLogoutDialog(BuildContext context) async {
    const green = Color(0xFF176E5E);

    await showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.32),
      builder: (dialogContext) {
        return Transform.translate(
          offset: const Offset(0, -40),
          child: Dialog(
            backgroundColor: Colors.white,
            insetPadding: const EdgeInsets.symmetric(horizontal: 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(45, 27, 45, 29),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Keluar?",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Apakah Kamu Yakin Ingin Keluar?",
                    style: TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF555555),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: green,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              "Batal",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 32,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                "/login",
                                (route) => false,
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.zero,
                              side: const BorderSide(color: green, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              "Keluar",
                              style: TextStyle(
                                fontFamily: "Kanit",
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget menuItem({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
    IconData? icon,
    String? svgAsset,
    bool showBottomBorder = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: showBottomBorder
              ? const Border(
                  bottom: BorderSide(color: Color(0xFFD0D0D0), width: 1),
                )
              : null,
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
                        child: ValueListenableBuilder<String>(
                          valueListenable: UserProfile.imageNotifier,
                          builder: (context, currentImage, _) {
                            return ClipOval(
                              child: Image.asset(
                                currentImage,
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
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 158,
                    left: 0,
                    right: 0,
                    child: ValueListenableBuilder<String>(
                      valueListenable: UserProfile.nameNotifier,
                      builder: (context, currentName, _) {
                        return Text(
                          currentName.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        );
                      },
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
                      onTap: () {
                        Navigator.pushNamed(context, "/settings");
                      },
                    ),

                    menuItem(
                      context: context,
                      svgAsset: "lib/images/edit_profile_icon.svg",
                      title: "Edit Profil",
                      onTap: () {
                        Navigator.pushNamed(context, "/edit-profile");
                      },
                    ),

                    menuItem(
                      context: context,
                      icon: Icons.lock_outline,
                      title: "Kebijakan Privasi",
                      onTap: () {
                        Navigator.pushNamed(context, "/privacy-policy");
                      },
                    ),

                    menuItem(
                      context: context,
                      icon: Icons.info_outline,
                      title: "Tentang Kami",
                      onTap: () {
                        Navigator.pushNamed(context, "/about-us");
                      },
                    ),

                    menuItem(
                      context: context,
                      icon: Icons.task_outlined,
                      title: "Ketentuan Layanan",
                      onTap: () {
                        Navigator.pushNamed(context, "/terms");
                      },
                    ),

                    menuItem(
                      context: context,
                      icon: Icons.logout,
                      title: "Keluar",
                      showBottomBorder: false,
                      onTap: () {
                        showLogoutDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: Container(
          color: green,
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: 65,
              child: Row(
                children: [
                  // Beranda
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/home");
                      },
                      child: Center(
                        child: SvgPicture.asset(
                          "lib/images/home_nav_icon.svg",
                          width: 25,
                          height: 24,
                          fit: BoxFit.contain,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Rekomendasi
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
                        child: Image.asset(
                          "lib/images/recommendation_nav_icon.png",
                          width: 20,
                          height: 24,
                          color: Colors.white,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  // Chat
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Center(
                        child: SvgPicture.asset(
                          "lib/images/chat_nav_icon.svg",
                          width: 26,
                          height: 26,
                          fit: BoxFit.contain,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Akun (Active)
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
                                child: const Icon(
                                  Icons.person,
                                  size: 32,
                                  color: green,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "AKUN",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
