import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Future<void> showDeleteAccountDialog(BuildContext context) async {
    final passwordController = TextEditingController();
    bool hidePassword = true;

    await showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.38),
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Transform.translate(
              offset: const Offset(0, -87),
              child: Dialog(
                backgroundColor: Colors.white,
                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(36, 25, 36, 26),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "HAPUS AKUN",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),

                      const SizedBox(height: 14),

                      SizedBox(
                        height: 38,
                        child: TextField(
                          controller: passwordController,
                          obscureText: hidePassword,
                          cursorColor: const Color(0xFFED1C24),
                          style: const TextStyle(
                            fontFamily: "Kanit",
                            fontSize: 11,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: "Kata Sandi",
                            labelStyle: const TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF333333),
                            ),
                            hintText: "Masukan Kata Sandi",
                            hintStyle: const TextStyle(
                              fontFamily: "Kanit",
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFFB0B0B0),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setDialogState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              child: Icon(
                                hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 21,
                                color: const Color(0xFF263238),
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                              left: 13,
                              right: 7,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF1E2D),
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF1E2D),
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 11,
                          vertical: 8,
                        ),
                        color: const Color(0xFFFFE0E0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, 1),
                              child: const Icon(
                                Icons.error_outline,
                                size: 18,
                                color: Color(0xFFFF2535),
                              ),
                            ),

                            const SizedBox(width: 10),

                            const Expanded(
                              child: Text(
                                "Anda akan menghapus akun anda. "
                                "Tindakan ini tidak dapat dibatalkan. "
                                "Semua data akan hilang.",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 10,
                                  height: 1.35,
                                  color: Color(0xFF555555),
                                ),
                              ),
                            ),

                            const SizedBox(width: 6),

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                              },
                              child: Transform.translate(
                                offset: const Offset(0, 5),
                                child: const Icon(
                                  Icons.close,
                                  size: 15,
                                  color: Color(0xFF555555),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      Padding(
                        padding: const EdgeInsets.only(left: 105),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 90,
                              height: 38,
                              child: ElevatedButton(
                                onPressed: () {
                                  final password = passwordController.text
                                      .trim();

                                  if (password.isEmpty) {
                                    return;
                                  }

                                  Navigator.pop(dialogContext);

                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    "/login",
                                    (route) => false,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFED1C24),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  "Hapus",
                                  style: TextStyle(
                                    fontFamily: "Kanit",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 34),

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(dialogContext);
                              },
                              child: const Text(
                                "Batal",
                                style: TextStyle(
                                  fontFamily: "Kanit",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF333333),
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
          },
        );
      },
    );

    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 73,
              left: 0,
              right: 0,
              child: Container(
                height: 54,
                color: green,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Text(
                      "Pengaturan",
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
            ),

            Positioned(
              top: 145,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  settingsItemSvg(
                    asset: "lib/images/phone_settings_icon.svg",
                    title: "Ubah Nomor Hp",
                    onTap: () {
                      Navigator.pushNamed(context, "/change-phonenumber");
                    },
                  ),

                  settingsItemIcon(
                    icon: Icons.mail_outline,
                    title: "Ubah Email",
                    iconSize: 24,
                    onTap: () {
                      Navigator.pushNamed(context, "/change-email");
                    },
                  ),

                  settingsItemIcon(
                    icon: Icons.key_outlined,
                    title: "Ubah Kata Sandi",
                    iconSize: 25,
                    onTap: () {
                      Navigator.pushNamed(context, "/change-password");
                    },
                  ),

                  settingsItemSvg(
                    asset: "lib/images/delete_settings_icon.svg",
                    title: "Hapus Akun",
                    showBottomLine: false,
                    onTap: () {
                      showDeleteAccountDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsItemSvg({
    required String asset,
    required String title,
    required VoidCallback onTap,
    bool showBottomLine = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          border: showBottomLine
              ? const Border(
                  bottom: BorderSide(color: Color(0xFFD0D0D0), width: 1),
                )
              : null,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  asset,
                  width: 22,
                  height: 22,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 12),

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

            const Icon(Icons.chevron_right, size: 31, color: Colors.black),

            const SizedBox(width: 1),
          ],
        ),
      ),
    );
  }

  Widget settingsItemIcon({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    double iconSize = 24,
    bool showBottomLine = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          border: showBottomLine
              ? const Border(
                  bottom: BorderSide(color: Color(0xFFD0D0D0), width: 1),
                )
              : null,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(icon, size: iconSize, color: Colors.black),
              ),
            ),

            const SizedBox(width: 12),

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

            const Icon(Icons.chevron_right, size: 31, color: Colors.black),

            const SizedBox(width: 1),
          ],
        ),
      ),
    );
  }
}
