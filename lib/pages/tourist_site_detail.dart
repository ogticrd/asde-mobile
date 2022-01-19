import 'package:asde/models/tourist_sites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main_drawer.dart';

class TouristSiteDetailPage extends StatelessWidget {
  const TouristSiteDetailPage({Key? key, required this.touristSite})
      : super(key: key);
  final TouristSite touristSite;

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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  await launch("https://voztrinitaria.com/");
                },
                child: Image.asset("assets/voz_trinitaria.png"),
              ),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                touristSite.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: new DecorationImage(
                            image: new AssetImage(
                              "assets/" + touristSite.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        touristSite.longText,
                        style: TextStyle(
                          height: 1.4,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Horario de Visita",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/calendar.png"),
                          SizedBox(width: 15),
                          Expanded(child: Text(touristSite.availability)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/clock.png"),
                          SizedBox(width: 15),
                          Expanded(child: Text(touristSite.schedule)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Contacto",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/phone.png"),
                          SizedBox(width: 15),
                          Expanded(child: Text(touristSite.contact)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 1,
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
                      GestureDetector(
                        onTap: () async {
                          await launch(touristSite.googleMapsURL);
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/location.png"),
                            SizedBox(width: 15),
                            Expanded(child: Text(touristSite.location)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
