import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/model/city_name_code_model.dart';
import 'package:weather_app/model/forcast_for_five_days_model.dart';
import 'package:weather_app/model/forcast_per_day_model.dart';
import 'package:weather_app/services/deg_toggle_service.dart';
import 'package:weather_app/services/theme_data_toggle_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ForcastForFiveDaysModelAdapter())
    ..registerAdapter(CityNameCodeModelAdapter())
    ..registerAdapter(ForcastPerDayModelAdapter());

  await Hive.openBox<CityNameCodeModel>('favorites');
  // await Hive.openBox<ForcastForFiveDaysModel>('forcasts');
  await Hive.openBox<CityNameCodeModel>('historyCityCodeName');

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final themeProvier = ChangeNotifierProvider<ThemeDataService>((ref) {
  return ThemeDataService();
});
final degProvider = ChangeNotifierProvider<DegreeService>((ref) {
  return DegreeService();
});

/// use in order to use Production or demo server - switch in the drawer
final prodURLBool = StateProvider<bool>((ref) {
  return true;
});

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // lock to portrait position
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final theme = watch(themeProvier).current;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: theme.copyWith(
        textTheme: GoogleFonts.loraTextTheme(theme.textTheme),
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
