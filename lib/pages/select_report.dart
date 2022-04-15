import 'package:asde/pages/report_form.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                "RECLAMAR",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Seleccione un servicio para su reclamación",
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
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
                                      AutoSizeText(
                                        "Basura",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        _value == "Asfalto"
                                            ? "assets/street_white_icon.png"
                                            : "assets/street_icon.png",
                                      ),
                                      AutoSizeText(
                                        "Asfalto",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        _value == "Aseo Urbano"
                                            ? "assets/urban_cleaning_white_icon.png"
                                            : "assets/urban_cleaning_icon.png",
                                      ),
                                      AutoSizeText(
                                        "Aseo Urbano",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(_value == "Drenaje"
                                          ? "assets/drainage_white_icon.png"
                                          : "assets/drainage_icon.png"),
                                      AutoSizeText(
                                        "Drenaje",
                                        maxLines: 1,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(_value == "Fumigación"
                                          ? "assets/fumigation_white_icon.png"
                                          : "assets/fumigation_icon.png"),
                                      AutoSizeText(
                                        "Fumigación",
                                        maxLines: 1,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(_value == "Tránsito"
                                          ? "assets/transit_white_icon.png"
                                          : "assets/transit_icon.png"),
                                      AutoSizeText(
                                        "Tránsito",
                                        maxLines: 1,
                                      ),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        _value == "Iluminación"
                                            ? "assets/ilumination_white_icon.png"
                                            : "assets/ilumination_icon.png",
                                      ),
                                      AutoSizeText(
                                        "Iluminación",
                                        maxLines: 1,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(_value == "Espacios Públicos"
                                          ? "assets/park_white_icon.png"
                                          : "assets/park_icon.png"),
                                      AutoSizeText(
                                        "Espacios Públicos",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(_value == "Protección Animal"
                                          ? "assets/animal_protection_white_icon.png"
                                          : "assets/animal_protection_icon.png"),
                                      AutoSizeText(
                                        "Protección Animal",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReportForm(
                                          reportType: _value,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(_value == "Poda de árboles"
                                          ? "assets/poda_white_icon.png"
                                          : "assets/poda_icon.png"),
                                      AutoSizeText(
                                        "Poda de árboles",
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
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
            ],
          ),
        ),
      ),
    );
  }
}
