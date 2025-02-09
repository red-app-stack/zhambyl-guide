import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../views/shared/user_settings.dart';

class SecureStore extends GetxController {
  static const String settingsKey = 'user_settings';
  static const String favoritesKey = 'favorite_transfers';
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  UserSettings? currentSettings;

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> secureStore(String key, String data) async {
    try {
      await secureStorage.write(key: key, value: data);
    } catch (e) {
      print('Error storing data securely: $key, $data');
    }
  }

  Future<String?> secureRead(String key) async {
    return await secureStorage.read(key: key);
  }

  Future<void> saveSettings(UserSettings settings) async {
    final settingsJson = jsonEncode(settings.toJson());
    currentSettings = settings;
    await secureStore(settingsKey, settingsJson);
  }

  Future<UserSettings?> loadSettings() async {
    if (currentSettings == null) {
      final settingsJson = await secureRead(settingsKey);
      if (settingsJson != null) {
        currentSettings = UserSettings.fromJson(jsonDecode(settingsJson));
        return currentSettings;
      }
      currentSettings = null;
      return null;
    } else {
      return currentSettings;
    }
  }
}
