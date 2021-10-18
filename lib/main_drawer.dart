import 'package:asde_app/pages/contact_us.dart';
import 'package:asde_app/pages/home_page.dart';
import 'package:asde_app/pages/select_report.dart';
import 'package:asde_app/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/messages.png",
            ),
            title: Text("Servicio al cliente"),
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
