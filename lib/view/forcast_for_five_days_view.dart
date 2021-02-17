import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/services/api_service.dart';
import 'package:weather_app/view/forcast_per_day_view.dart';
import 'package:weather_app/view_model/forcast_for_five_days_view_model.dart';
import 'package:weather_app/view_model/forcast_per_day_view_model.dart';

class ForcastForFiveDaysView extends ConsumerWidget {
  final String cityName;
  const ForcastForFiveDaysView({Key key, this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final prodBool = watch(prodURLBool);
    // final refresh = watch(refrashDataProvider).state;

    return FutureBuilder(
      future: ApiService.getForcast(useProd: prodBool.state, city: cityName),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
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

        final ForcastForFiveDaysViewModel forcaseFiveModel =
            snapshot.data['data'];
        return ListView.builder(
          itemCount: forcaseFiveModel.model.forcast.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => ForcastPerDayView(
            ForcastPerDayViewModel(
              forcaseFiveModel.model.forcast[index],
            ),
          ),
        );
      },
    );
  }
}
