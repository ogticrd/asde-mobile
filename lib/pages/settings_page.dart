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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TU PERFIL",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Esta es tu información y configuración",
                //style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 70,
                  ),
                  Text("Francifelly Bencosme"),
                ],
              ),
              ListView(
                children: [
                  Text("Cuenta"),
                  ListTile(
                    title: Text("Información personal"),
                  ),
                  ListTile(
                    title: Text("Notificaciones"),
                  ),
                  ListTile(
                    title: Text("Soporte técnico"),
                  ),
                  ListTile(
                    title: Text("Términos y condiciones"),
                  ),
                  ListTile(
                    title: Text("Versión de la aplicación"),
                  ),
                  ListTile(
                    title: Text("Política de privacidad"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
