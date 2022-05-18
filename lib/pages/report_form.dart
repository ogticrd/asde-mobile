import 'dart:convert';
import 'dart:io';
import 'package:asde/models/report.dart';
import 'package:asde/models/sector.dart';
import 'package:asde/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main_drawer.dart';
import 'my_reports_page.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({Key? key, required this.reportType}) : super(key: key);
  final String reportType;

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final descriptionController = TextEditingController();
  final sectorController = TextEditingController();
  final barrioController = TextEditingController();
  final locationController = TextEditingController();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  File? image;
  late Future<List<Sector>> allSectors;
  Sector? selectedSector;
  late Future<List<String>> neighborhoodList = Future<List<String>>.value([]);
  String? selectedNeighborhood;

  String _id = "";

  String _name = "";

  String _phone = "";

  @override
  void dispose() {
    descriptionController.dispose();
    sectorController.dispose();
    barrioController.dispose();
    locationController.dispose();
    //Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    allSectors = fetchAllSectors();
    super.initState();
    _loadInfo();
  }

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "RECLAMAR",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Complete los detalles de su reclamación",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tipo de reclamación",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF1BBC9B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          primary: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 12.0, 8.0, 12.0),
                              child: Image.asset(
                                GetReportTypeWhiteImage(widget.reportType),
                                scale: 1.3,
                              ),
                            ),
                            Text(
                              widget.reportType,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Información",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: idController,
                        decoration: InputDecoration(
                          hintText: "Cédula",
                          border: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Nombre",
                          border: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: "Teléfono móvil",
                          border: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Descripción",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: "Denuncia o incidencia a reportar",
                          border: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        maxLines: 6,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Dirección",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FutureBuilder<List<Sector>>(
                        future: allSectors,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return DropdownButtonFormField(
                              value: selectedSector,
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              items: snapshot.data!
                                  .map<DropdownMenuItem<Sector>>(
                                      (Sector sector) {
                                return DropdownMenuItem<Sector>(
                                  value: sector,
                                  child: Text(sector.name),
                                );
                              }).toList(),
                              hint: Text("Sector"),
                              onChanged: (Sector? value) {
                                setState(() {
                                  if (value != null) {
                                    neighborhoodList =
                                        fetchNeiborhoodsBySector(value);
                                    selectedSector = value;
                                  }
                                });
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FutureBuilder<List<String>>(
                        future: neighborhoodList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return DropdownButtonFormField(
                              value: selectedNeighborhood,
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              items: snapshot.data!
                                  .map<DropdownMenuItem<String>>(
                                      (String neighborhood) {
                                return DropdownMenuItem<String>(
                                  value: neighborhood,
                                  child: Text(neighborhood),
                                );
                              }).toList(),
                              hint: Text("Barrio"),
                              onChanged: (String? value) {
                                setState(() {
                                  if (value != null) {
                                    selectedNeighborhood = value;
                                  }
                                });
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                          hintText: "Dirección",
                          border: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Pruebas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Color(0xFF1CAF82),
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          side: BorderSide(
                            color: Color(0xFF1CAF82),
                            width: 3,
                          ),
                          minimumSize: Size(double.infinity, 0),
                          textStyle: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        onPressed: () async {
                          try {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (image == null) {
                              return;
                            }
                            final imageTemporary = File(image.path);
                            setState(() {
                              this.image = imageTemporary;
                            });
                          } on PlatformException catch (e) {
                            print('Failed to pick image: $e');
                          }
                        },
                        child: Text('Adjuntar Archivo'),
                      ),
                      if (this.image != null) Text("1 Imagen seleccionada"),
                      SizedBox(
                        height: 15,
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
                                buildShowDialog(context);
                                final prefs =
                                    await SharedPreferences.getInstance();
                                // set value
                                prefs.setString('id', idController.text);
                                prefs.setString('name', nameController.text);
                                prefs.setString('phone', phoneController.text);
                                DateTime now = DateTime.now();
                                DateFormat formatter = DateFormat('yyyy-MM-dd');
                                String date = formatter.format(now);

                                var report = Report(
                                    widget.reportType,
                                    descriptionController.text,
                                    selectedSector!.name,
                                    selectedNeighborhood!,
                                    locationController.text,
                                    (image == null)
                                        ? ""
                                        : base64Encode(
                                            image!.readAsBytesSync()),
                                    date);
                                try {
                                  sendEmail('Reclamo: ${widget.reportType}', descriptionController.text, barrioController.text, sectorController.text, locationController.text, report.image);
                                  // final sendReport =
                                  //     await send(message, smtpServer);
                                  print(
                                      'Message sent: ');

                                  var box =
                                      await Hive.openBox<Report>("reports");
                                  box.add(report);
                                  showSucessDialog();
                                } on MailerException catch (e) {
                                  print('Message not sent. ' + e.message);
                                  for (var p in e.problems) {
                                    print('Problem: ${p.code}: ${p.msg}');
                                  }
                                  showFailedDialog();
                                }
                              },
                              child: Text('Crear Reclamación'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSucessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Stack(
          children: [
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close, color: Colors.orange),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/email_sent.png"),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Reclamación anviada correctamente.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Nuestro equipo técnico estará dando seguimiento a su reclamación",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyReportsPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Aceptar',
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
          ],
        ),
      ),
    );
  }

  void showFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Stack(
          children: [
            Positioned(
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close, color: Colors.orange),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Error",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Ha ocurrido un error, continuar de nuevo más tarde",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
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
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Continuar',
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
          ],
        ),
      ),
    );
  }

  void _loadInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idController.text = prefs.getString('id') ?? "";
      nameController.text = prefs.getString('name') ?? "";
      phoneController.text = prefs.getString('phone') ?? "";
    });
  }
}

buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

String GetReportTypeWhiteImage(String type) {
  String result;
  switch (type) {
    case "Basura":
      result = "assets/trash_white_icon.png";
      break;
    case "Asfalto":
      result = "assets/street_white_icon.png";
      break;
    case "Aseo Urbano":
      result = "assets/urban_cleaning_white_icon.png";
      break;
    case "Drenaje":
      result = "assets/drainage_white_icon.png";
      break;
    case "Fumigación":
      result = "assets/fumigation_white_icon.png";
      break;
    case "Tránsito":
      result = "assets/transit_white_icon.png";
      break;
    case "Iluminación":
      result = "assets/ilumination_white_icon.png";
      break;
    case "Espacios Públicos":
      result = "assets/park_white_icon.png";
      break;
    case "Protección Animal":
      result = "assets/animal_protection_white_icon.png";
      break;
    case "Poda de árboles":
      result = "assets/poda_white_icon.png";
      break;
    default:
      result = "assets/trash_white_icon.png";
  }
  return result;
}
