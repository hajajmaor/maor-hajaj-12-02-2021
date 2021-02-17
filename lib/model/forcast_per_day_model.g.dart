// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcast_per_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForcastPerDayModelAdapter extends TypeAdapter<ForcastPerDayModel> {
  @override
  final int typeId = 1;

  @override
  ForcastPerDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForcastPerDayModel(
      dayPhrase: fields[5] as String,
      nightPhrase: fields[6] as String,
      date: fields[0] as DateTime,
      minimumTemperature: fields[1] as double,
      maximumTemperature: fields[2] as double,
      dayIcon: fields[3] as int,
      nightIcon: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ForcastPerDayModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.minimumTemperature)
      ..writeByte(2)
      ..write(obj.maximumTemperature)
      ..writeByte(3)
      ..write(obj.dayIcon)
      ..writeByte(4)
      ..write(obj.nightIcon)
      ..writeByte(5)
      ..write(obj.dayPhrase)
      ..writeByte(6)
      ..write(obj.nightPhrase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForcastPerDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
