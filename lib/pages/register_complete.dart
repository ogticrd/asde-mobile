import 'package:asde/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegisterComplete extends StatelessWidget {
  const RegisterComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("Registro Completo"),
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
              child: Text('INICIAR SESIÓN'),
            ),
          ],
        ),
      ),
    );
  }
}
