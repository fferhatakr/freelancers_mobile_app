// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../customer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerAdapter extends TypeAdapter<Customer> {
  @override
  final int typeId = 6;

  @override
  Customer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Customer(
      adSoyad: fields[1] as String,
      email: fields[2] as String,
      telefon: fields[3] as String,
      firma: fields[4] as String?,
      not: fields[5] as String?,
      adres: fields[6] as String?,
      source: fields[7] as String?,
      comment: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Customer obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.adSoyad)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.telefon)
      ..writeByte(4)
      ..write(obj.firma)
      ..writeByte(5)
      ..write(obj.not)
      ..writeByte(6)
      ..write(obj.adres)
      ..writeByte(7)
      ..write(obj.source)
      ..writeByte(8)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
