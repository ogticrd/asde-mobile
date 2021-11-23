import 'package:asde_app/models/contact.dart';
import 'package:asde_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_drawer.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  late List<Contact> _allContacts;
  late List<Contact> _shownContacts;
  final searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) =>
        ScaffoldMessenger.of(_scaffoldKey.currentContext!)
            .showSnackBar(WhatsAppSnackBar()));

    _allContacts = getContacts();
    _shownContacts = _allContacts;
  }

  SnackBar WhatsAppSnackBar() => SnackBar(
        duration: Duration(seconds: 10),
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Si desea comunicarse con nuestro servicio de ayuda puedes comentarnos directamente via WhatsApp. Estamos aquí para ayudarte.",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
                primary: Color(0xFF62D266),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                String number = "18097887676";
                await launch("https://wa.me/$number");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/whatsapp.png"),
                  SizedBox(width: 10),
                  Text(
                    "Contactar vía WhatsApp",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

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
                "CONTACTANOS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Aquí podrás ver todos nuestros contactos.",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "BUSCAR",
                  suffixIcon: Icon(Icons.search, color: Color(0xFF1BBC9B)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _shownContacts = _allContacts
                        .where((contact) => contact.name
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _shownContacts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          minimumSize: Size(double.infinity, 0),
                          onPrimary: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _shownContacts[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset("assets/phone.png"),
                                SizedBox(width: 15),
                                Text(_shownContacts[index].formattedPhone),
                              ],
                            )
                          ],
                        ),
                      ),
                      onPressed: () => launch(
                          "tel://" + _shownContacts[index].unformattedPhone),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
