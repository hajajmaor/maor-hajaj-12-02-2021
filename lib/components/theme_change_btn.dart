import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/main.dart';

class ChangeThemesIconButton extends ConsumerWidget {
  const ChangeThemesIconButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = watch(themeProvier);
    return IconButton(
      tooltip: "Change to ${theme.isLight() ? 'dark' : 'light'} theme",
      icon: Icon(
        theme.isLight() ? Icons.wb_sunny : Icons.wb_sunny_outlined,
      ),
      onPressed: () => theme.switchTheme(),
    );
  }
}
