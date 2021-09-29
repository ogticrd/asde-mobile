import 'package:asde_app/pages/forgot_password.dart';
import 'package:asde_app/pages/register_id.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/home_bg.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /*Expanded(
                      child: SizedBox(),
                    ),*/
                    SizedBox(
                      height: 100,
                    ),
                    Image.asset("assets/white_logo.png"),
                    Text(
                      "AYUNTAMIENTO DE",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "SANTO DOMINGO ESTE",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 2.0,
                                width: 44.0,
                                color: Color(0xFF1BBC9B),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "UNA CIUDAD DE TODOS",
                              style: GoogleFonts.raleway(
                                  color: Colors.orange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Introduce tus datos para iniciar sesión",
                              style: GoogleFonts.raleway(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Correo Electrónico",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Color(0xFFC4C4C4),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Color(0xFFD8D6DE),
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Contraseña"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFFC4C4C4),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Color(0xFFD8D6DE),
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPassword()),
                                  );
                                },
                                child: Text(
                                  "¿Olvidaste tu contraseña?",
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.orange,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
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
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                      );
                                    },
                                    child: Text('Iniciar sesión'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
                                    primary: Colors.orange,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Image.asset("assets/fb.png"),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset("assets/twitter.png"),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset("assets/g+.png"),
                                    onPressed: () {},
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        ],
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