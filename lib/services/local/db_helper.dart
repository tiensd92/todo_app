import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dao/task_dao.dart';
import 'package:todo_app/utils/variable_extension.dart';

class DBHelper {
  late Box _db;

  DBHelper();

  Future instance() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(TaskDaoAdapter());
    }

    _db = await Hive.openBox('database');
  }

  List<TaskDao> getTasks(DateTime date) {
    return _db.values
        .whereType<TaskDao>()
        .where((element) => element.createAt.isSameDay(date))
        .toList();
  }

  Future insert(TaskDao taskDao) async {
    await _db.add(taskDao);
  }
}
