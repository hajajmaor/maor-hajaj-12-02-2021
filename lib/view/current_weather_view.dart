import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/components/favorite_btn.dart';
import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/view_model/current_weather_view_model.dart';
import 'package:weather_app/view_model/forcast_per_day_view_model.dart';

import '../main.dart';

class CurrentWeatherView extends ConsumerWidget {
  const CurrentWeatherView({@required this.onPressed, Key key, this.cityName})
      : super(key: key);
  final String cityName;
  final Function onPressed;

  @override
  Widget build(BuildContext context, watch) {
    final degPro = watch(degProvider);
    final prodBool = watch(prodURLBool);
    return FutureBuilder(
        future: ApiService.getCurrentWeather(
            useProd: prodBool.state, city: cityName),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text("Error: ${snapshot.error}");
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FavoriteButton(cityName),
                  Text(
                    cityName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  Container(width: 50),
                ],
              ),
              Text(
                degPro.getDegree(
                    currentWeatherViewModel.model.currentTemperature),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(width: 50),
                CachedNetworkImage(
                  imageUrl: ForcastPerDayViewModel.getIcon(
                      currentWeatherViewModel.model.weatherIcon),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 100,
                  width: 100,
                ),
                IconButton(
                  tooltip: 'See more data on accuweather website',
                  icon: Icon(Icons.open_in_browser_outlined),
                  onPressed: () async {
                    final url = currentWeatherViewModel.model.linkToWatch;
                    if (await canLaunch(url))
                      await launch(url);
                    else
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'something went wrong, can\'t launch the site.'),
                        ),
                      );
                  },
                )
              ]),
            ],
          );
        });
  }
}
