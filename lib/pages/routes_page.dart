import 'package:asde/models/route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../database.dart';
import '../main_drawer.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({Key? key}) : super(key: key);

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  int? _selectedCircumscriptions;
  String? _selectedSector;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<int> circumscriptions = [];
  Future<List<String>> sectors = Future<List<String>>.value([]);
  Future<List<Ruta>> routesResult = Future<List<Ruta>>.value([]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                "RUTAS Y FRECUENCIAS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Consulte la ruta de recogida de basura de su sector",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Circunscripción",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder<List<int>>(
                          future: DatabaseHelper.instance.getCircumscriptions(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DropdownButtonFormField(
                                value: _selectedCircumscriptions,
                                hint: Text("Circunscripción"),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                isDense: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  border: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color(0xFFDEDEDE)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onChanged: (int? newValue) {
                                  setState(() {
                                    _selectedCircumscriptions = newValue!;
                                    _selectedSector = null;
                                    sectors = DatabaseHelper.instance
                                        .getSectorsByCircumscription(newValue);
                                  });
                                },
                                items: snapshot.data!
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(
                                        "Circunscripción #" + value.toString()),
                                  );
                                }).toList(),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sector o avenida",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FutureBuilder<List<String>>(
                        future: sectors,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return DropdownButtonFormField(
                              value: _selectedSector,
                              hint: Text("Sector"),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              isDense: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                border: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Color(0xFFDEDEDE)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedSector = newValue!;
                                });
                              },
                              items: snapshot.data!
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: new BoxDecoration(
                                  color: Color(0xFF1CAF82),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                minimumSize: Size(double.infinity, 20),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () async {
                                if (_selectedSector != null &&
                                    _selectedSector != "") {
                                  setState(() {
                                    routesResult = DatabaseHelper.instance
                                        .getRoutesBySector(_selectedSector!);
                                  });
                                } else {
                                  if (_selectedCircumscriptions != null) {
                                    setState(() {
                                      routesResult = DatabaseHelper.instance
                                          .getRoutesByCircumscription(
                                              _selectedCircumscriptions!);
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'Ver horario',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<List<Ruta>>(
                future: routesResult,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/location.png"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].subSector ==
                                                      ""
                                                  ? snapshot.data![index].sector
                                                  : snapshot
                                                          .data![index].sector +
                                                      "/" +
                                                      snapshot.data![index]
                                                          .subSector!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "CIRCUNSCRIPCION #" +
                                                  snapshot.data![index]
                                                      .circumscription
                                                      .toString(),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          thickness: 1,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text("DIAS"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                      color: snapshot
                                                              .data![index]
                                                              .isAvailableMonday
                                                          ? Color(0xFF1BBC9B)
                                                          : Color(0xFFDEDEDE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("LUN"),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                      color: snapshot
                                                              .data![index]
                                                              .isAvailableTuesday
                                                          ? Color(0xFF1BBC9B)
                                                          : Color(0xFFDEDEDE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("MAR"),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                      color: snapshot
                                                              .data![index]
                                                              .isAvailableWednesday
                                                          ? Color(0xFF1BBC9B)
                                                          : Color(0xFFDEDEDE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("MIE"),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                      color: snapshot
                                                              .data![index]
                                                              .isAvailableThursday
                                                          ? Color(0xFF1BBC9B)
                                                          : Color(0xFFDEDEDE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("JUE"),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                      color: snapshot
                                                              .data![index]
                                                              .isAvailableFriday
                                                          ? Color(0xFF1BBC9B)
                                                          : Color(0xFFDEDEDE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("VIE"),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                      color: snapshot
                                                              .data![index]
                                                              .isAvailableSaturday
                                                          ? Color(0xFF1BBC9B)
                                                          : Color(0xFFDEDEDE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("SAB"),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 17,
                                                    decoration: BoxDecoration(
                                                      color: snapshot
                                                              .data![index]
                                                              .isAvailableSunday
                                                          ? Color(0xFF1BBC9B)
                                                          : Color(0xFFDEDEDE),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("DOM"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text("HORA ESTIMADA"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              color: Color(0xFFDEDEDE),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  snapshot
                                                      .data![index].startTime,
                                                ),
                                              ),
                                            ),
                                            Text(" - "),
                                            Container(
                                              color: Color(0xFFDEDEDE),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(snapshot
                                                    .data![index].endTime),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
