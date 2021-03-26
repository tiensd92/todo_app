import 'package:get_it/get_it.dart';
import 'package:todo_app/services/local/db_helper.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DBHelper());
}
