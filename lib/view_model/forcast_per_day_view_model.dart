import 'package:intl/intl.dart';
import 'package:weather_app/model/forcast_per_day_model.dart';

class ForcastPerDayViewModel {
  ForcastPerDayViewModel(this.model);

  final ForcastPerDayModel model;
  static String getIcon(int iconID) =>
      'https://developer.accuweather.com/sites/default/files/${iconID < 10 ? "0$iconID" : iconID}-s.png';

  String getDayIcon() => getIcon(this.model.dayIcon);
  String getNightIcon() => getIcon(this.model.nightIcon);

  ForcastPerDayViewModel.fromJson(Map<String, dynamic> data)
      : this.model = ForcastPerDayModel.fromJson(data);

  String getDayAsString() {
    final DateFormat formatter = DateFormat('E');
    return formatter.format(this.model.date);
  }

  String getFormattedDate() {
    final DateFormat formatter = DateFormat('dd/MM/y');
    return formatter.format(this.model.date);
  }
}
