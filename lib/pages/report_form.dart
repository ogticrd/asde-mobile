import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:image_picker/image_picker.dart';
import '../main_drawer.dart';

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
  File? image;

  @override
  void dispose() {
    descriptionController.dispose();
    sectorController.dispose();
    barrioController.dispose();
    locationController.dispose();
    super.dispose();
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
                "Complete los detalles que la denuncia",
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
                        "Descripción",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Dirección",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: sectorController,
                        decoration: InputDecoration(
                          hintText: "Sector",
                          border: OutlineInputBorder(
                            borderSide: new BorderSide(
                              color: Color(0xFFDEDEDE),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: barrioController,
                        decoration: InputDecoration(
                          hintText: "Barrio",
                          border: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
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
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Pruebas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
                                String username = 'pruebastriny@gmail.com';
                                String password = 'triny1234TRINY';
                                final smtpServer = gmail(username, password);
                                final message = Message()
                                  ..from = Address(username, 'Test ASDE')
                                  ..recipients.add('pruebastriny@gmail.com')
                                  // ..ccRecipients.addAll([
                                  //   'destCc1@example.com',
                                  //   'destCc2@example.com'
                                  // ])
                                  // ..bccRecipients
                                  //     .add(Address('bccAddress@example.com'))
                                  ..subject = 'Reclamo: ${widget.reportType}'
                                  ..html = """
                                      <h1>Información:</h1>
                                      <p>${descriptionController.text}</p>
                                      <p>${barrioController.text}</p>
                                      <p>${sectorController.text}</p>
                                      <p>${locationController.text}</p>
                                      """
                                  ..attachments = [FileAttachment(image!)];
                                try {
                                  final sendReport =
                                      await send(message, smtpServer);
                                  print(
                                      'Message sent: ' + sendReport.toString());
                                } on MailerException catch (e) {
                                  print('Message not sent. ' + e.message);
                                  for (var p in e.problems) {
                                    print('Problem: ${p.code}: ${p.msg}');
                                  }
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
}
