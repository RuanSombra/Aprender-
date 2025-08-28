import 'package:flutter/material.dart';

class ThemeController {
  static final ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  static void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
