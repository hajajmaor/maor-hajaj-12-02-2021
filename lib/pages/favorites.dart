import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/components/theme_change_btn.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/city_name_code_model.dart';
import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/view_model/current_weather_view_model.dart';
import 'package:weather_app/view_model/forcast_per_day_view_model.dart';

class FavoritePage extends ConsumerWidget {
  String capitalizeString(String str) {
    if (str.contains(' ', 1)) {
      final List<String> words = str.trim().split(' ');
      str = '';
      for (String word in words) {
        str += word[0].toUpperCase() + word.substring(1) + " ";
      }
      return str.trim();
    }
    return str[0].toUpperCase() + str.substring(1);
  }

  @override
  Widget build(BuildContext context, watch) {
    final degPro = watch(degProvider);
    // final cityProvider = watch(cityToSearchProvider);
    final prodBool = watch(prodURLBool);

    final Box<CityNameCodeModel> favoriteBox = Hive.box('favorites');
    final Set<CityNameCodeModel> favoriteList = favoriteBox.values.toSet();
    // print('');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
        ),
        actions: [
          const ChangeThemesIconButton(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (_, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).pop(
                    capitalizeString(favoriteList.elementAt(index).cityName));
              },
              title: Text(
                  capitalizeString(favoriteList.elementAt(index).cityName)),
              subtitle: Text('${favoriteList.elementAt(index).cityCode}'),
              trailing: FutureBuilder(
                future: ApiService.getCurrentWeather(
                  cityCode: favoriteList.elementAt(index).cityCode,
                  useProd: prodBool.state,
                ),
                builder: (_, snapshot) {
                  if (snapshot.hasError)
                    return Text("Error: ${snapshot.error}");
                  if (!snapshot.hasData &&
                      (snapshot.connectionState == ConnectionState.active ||
                          snapshot.connectionState == ConnectionState.waiting))
                    return CircularProgressIndicator();
                  final RequestResult status = snapshot.data['status'];

                  if (status != RequestResult.Found)
                    return Text(status == RequestResult.Error
                        ? "Error"
                        : "exceeded number of requests for day");

                  final CurrentWeatherViewModel currentWeatherViewModel =
                      snapshot.data['data'];
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        degPro.getDegree(
                            currentWeatherViewModel.model.currentTemperature),
                      ),
                      CachedNetworkImage(
                        imageUrl: ForcastPerDayViewModel.getIcon(
                            currentWeatherViewModel.model.weatherIcon),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: 100,
                        width: 100,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
