import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dao/task_dao.dart';

class DBHelper {
  late Box _db;

  DBHelper();

  Future instance() async {
    Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskDaoAdapter());
    }

    _db = await Hive.openBox('database');
  }

  List<TaskDao> getTasks(DateTime date) {
    return _db.values.whereType<TaskDao>().toList();
  }
}
