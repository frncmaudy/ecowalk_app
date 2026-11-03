import 'package:flutter/material.dart';

/// In-memory profile state manager for Ecowalk.
/// Keeps changes active during the app session, and automatically
/// reverts back to default values upon application restart.
class UserProfile {
  static const String defaultName = "Fiorencia Maudy";
  static const String defaultImage = "lib/images/profile.jpeg";
  static const String previewImage = "lib/images/profile_preview.png";

  static final ValueNotifier<String> nameNotifier =
      ValueNotifier<String>(defaultName);
  static final ValueNotifier<String> imageNotifier =
      ValueNotifier<String>(defaultImage);

  static String get name => nameNotifier.value;
  static String get image => imageNotifier.value;

  /// Update in-memory name and/or image
  static void updateProfile({String? newName, String? newImage}) {
    if (newName != null && newName.trim().isNotEmpty) {
      nameNotifier.value = newName.trim();
    }
    if (newImage != null && newImage.trim().isNotEmpty) {
      imageNotifier.value = newImage.trim();
    }
  }

  /// Reset to default name ("Fiorencia Maudy") and original image ("lib/images/profile.jpeg")
  static void resetToDefault() {
    nameNotifier.value = defaultName;
    imageNotifier.value = defaultImage;
  }
}
