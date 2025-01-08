// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DashboardHiveModelAdapter extends TypeAdapter<DashboardHiveModel> {
  @override
  final int typeId = 1;

  @override
  DashboardHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DashboardHiveModel(
      totalProjects: fields[0] as int,
      totalTasks: fields[1] as int,
      recentProjectsMessage: fields[2] as String,
      recentProjects: (fields[3] as List).cast<dynamic>(),
      recentProjectsCount: fields[4] as int,
      recentTasksCount: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DashboardHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.totalProjects)
      ..writeByte(1)
      ..write(obj.totalTasks)
      ..writeByte(2)
      ..write(obj.recentProjectsMessage)
      ..writeByte(3)
      ..write(obj.recentProjects)
      ..writeByte(4)
      ..write(obj.recentProjectsCount)
      ..writeByte(5)
      ..write(obj.recentTasksCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashboardHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
