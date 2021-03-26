import 'package:flutter/material.dart';

import 'di/locator.dart';
import 'pages/home/home_page.dart';
import 'resources/app_color.dart';
import 'services/local/db_helper.dart';

void main() async => [
      setupLocator(),
      await locator<DBHelper>().instance(),
      runApp(MyApp()),
    ];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.white,
          backgroundColor: AppColor.white,
          accentColor: AppColor.white,
          primaryColor: AppColor.white),
      home: HomePage(),
    );
  }
}
