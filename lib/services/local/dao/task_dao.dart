import 'package:hive/hive.dart';

part 'task_dao.g.dart';

@HiveType(typeId: 1)
class TaskDao extends HiveObject {
  @HiveField(0)
  String title = '';

  @HiveField(1)
  String description = '';

  @HiveField(2)
  DateTime createAt = DateTime.now();

  @HiveField(3)
  DateTime? updateAt;

  // 0: work, 1: home, 2: personal
  @HiveField(4)
  int filterType = 0;

  // 0: doing, 1: done
  @HiveField(5)
  int status = 0;
}
