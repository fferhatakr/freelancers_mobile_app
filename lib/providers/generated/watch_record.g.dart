// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../watch_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchAdapter extends TypeAdapter<Watch> {
  @override
  final int typeId = 7;

  @override
  Watch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Watch(id: fields[0] as String, duration: fields[1] as int);
  }

  @override
  void write(BinaryWriter writer, Watch obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
