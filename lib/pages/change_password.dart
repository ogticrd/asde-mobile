import 'package:asde_app/pages/password_email_sent.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/normal_bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recuperar Contraseña",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xFFFFD328),
                      ),
                      Text(
                        "  Ingresa tu correo electrónico",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Correo Electrónico",
                        labelStyle: TextStyle(color: Color(0xFF9B9B9B)),
                        border: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(child: Container()),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: new BoxDecoration(
                              color: Color(0xFFE8BF20),
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
                                  builder: (context) => PasswordEmailSent()),
                            );
                          },
                          child: Text('SIGUIENTE'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
