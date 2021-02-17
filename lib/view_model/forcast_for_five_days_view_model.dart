import 'package:weather_app/model/forcast_for_five_days_model.dart';
import 'package:weather_app/model/forcast_per_day_model.dart';

class ForcastForFiveDaysViewModel {
  final ForcastForFiveDaysModel model;

  ForcastForFiveDaysViewModel(this.model);

  /// build object from json string,
  /// keys: [date] & [forcast]
  ForcastForFiveDaysViewModel.fromJson(Map jsondata)
      : this.model = ForcastForFiveDaysModel(
          date: jsondata['date'],
          forcast: _jsonToList(jsondata['forcast']),
        );

  static List<ForcastPerDayModel> _jsonToList(List data) {
    final List<ForcastPerDayModel> result = [];
    data.forEach((element) {
      result.add(
        ForcastPerDayModel.fromJson(element),
      );
    });
    return result;
  }
}
