import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/report.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//   // Get a location using getDatabasesPath
//   var databasesPath = await getDatabasesPath();
//   String path = join(databasesPath, 'routes.db');

// // Delete the database
//   await deleteDatabase(path);

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
      home: HomePage(),
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
