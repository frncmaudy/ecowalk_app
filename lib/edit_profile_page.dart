import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  void saveProfile() {
    FocusScope.of(context).unfocus();

    if (usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nama pengguna wajib diisi")),
      );
      return;
    }

    Navigator.pop(context);
  }

  Widget photoOption({
    required String asset,
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        hoverColor: const Color(0xFFF1F1F1),
        highlightColor: const Color(0xFFF1F1F1),
        focusColor: const Color(0xFFF1F1F1),
        splashColor: const Color(0xFFE5E5E5),
        child: SizedBox(
          width: 70,
          height: 92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                asset,
                width: 42,
                height: 42,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 7),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: "Kanit",
                  fontSize: 11,
                  height: 1,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changePhoto() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.32),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: 223,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),

              Container(
                width: 72,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFFBDBDBD),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  photoOption(
                    asset: "lib/images/camera_icon.svg",
                    label: "Kamera",
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.pushNamed(context, "/camera-profile");
                    },
                  ),

                  const SizedBox(width: 22),

                  photoOption(
                    asset: "lib/images/gallery_icon.svg",
                    label: "Galeri",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              const Spacer(),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 1,
                color: const Color(0xFFE5E5E5),
              ),

              const SizedBox(height: 17),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);

    final screenHeight = MediaQuery.of(context).size.height;
    final contentHeight = screenHeight < 852 ? 852.0 : screenHeight;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: contentHeight,
            child: Stack(
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
                            size: 25,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 18),

                        const Text(
                          "Edit Profil",
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
                  top: 157,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "lib/images/profile.jpeg",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFFEAEAEA),
                                  child: const Icon(
                                    Icons.person,
                                    size: 70,
                                    color: green,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        Positioned(
                          right: -1,
                          bottom: 2,
                          child: GestureDetector(
                            onTap: changePhoto,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 329,
                  left: 18,
                  right: 18,
                  child: TextFormField(
                    controller: usernameController,
                    cursorColor: green,
                    style: const TextStyle(
                      fontFamily: "Kanit",
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Nama Pengguna",
                      hintStyle: TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF777777),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 21,
                        color: Color(0xFF888888),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 35,
                        minHeight: 30,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 12, bottom: 12),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF555555),
                          width: 1,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: green, width: 1.3),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 450,
                  left: 16,
                  right: 16,
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      onPressed: saveProfile,
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
                        "SIMPAN",
                        style: TextStyle(
                          fontFamily: "Kanit",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
