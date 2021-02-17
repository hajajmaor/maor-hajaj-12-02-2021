import 'package:hive/hive.dart';
import 'forcast_per_day_model.dart';
part 'forcast_for_five_days_model.g.dart';

@HiveType(typeId: 2)
class ForcastForFiveDaysModel extends HiveObject {
  @HiveField(0)
  final DateTime date;
  @HiveField(1)
  final List<ForcastPerDayModel> forcast;

  ForcastForFiveDaysModel({this.date, this.forcast});
}
