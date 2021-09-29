import 'package:flutter/material.dart';

import 'login_page.dart';

class PasswordEmailSent extends StatelessWidget {
  const PasswordEmailSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("Recibirás un correo con los pasos a seguir para poder reiniciar la contraseña"),
            OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Color(0xFF009245),
                      padding: const EdgeInsets.all(16.0),
                      side: BorderSide(color: Color(0xFF009245), width: 3),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('ACEPTAR'),
                  ),
          ],
        ),
      ),
    );
  }
}
