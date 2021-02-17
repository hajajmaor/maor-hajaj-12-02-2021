import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/main.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final prodBool = watch(prodURLBool);
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8),
          //   top: 0,
          //   left: 8,
          //   right: 8,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Use Production server:'),
                Checkbox(
                  value: prodBool.state,
                  onChanged: (value) => prodBool.state = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
