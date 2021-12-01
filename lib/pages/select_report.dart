import 'package:asde/pages/report_form.dart';
import 'package:flutter/material.dart';

import '../main_drawer.dart';

class SelectReport extends StatefulWidget {
  const SelectReport({Key? key}) : super(key: key);

  @override
  State<SelectReport> createState() => _SelectReportState();
}

class _SelectReportState extends State<SelectReport> {
  String _value = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    children: <TableRow>[
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Basura"
                                        ? Color(0xFF1BBC9B)
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: _value == "Basura"
                                        ? Colors.white
                                        : Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _value = "Basura";
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        _value == "Basura"
                                            ? "assets/trash_white_icon.png"
                                            : "assets/trash_icon.png",
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
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: (_value == "Asfalto"
                                          ? Color(0xFF1BBC9B)
                                          : Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      primary: _value == "Asfalto"
                                          ? Colors.white
                                          : Colors.black,
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
                                      Image.asset(
                                        _value == "Asfalto"
                                            ? "assets/street_white_icon.png"
                                            : "assets/street_icon.png",
                                      ),
                                      Text(
                                        "Asfalto",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Aseo Urbano"
                                        ? Color(0xFF1BBC9B)
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: _value == "Aseo Urbano"
                                        ? Colors.white
                                        : Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _value = "Aseo Urbano";
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        _value == "Aseo Urbano"
                                            ? "assets/urban_cleaning_white_icon.png"
                                            : "assets/urban_cleaning_icon.png",
                                      ),
                                      Text(
                                        "Aseo Urbano",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Drenaje"
                                        ? Color(0xFF1BBC9B)
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: _value == "Drenaje"
                                        ? Colors.white
                                        : Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _value = "Drenaje";
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(_value == "Drenaje"
                                          ? "assets/drainage_white_icon.png"
                                          : "assets/drainage_icon.png"),
                                      Text("Drenaje"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Fumigación"
                                        ? Color(0xFF1BBC9B)
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: _value == "Fumigación"
                                        ? Colors.white
                                        : Colors.black,
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
                                      Image.asset(_value == "Fumigación"
                                          ? "assets/fumigation_white_icon.png"
                                          : "assets/fumigation_icon.png"),
                                      Text("Fumigación"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Tránsito"
                                        ? Color(0xFF1BBC9B)
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: _value == "Tránsito"
                                        ? Colors.white
                                        : Colors.black,
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
                                      Image.asset(_value == "Tránsito"
                                          ? "assets/transit_white_icon.png"
                                          : "assets/transit_icon.png"),
                                      Text("Tránsito"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: (_value == "Iluminación"
                                        ? Color(0xFF1BBC9B)
                                        : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: _value == "Iluminación"
                                        ? Colors.white
                                        : Colors.black,
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
                                      Image.asset(
                                        _value == "Iluminación"
                                            ? "assets/ilumination_white_icon.png"
                                            : "assets/ilumination_icon.png",
                                      ),
                                      Text("Iluminación"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        (_value == "Espacios Públicos"
                                            ? Color(0xFF1BBC9B)
                                            : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: _value == "Espacios Públicos"
                                        ? Colors.white
                                        : Colors.black,
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
                                      Image.asset(_value == "Espacios Públicos"
                                          ? "assets/park_white_icon.png"
                                          : "assets/park_icon.png"),
                                      Text(
                                        "Espacios Públicos",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        (_value == "Protección Animal"
                                            ? Color(0xFF1BBC9B)
                                            : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: (_value == "Protección Animal"
                                        ? Colors.white
                                        : Colors.black),
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
                                      Image.asset(_value == "Protección Animal"
                                          ? "assets/animal_protection_white_icon.png"
                                          : "assets/animal_protection_icon.png"),
                                      Text(
                                        "Protección Animal",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        (_value == "Poda de árboles"
                                            ? Color(0xFF1BBC9B)
                                            : Colors.white),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    primary: _value == "Poda de árboles"
                                        ? Colors.white
                                        : Colors.black,
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _value = "Poda de árboles";
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(_value == "Poda de árboles"
                                          ? "assets/poda_white_icon.png"
                                          : "assets/poda_icon.png"),
                                      Text(
                                        "Poda de árboles",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(child: Container()),
                          TableCell(child: Container()),
                        ],
                      ),
                    ],
                  ),
                ),
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
                            builder: (context) => ReportForm(
                              reportType: _value,
                            ),
                          ),
                        );
                      },
                      child: Text('Continuar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
