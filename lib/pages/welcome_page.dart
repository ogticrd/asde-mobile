import 'package:asde_app/pages/register_id.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home_bg.png"),
            fit: BoxFit.cover,
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Text("AYUNTAMIENTO DE"),
            Text("SANTO DOMINGO ESTE"),
            Container(
              child: Column(
                children: [
                  Text("UNA CIUDAD DE TODOS"),
                  Text("Introduce tus datos para iniciar sesión"),
                  Text("Correo Electrónico"),
                  TextFormField(),
                  Text("Contraseña"),
                  TextFormField(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterId()),
                      );
                    },
                    child: Text(
                      "¿Olvidaste tu contraseña?",
                    ),
                    style: TextButton.styleFrom(
                      primary: Color(0xFF3B693C),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Color(0xFF009245),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            minimumSize: Size(double.infinity, 20),
                          ),
                          onPressed: () {},
                          child: Text('INICIAR SESION'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("¿No tienes una cuenta?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterId()),
                          );
                        },
                        child: Text(
                          "Registrate ahora",
                        ),
                        style: TextButton.styleFrom(
                          primary: Color(0xFF3B693C),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/home_bg.png',
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Ayuntamiento de Santo Domingo Este",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "Una Ciudad Justa y Creativa",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Color(0xFF009245),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.white,
                            minimumSize: Size(double.infinity, 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text('INICIAR SESION'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Color(0xFF009245),
                      padding: const EdgeInsets.all(16.0),
                      side: BorderSide(color: Color(0xFF009245), width: 3),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterId()),
                      );
                    },
                    child: Text('REGISTRO'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/