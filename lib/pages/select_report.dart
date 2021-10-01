import 'package:asde_app/pages/report_form.dart';
import 'package:flutter/material.dart';

import '../main_drawer.dart';

class SelectReport extends StatefulWidget {
  const SelectReport({Key? key}) : super(key: key);

  @override
  State<SelectReport> createState() => _SelectReportState();
}

class _SelectReportState extends State<SelectReport> {
  String _value = "";

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
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "RECLAMAR",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Seleccione un servicio a denunciar",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Basura"
                                        ? Colors.lightBlue[50]
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    )),
                                onPressed: () {
                                  setState(() {
                                    _value = "Basura";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/trash_icon.png",
                                      scale: 0.8,
                                    ),
                                    Text(
                                      "Basura",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Asfalto"
                                        ? Colors.lightBlue[50]
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                    )),
                                onPressed: () {
                                  setState(() {
                                    _value = "Asfalto";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/street_icon.png"),
                                    Text(
                                      "Asfalto",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Aseo Urbano"
                                        ? Colors.lightBlue[50]
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    )),
                                onPressed: () {
                                  setState(() {
                                    _value = "Aseo Urbano";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/urban_cleaning_icon.png"),
                                    Text(
                                      "Aseo Urbano",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Drenaje"
                                        ? Colors.lightBlue[50]
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    )),
                                onPressed: () {
                                  setState(() {
                                    _value = "Drenaje";
                                  });
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/drainage_icon.png"),
                                      Text("Drenaje"),
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: (_value == "Fumigación"
                                      ? Colors.lightBlue[50]
                                      : Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _value = "Fumigación";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/fumigation_icon.png"),
                                    Text("Fumigación"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: (_value == "Tránsito"
                                      ? Colors.lightBlue[50]
                                      : Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _value = "Tránsito";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/transit_icon.png"),
                                    Text("Tránsito"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: (_value == "Iluminación"
                                      ? Colors.lightBlue[50]
                                      : Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _value = "Iluminación";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/ilumination_icon.png"),
                                    Text("Iluminación"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      (_value == "Espacios Públicos"
                                          ? Colors.lightBlue[50]
                                          : Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _value = "Espacios Públicos";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/park_icon.png"),
                                    Text("Espacios Públicos"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      (_value == "Protección Animal"
                                          ? Colors.lightBlue[50]
                                          : Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: Colors.black,
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _value = "Protección Animal";
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/animal_protection_icon.png"),
                                    Text("Protección Animal"),
                                  ],
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
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Colors.orange,
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportForm(),
                            ),
                          );
                        },
                        child: Text('Continuar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
