import 'package:flutter/material.dart';

enum Degrees { Celsius, Fahrenheit }

class DegreeService extends ChangeNotifier {
  Degrees current = Degrees.Celsius;

  void changeToFahrenheit() {
    current = Degrees.Fahrenheit;
    notifyListeners();
  }

  void changeToCelsius() {
    current = Degrees.Celsius;
    notifyListeners();
  }

  void switchDeg() {
    if (current == Degrees.Celsius)
      this.changeToFahrenheit();
    else
      this.changeToCelsius();
  }

  double celsiusToFahrenheit(double celsius) => (celsius * (9 / 5)) + 32;
  bool isCelsius() => current == Degrees.Celsius;

  String getDegree(double temp) =>
      "${current == Degrees.Celsius ? temp : '${celsiusToFahrenheit(temp).toStringAsPrecision(4)}'}°";
}
