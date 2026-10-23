import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfilePreviewPage extends StatefulWidget {
  const EditProfilePreviewPage({super.key});

  @override
  State<EditProfilePreviewPage> createState() => _EditProfilePreviewPageState();
}

class _EditProfilePreviewPageState extends State<EditProfilePreviewPage> {
  final usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  void saveProfile() {
    FocusScope.of(context).unfocus();

    Navigator.pushNamedAndRemoveUntil(context, "/profile", (route) => false);
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
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipOval(
                            child: Image.asset(
                              "lib/images/profile_preview.png",
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          right: -1,
                          bottom: 2,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                "/edit-profile",
                              );
                            },
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
                  top: 460,
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
