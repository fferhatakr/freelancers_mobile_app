// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../project.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectAdapter extends TypeAdapter<Project> {
  @override
  final int typeId = 3;

  @override
  Project read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Project(
      projectName: fields[1] as String,
      selectedCustomer: fields[2] as String?,
      aciklama: fields[3] as String?,
      startDate: fields[4] as String?,
      endDate: fields[5] as String?,
      projectAmount: fields[6] as double,
      status: fields[8] as ProjectStatus?,
      oncelik: fields[9] as String?,
      nots: fields[10] as String?,
      dateTime: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Project obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.projectName)
      ..writeByte(2)
      ..write(obj.selectedCustomer)
      ..writeByte(3)
      ..write(obj.aciklama)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.projectAmount)
      ..writeByte(7)
      ..write(obj.dateTime)
      ..writeByte(8)
      ..write(obj.status)
      ..writeByte(9)
      ..write(obj.oncelik)
      ..writeByte(10)
      ..write(obj.nots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProjectStatusAdapter extends TypeAdapter<ProjectStatus> {
  @override
  final int typeId = 4;

  @override
  ProjectStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ProjectStatus.tamamlandi;
      case 1:
        return ProjectStatus.bekliyor;
      case 2:
        return ProjectStatus.devamEdiyor;
      default:
        return ProjectStatus.tamamlandi;
    }
  }

  @override
  void write(BinaryWriter writer, ProjectStatus obj) {
    switch (obj) {
      case ProjectStatus.tamamlandi:
        writer.writeByte(0);
        break;
      case ProjectStatus.bekliyor:
        writer.writeByte(1);
        break;
      case ProjectStatus.devamEdiyor:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
