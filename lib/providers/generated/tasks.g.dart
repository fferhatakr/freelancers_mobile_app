// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tasks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      id: fields[0] as String?,
      taskName: fields[1] as String,
      comment: fields[2] as String,
      bagliMusteri: fields[3] as String?,
      baglantiliProje: fields[4] as String?,
      startDate: fields[5] as DateTime?,
      endDate: fields[6] as DateTime?,
      saat: fields[7] as String?,
      note: fields[8] as String?,
      levels: fields[9] as String?,
      taskStatus: fields[10] as TaskStatus?,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.taskName)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.bagliMusteri)
      ..writeByte(4)
      ..write(obj.baglantiliProje)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.saat)
      ..writeByte(8)
      ..write(obj.note)
      ..writeByte(9)
      ..write(obj.levels)
      ..writeByte(10)
      ..write(obj.taskStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskStatusAdapter extends TypeAdapter<TaskStatus> {
  @override
  final int typeId = 1;

  @override
  TaskStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskStatus.tamamlandi;
      case 1:
        return TaskStatus.bekliyor;
      case 2:
        return TaskStatus.devamEdiyor;
      default:
        return TaskStatus.tamamlandi;
    }
  }

  @override
  void write(BinaryWriter writer, TaskStatus obj) {
    switch (obj) {
      case TaskStatus.tamamlandi:
        writer.writeByte(0);
        break;
      case TaskStatus.bekliyor:
        writer.writeByte(1);
        break;
      case TaskStatus.devamEdiyor:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
