import 'package:asde_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/report.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Report>(ReportAdapter());
  await Hive.openBox<Report>("reports");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        fontFamily: "Gotham",
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 15,
            color: Colors.black,
            letterSpacing: 0,
          ),
          subtitle1: TextStyle(),
          subtitle2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
