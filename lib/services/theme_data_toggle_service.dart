import 'package:flutter/material.dart';

class ThemeDataService extends ChangeNotifier {
  ThemeData current = ThemeData.light();

  void changeToDark() {
    current = ThemeData.dark();
    notifyListeners();
  }

  void changeToLight() {
    current = ThemeData.light();
    notifyListeners();
  }

  void switchTheme() {
    if (current == ThemeData.light())
      this.changeToDark();
    else
      this.changeToLight();
  }

  bool isLight() => current == ThemeData.light();
}
