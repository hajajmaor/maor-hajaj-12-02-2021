import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/main.dart';

class DegChangeButton extends ConsumerWidget {
  const DegChangeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = watch(degProvider);
    return Tooltip(
      message: "Change to ${theme.isCelsius() ? 'Fahrenheit' : 'Celsius'}",
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Text(
              // alt 0176 = °
              "${theme.isCelsius() ? 'C' : 'F'}°",
              style: const TextStyle(
                letterSpacing: 5,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        onTap: () => theme.switchDeg(),
      ),
    );
  }
}
