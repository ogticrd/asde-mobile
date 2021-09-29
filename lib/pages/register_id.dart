import 'package:asde_app/pages/register_user.dart';
import 'package:flutter/material.dart';

class RegisterId extends StatefulWidget {
  const RegisterId({Key? key}) : super(key: key);

  @override
  _RegisterIdState createState() => _RegisterIdState();
}

class _RegisterIdState extends State<RegisterId> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
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
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/person_outline.png"),
                    SizedBox(height: 20),
                    Row(children: [
                      Text(
                        "REGISTRO DE IDENTIDAD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 10,
                          color: Colors.orange,
                          thickness: 2,
                        ),
                      )
                    ]),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                labelText: "Cédula de identidad",
                                labelStyle: TextStyle(color: Color(0xFF9B9B9B)),
                                border: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color(0xFFDEDEDE)),
                                    borderRadius: BorderRadius.circular(5.0))),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              labelText: "Nombres",
                              labelStyle: TextStyle(color: Color(0xFF9B9B9B)),
                              border: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Color(0xFFDEDEDE)),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              labelText: "Apellidos",
                              labelStyle: TextStyle(color: Color(0xFF9B9B9B)),
                              border: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Color(0xFFDEDEDE)),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 2, 10, 2),
                              labelText: "Número de teléfono",
                              labelStyle: TextStyle(color: Color(0xFF9B9B9B)),
                              border: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Color(0xFFDEDEDE)),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
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
                                  builder: (context) => RegisterUser()),
                            );
                          },
                          child: Text('Siguiente'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
