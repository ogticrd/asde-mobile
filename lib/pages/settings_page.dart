import 'package:asde_app/pages/home_page.dart';
import 'package:asde_app/pages/private_policy.dart';
import 'package:asde_app/pages/terms_conditions_page.dart';
import 'package:asde_app/pages/version_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../main_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "TU PERFIL",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Esta es tu información y configuración",
                //style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 70,
                  ),
                  Text("Francifelly Bencosme"),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    title: Text(
                      "Cuenta",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                  ),
                  ListTile(
                    title: Text("Información personal"),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                  ),
                  ListTile(
                    title: Text("Notificaciones"),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                  ),
                  ListTile(
                    title: Text("Soporte técnico"),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                  ),
                  ListTile(
                    title: Text("Términos y condiciones"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsConditionsPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Versión de la aplicación"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VersionPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Política de privacidad"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivatePolicyPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Cerrar sesión"),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                  ),
                ],
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
