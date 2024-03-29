import 'dart:convert';
import 'package:asde/models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_drawer.dart';

class MyReportsPage extends StatelessWidget {
  const MyReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Image.asset("assets/drawer_button.png"),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  await launch("https://voztrinitaria.com/");
                },
                child: Image.asset("assets/voz_trinitaria.png"),
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MIS RECLAMACIONES",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Historial de reclamaciones",
              ),
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: Hive.box<Report>('reports').listenable(),
                builder: (context, Box<Report> box, widget) {
                  if (box.length == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("No hay reclamaciones hechas"),
                    );
                  } else {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: box.getAt(index)!.image == ""
                                            ? 0
                                            : 100,
                                        width: box.getAt(index)!.image == ""
                                            ? 0
                                            : 100,
                                        decoration: new BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: new DecorationImage(
                                            image: new MemoryImage(
                                              base64Decode(
                                                  box.getAt(index)!.image),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/location_icon.png",
                                                scale: 0.8,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                box.getAt(index)!.location,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(box.getAt(index)!.description),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    thickness: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Image.asset(
                                          GetReportTypeImage(
                                              box.getAt(index)!.type),
                                        ),
                                        SizedBox(width: 15),
                                        Text(box.getAt(index)!.type),
                                      ]),
                                      Text(box.getAt(index)!.date),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String GetReportTypeImage(String type) {
    String result;
    switch (type) {
      case "Basura":
        result = "assets/trash_icon.png";
        break;
      case "Asfalto":
        result = "assets/street_icon.png";
        break;
      case "Aseo Urbano":
        result = "assets/urban_cleaning_icon.png";
        break;
      case "Drenaje":
        result = "assets/drainage_icon.png";
        break;
      case "Fumigación":
        result = "assets/fumigation_icon.png";
        break;
      case "Tránsito":
        result = "assets/transit_icon.png";
        break;
      case "Iluminación":
        result = "assets/ilumination_icon.png";
        break;
      case "Espacios Públicos":
        result = "assets/park_icon.png";
        break;
      case "Protección Animal":
        result = "assets/animal_protection_icon.png";
        break;
      case "Poda de árboles":
        result = "assets/poda_icon.png";
        break;
      default:
        result = "assets/trash_white_icon.png";
    }
    return result;
  }
}
