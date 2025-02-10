import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedSettings();
  }

  Future<void> loadSavedSettings() async {
    themeMode.value = ThemeMode.system;
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    saveThemeSettings();
  }

  Future<void> saveThemeSettings() async {
    Get.changeThemeMode(themeMode.value);
  }

  void toggleTheme(BuildContext context) {
    setThemeMode(themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
