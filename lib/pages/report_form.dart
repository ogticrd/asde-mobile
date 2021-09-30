import 'package:flutter/material.dart';

import '../main_drawer.dart';

class ReportForm extends StatelessWidget {
  const ReportForm({Key? key}) : super(key: key);

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
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => RegisterId()),
                          // );
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
                                  )),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => RegisterUser(),
                                //   ),
                                // );
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
