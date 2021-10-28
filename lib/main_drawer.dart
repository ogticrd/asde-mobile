import 'package:asde_app/pages/contact_us.dart';
import 'package:asde_app/pages/home_page.dart';
import 'package:asde_app/pages/select_report.dart';
import 'package:asde_app/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pages/my_reports_page.dart';
import 'pages/payment_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      size: 100,
                    ),
                    Text(
                      "Francifelly Bencosme",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color(0xFFDADADA),
            ),
            title: Text("Inicio"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/new_feeds.png",
            ),
            title: Text("Servicios"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidBell,
              color: Color(0xFFDADADA),
            ),
            title: Text("Pagos de Facturas"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentPage()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/new_feeds.png",
            ),
            title: Text("Crear Reclamación"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectReport()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidBell,
              color: Color(0xFFDADADA),
            ),
            title: Text("Mis Reclamaciones"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyReportsPage()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/messages.png",
            ),
            title: Text("Servicio al cliente"),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/servicio_cliente.png"),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Asistencia Directa de Servicio al Cliente",
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
                        "Si desea communicarse con nuestro servicio de ayuda puedes comentarnos directamente vía WhatsApp. Estamos aquí para ayudarte",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
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
                                await launch("https://wa.me/$number");
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
                    ],
                  ),
                ),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomePage()),
              // );
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidBell,
              color: Color(0xFFDADADA),
            ),
            title: Text("Ruta y frecuencia"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/messages.png",
            ),
            title: Text("Contactanos"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUs()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xFFDADADA),
            ),
            title: Text("Ajustes"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
