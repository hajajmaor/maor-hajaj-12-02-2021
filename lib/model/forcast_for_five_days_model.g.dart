// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcast_for_five_days_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForcastForFiveDaysModelAdapter
    extends TypeAdapter<ForcastForFiveDaysModel> {
  @override
  final int typeId = 2;

  @override
  ForcastForFiveDaysModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForcastForFiveDaysModel(
      date: fields[0] as DateTime,
      forcast: (fields[1] as List)?.cast<ForcastPerDayModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ForcastForFiveDaysModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.forcast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForcastForFiveDaysModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
