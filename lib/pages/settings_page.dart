import 'package:asde/pages/private_policy.dart';
import 'package:asde/pages/terms_conditions_page.dart';
import 'package:asde/pages/version_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "AJUSTES",
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
                "Aquí está la configuración",
                //style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 16.0),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.person,
            //         size: 70,
            //       ),
            //       Text("Francifelly Bencosme"),
            //     ],
            //   ),
            // ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  // ListTile(
                  //   title: Text(
                  //     "Cuenta",
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(builder: (context) => HomePage()),
                  //     // );
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text("Información personal"),
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(builder: (context) => HomePage()),
                  //     // );
                  //   },
                  // ),
                  // ListTile(
                  //   title: Text("Notificaciones"),
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(builder: (context) => HomePage()),
                  //     // );
                  //   },
                  // ),
                  ListTile(
                    title: Text("Soporte técnico"),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                  // ListTile(
                  //   title: Text("Cerrar sesión"),
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(builder: (context) => HomePage()),
                  //     // );
                  //   },
                  // ),
                ],
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
