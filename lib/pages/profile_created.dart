import 'package:asde/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCreated extends StatelessWidget {
  const ProfileCreated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/checkmark.png"),
          SizedBox(
            height: 20,
          ),
          Text(
            "TU PERFIL HA SIDO CREADO",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset("assets/pop-up.png"),
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
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Iniciar sesión'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
