// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_name_code_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityNameCodeModelAdapter extends TypeAdapter<CityNameCodeModel> {
  @override
  final int typeId = 3;

  @override
  CityNameCodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityNameCodeModel(
      cityCode: fields[0] as int,
      cityName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CityNameCodeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.cityCode)
      ..writeByte(1)
      ..write(obj.cityName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityNameCodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
