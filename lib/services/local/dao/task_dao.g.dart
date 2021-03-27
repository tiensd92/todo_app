// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskDaoAdapter extends TypeAdapter<TaskDao> {
  @override
  final int typeId = 1;

  @override
  TaskDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskDao(
      title: fields[0] as String,
      description: fields[1] as String,
      category: fields[4] as int,
      createAt: fields[2] as DateTime,
    )
      ..updateAt = fields[3] as DateTime?
      ..status = fields[5] as int;
  }

  @override
  void write(BinaryWriter writer, TaskDao obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.createAt)
      ..writeByte(3)
      ..write(obj.updateAt)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
