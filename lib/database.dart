import 'package:asde_app/models/route.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "routes.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE routes(id INTEGER PRIMARY KEY, circumscription INTEGER, sector TEXT, subSector TEXT, isAvailableMonday BOOLEAN, isAvailableTuesday BOOLEAN, isAvailableWednesday BOOLEAN, isAvailableThursday BOOLEAN, isAvailableFriday BOOLEAN, isAvailableSaturday BOOLEAN, isAvailableSunday BOOLEAN, startTime TEXT, endTime TEXT)",
        );
        loadingData(db);
      },
    );
  }

  Future<List<int>> getCircumscriptions() async {
    Database db = await instance.database;
    var circumscriptions = await db.query("routes",
        columns: ["circumscription"], groupBy: "circumscription");
    List<int> circumscriptionsList = circumscriptions.isNotEmpty
        ? circumscriptions.map<int>((x) => x["circumscription"] as int).toList()
        : [];

    return circumscriptionsList;
  }

  Future<List<String>> getSectorsByCircumscription(int id) async {
    Database db = await instance.database;
    var circumscriptions = await db.query("routes",
        columns: ["sector"],
        groupBy: "sector",
        where: "circumscription = " + id.toString());
    List<String> circumscriptionsList = circumscriptions.isNotEmpty
        ? circumscriptions.map((x) => x["sector"] as String).toList()
        : [];

    return circumscriptionsList;
  }

  Future<List<Ruta>> getRoutesByCircumscription(int id) async {
    Database db = await instance.database;
    var circumscriptions =
        await db.query("routes", where: "circumscription = $id");
    List<Ruta> circumscriptionsList = circumscriptions.isNotEmpty
        ? circumscriptions.map((x) => Ruta.fromMap(x)).toList()
        : [];

    return circumscriptionsList;
  }

  Future<List<Ruta>> getRoutesBySector(String sector) async {
    Database db = await instance.database;
    var circumscriptions =
        await db.query("routes", where: "sector = '$sector'");
    List<Ruta> circumscriptionsList = circumscriptions.isNotEmpty
        ? circumscriptions.map((x) => Ruta.fromMap(x)).toList()
        : [];

    return circumscriptionsList;
  }

  void loadingData(db) async {
    int counter = 0;
    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Ensanche Ozama",
      'subSector': "El dique",
      'isAvailableMonday': 0,
      'isAvailableTuesday': 1,
      'isAvailableWednesday': 0,
      'isAvailableThursday': 1,
      'isAvailableFriday': 0,
      'isAvailableSaturday': 1,
      'isAvailableSunday': 0,
      'startTime': "7:30AM",
      'endTime': "4:30AM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Alma Rosa I",
      'subSector': "El Oyó",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "7:30AM",
      'endTime': "4:30AM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Alma Rosa I",
      'subSector': "Los Tapias",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "7:30AM",
      'endTime': "4:30AM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Las Palmas De Alma Rosa",
      'subSector': "",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "7:25AM",
      'endTime': "9:30AM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Mi Hogar",
      'subSector': "",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "9:00AM",
      'endTime': "11:00AM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Urb. Mendoza 1",
      'subSector': "",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "7:25AM",
      'endTime': "9:30AM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Urb. Mendoza 2",
      'subSector': "",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "12:00PM",
      'endTime': "2:00PM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Hamarap",
      'subSector': "",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "2:00PM",
      'endTime': "4:30PM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 1,
      'sector': "Carolina",
      'subSector': "",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "7:25AM",
      'endTime': "9:30AM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 2,
      'sector': "Pidoca",
      'subSector': "",
      'isAvailableMonday': 1,
      'isAvailableTuesday': 0,
      'isAvailableWednesday': 1,
      'isAvailableThursday': 0,
      'isAvailableFriday': 1,
      'isAvailableSaturday': 0,
      'isAvailableSunday': 0,
      'startTime': "9:00AM",
      'endTime': "1:00PM",
    });

    db.insert("routes", {
      'id': ++counter,
      'circumscription': 2,
      'sector': "Res. Don Oscar",
      'subSector': "",
      'isAvailableMonday': 0,
      'isAvailableTuesday': 1,
      'isAvailableWednesday': 0,
      'isAvailableThursday': 1,
      'isAvailableFriday': 0,
      'isAvailableSaturday': 1,
      'isAvailableSunday': 0,
      'startTime': "4:00PM",
      'endTime': "10:00PM",
    });
  }
}
