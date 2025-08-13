import 'package:flutter/material.dart';
import 'package:news/ui/utilites/app_asstes.dart';

class ThemeProvider extends ChangeNotifier {
  var themeMode = ThemeMode.light;

  String get splach =>
      themeMode == ThemeMode.light
          ? AppAsstes.splachL
          : AppAsstes
              .splachD; //* this function uded to chock the mode and assin the image
  bool get isDark {
    return themeMode == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newMode) {
    themeMode = newMode;
    notifyListeners(); //* this reblace the setState function
  }
}
