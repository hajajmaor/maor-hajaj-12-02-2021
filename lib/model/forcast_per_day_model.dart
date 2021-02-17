import 'package:hive/hive.dart';
part 'forcast_per_day_model.g.dart';

@HiveType(typeId: 1)
class ForcastPerDayModel extends HiveObject {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final double minimumTemperature;
  @HiveField(2)
  final double maximumTemperature;
  @HiveField(3)
  final int dayIcon;
  @HiveField(4)
  final int nightIcon;
  @HiveField(5)
  final String dayPhrase;
  @HiveField(6)
  final String nightPhrase;
  @HiveField(7)
  ForcastPerDayModel({
    this.dayPhrase,
    this.nightPhrase,
    this.date,
    this.minimumTemperature,
    this.maximumTemperature,
    this.dayIcon,
    this.nightIcon,
  });
  ForcastPerDayModel.fromJson(Map<String, dynamic> data)
      : date = DateTime.parse(data['Date']),
        minimumTemperature =
            double.parse('${data['Temperature']['Minimum']['Value']}'),
        maximumTemperature =
            double.parse('${data['Temperature']['Maximum']['Value']}'),
        dayPhrase = data['Day']['IconPhrase'],
        nightPhrase = data['Night']['IconPhrase'],
        dayIcon = data['Day']['Icon'],
        nightIcon = data['Night']['Icon'];
}
