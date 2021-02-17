import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/creds.dart' show dApiKey;
import 'package:weather_app/model/city_name_code_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/view_model/current_weather_view_model.dart';
import 'package:weather_app/view_model/forcast_for_five_days_view_model.dart';

/// enum for result from the accuweather server
enum RequestResult { Found, NotFound, Error, Unavailable }

final prodURL = 'https://dataservice.accuweather.com';
final demoURL = 'http://<LocalHost>:5000';

class ApiService {
  /// * Get forcast by city.
  /// * Parameters:
  /// * city:String = query to search
  /// * cityCode:int = if city code already known
  /// * refresh:bool = if true, get data from the server, false get data from local cache if available.
  /// * return Map:
  /// * status:[RequestResult]
  /// * data:[ForcastForFiveDaysViewModel], if status is [RequestResult.Found]
  static Future<Map<String, dynamic>> getForcast(
      {String city = '', int cityCode = -1, @required bool useProd}) async {
    // change to lower case
    city = city.toLowerCase();
    Map<String, dynamic> cityKey = {};
    if (cityCode == -1) {
      cityKey = await _getCityKey(cityName: city, useProd: useProd);
      if (cityKey['status'] != RequestResult.Found) {
        return cityKey;
      } else {
        cityCode = cityKey['key'];
      }
    }
    final Map<String, dynamic> result = {};
    result['status'] = RequestResult.Found;
    // final forcastsBox = Hive.box<ForcastForFiveDaysModel>('forcasts');
    final body = 'metric=true&apikey=$dApiKey';
    final response = await http.get(
        '${useProd ? prodURL : demoURL}/forecasts/v1/daily/5day/$cityCode?$body');
    if (response.statusCode == 503) {
      return {'status': RequestResult.Unavailable};
    }
    if (response.statusCode != 200) {
      return {'status': RequestResult.Error};
    }
    final timeNow = DateTime.now();
    final ForcastForFiveDaysViewModel temp =
        ForcastForFiveDaysViewModel.fromJson({
      'date': timeNow,
      'forcast': jsonDecode(response.body)["DailyForecasts"],
    });
    // var modelTemp = temp.model;
    // await forcastsBox.put(city, modelTemp);
    result['data'] = temp;

    return result;
  }

  static Future<Map<String, dynamic>> _getCityKey(
      {String cityName, @required bool useProd}) async {
    final Map<String, dynamic> result = {};
    final Box<CityNameCodeModel> cityKeyHistory =
        Hive.box('historyCityCodeName');
    if (cityKeyHistory.containsKey(cityName)) {
      try {
        result['status'] = RequestResult.Found;
        final temp = cityKeyHistory.get(cityName);
        result['key'] = temp.cityCode;

        return result;
      } catch (e) {}
    }
    final body = 'q=$cityName&apikey=$dApiKey';
    Map<String, dynamic> data;
    final response = await http.get(
      '${useProd ? prodURL : demoURL}/locations/v1/cities/search?$body',
    );

    if (response.statusCode == 503) {
      return {'status': RequestResult.Unavailable};
    }
    if (response.statusCode != 200) {
      return {'status': RequestResult.Error};
    }
    try {
      List l = json.decode(response.body);
      data = l[0];
      // data = jsonDecode(response.body.substring(1, response.body.length - 1));
      result['status'] = RequestResult.Found;
      result['key'] = int.parse(data['Key']);

      await cityKeyHistory.put(
        cityName,
        CityNameCodeModel(
          cityCode: result['key'],
          cityName: cityName,
        ),
      );
    } catch (e) {
      result['status'] = RequestResult.Error;
    }
    return result;
  }

  /// * return Map:
  /// * status:[RequestResult]
  /// * data:[CurrentWeatherViewModel], if status is [RequestResult.Found]
  static Future getCurrentWeather(
      {String city = '', int cityCode = -1, @required bool useProd}) async {
    city = city?.toLowerCase();
    Map<String, dynamic> cityKey = {};
    if (cityCode == -1) {
      cityKey = await _getCityKey(cityName: city, useProd: useProd);
      if (cityKey['status'] != RequestResult.Found) {
        return cityKey;
      } else {
        cityCode = cityKey['key'];
      }
    }
    final body = '$cityCode?apikey=$dApiKey';
    final response = await http
        .get('${useProd ? prodURL : demoURL}/currentconditions/v1/$body');
    //DONT-TODO: check response and return a Map/object
    if (response.statusCode >= 500) {
      return {'status': RequestResult.Unavailable};
    }
    if (response.statusCode != 200) {
      return {'status': RequestResult.Error};
    }
    final Map<String, dynamic> result = {};
    try {
      final data =
          jsonDecode(response.body.substring(1, response.body.length - 1));
      result['status'] = RequestResult.Found;
      try {
        final temp = CurrentWeatherViewModel.fromJson(data[0]);
        result['data'] = temp;
      } catch (e) {
        final temp = CurrentWeatherViewModel.fromJson(data);
        result['data'] = temp;
      }
    } catch (e) {
      return {'status': RequestResult.Error};
    }
    return result;
  }

  static Future<List<String>> getCitiesAutoComplete(
      {query: String, @required bool useProd}) async {
    final body = "apikey=$dApiKey&q=$query";
    final response = await http.get(
        "${useProd ? prodURL : demoURL}/locations/v1/cities/autocomplete?$body");
    final List<String> cities = [];
    if (response.statusCode >= 500) {
      return cities;
    }
    try {
      if (response.body.length > 2) {
        List l = json.decode(response.body);
        for (Map item in l) cities.add(item['LocalizedName']);
      }
    } catch (e) {}
    return cities;
  }
}
