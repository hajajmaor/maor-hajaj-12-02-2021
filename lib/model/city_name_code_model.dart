import 'package:hive/hive.dart';

part 'city_name_code_model.g.dart';

@HiveType(typeId: 3)
class CityNameCodeModel extends HiveObject {
  @HiveField(0)
  final int cityCode;
  @HiveField(1)
  final String cityName;

  CityNameCodeModel({this.cityCode, this.cityName});
  CityNameCodeModel.copy(CityNameCodeModel other)
      : cityCode = other.cityCode,
        cityName = other.cityName;
}
