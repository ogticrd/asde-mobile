import 'package:asde/pages/report_form.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_drawer.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _value = "One";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                "PAGO DE FACTURAS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Seleccione el pago a realizar",
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                        value: _value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isDense: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          border: OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _value = newValue!;
                          });
                        },
                        items: ["One", "Two", "Three", "Four"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Descripción del pago",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidicunt ut labore et dolore magna aligua. Ut enim ad minim veniam",
                        style: TextStyle(
                          fontSize: 13.5,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Requisitos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidicunt ut labore et dolore magna aligua. Ut enim ad minim veniam",
                        style: TextStyle(
                          fontSize: 13.5,
                        ),
                      ),
                    ],
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
                        String text = "Pago a realizar";
                        await launch("https://wa.me/$number?text=$text");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
