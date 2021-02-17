import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/view_model/forcast_per_day_view_model.dart';

class ForcastPerDayView extends ConsumerWidget {
  final ForcastPerDayViewModel viewmodel;

  ForcastPerDayView(this.viewmodel);

  Text buildText(String text) => Text(
        text,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      );

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final degPro = watch(degProvider);

    return Container(
      // height: 200,
      width: 130,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(4),
      color: Colors.lightBlueAccent[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildText(
            '${viewmodel.getDayAsString()}\n${viewmodel.getFormattedDate()}',
          ),
          CachedNetworkImage(
            imageUrl: viewmodel.getDayIcon(),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          buildText(
            '${viewmodel.model.dayPhrase}\n${degPro.getDegree(viewmodel.model.maximumTemperature)}',
          ),
          buildText(
            '${degPro.getDegree(viewmodel.model.minimumTemperature)}\n${viewmodel.model.nightPhrase}',
          ),
          CachedNetworkImage(
            imageUrl: viewmodel.getNightIcon(),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
