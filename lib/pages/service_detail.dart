import 'package:asde/models/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_drawer.dart';

class ServiceDetailPage extends StatelessWidget {
  const ServiceDetailPage({Key? key, required this.service}) : super(key: key);
  final Service service;

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SERVICIOS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Para pagar, pulse el botón de Whatsapp",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/" + service.image,
                        scale: 1.2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        service.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(service.description),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "A quién va dirigido",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(service.public),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Oferente de servicio",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(service.deliveryChannel),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/forwaded-call.png",
                          ),
                          SizedBox(width: 15),
                          Expanded(child: Text(service.tel)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      for (var email in service.email)
                        displayEmails(email: email),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Requerimientos o requisitos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (var requirement in service.requirements)
                        bulletListElement(requirement),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Procedimientos aseguir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      for (var procedure in service.procedures)
                        bulletListElement(procedure),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Horario de prestación",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/calendar.png"),
                          SizedBox(width: 15),
                          Expanded(child: Text(service.availableDays)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/clock.png"),
                          SizedBox(width: 15),
                          Text(service.availableTime),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Costo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(service.cost),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tiempo de realización",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(service.expectedTime),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Canal de Prestación",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(service.deliveryChannel),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "INFORMACIÓN ADICIONAL",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF1CAF82),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      for (var information in service.additionalInformation)
                        showInformation(information),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Color(0xFF62D266),
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
                        String number = "18097887676";
                        String text = "Pago a realizar";
                        await launch("https://wa.me/$number?text=$text");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/whatsapp.png"),
                          SizedBox(width: 10),
                          Text(
                            'Contactar vía WhatsApp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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

  showInformation(AdditionalInformation information) {
    return Column(
      children: [
        Text(
          information.text,
          style: TextStyle(
            color: information.color != ""
                ? Color(int.parse(information.color, radix: 16))
                : Colors.black,
            fontWeight:
                information.isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

Widget displayEmails({String email = ""}) {
  return Row(
    children: [
      Icon(
        Icons.mail_outline,
        color: Color(0xFF1BBC9B),
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(child: Text(email)),
    ],
  );
}

Widget bulletListElement(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("•"),
      SizedBox(width: 10),
      Expanded(child: Text(text)),
    ],
  );
}
