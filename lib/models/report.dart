import 'package:hive/hive.dart';

part "report.g.dart";

@HiveType(typeId: 0)
class Report extends HiveObject {
  @HiveField(0)
  String type;

  @HiveField(1)
  String description;

  @HiveField(2)
  String sector;

  @HiveField(3)
  String barrio;

  @HiveField(4)
  String location;

  @HiveField(5)
  String image;

  @HiveField(6)
  String date;

  Report(
    this.type,
    this.description,
    this.sector,
    this.barrio,
    this.location,
    this.image,
    this.date,
  );
}
