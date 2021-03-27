import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'di/locator.dart';
import 'generated/l10n.dart';
import 'pages/home/home_page.dart';
import 'resources/app_color.dart';
import 'services/local/db_helper.dart';

void main() async => [
      WidgetsFlutterBinding.ensureInitialized(),
      setupLocator(),
      await locator<DBHelper>().instance(),
      runApp(MyApp()),
    ];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.white,
          backgroundColor: AppColor.white,
          accentColor: AppColor.white,
          primaryColor: AppColor.white),
      home: HomePage(),
    );
  }
}
