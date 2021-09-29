import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../main_drawer.dart';

class TouristSites extends StatelessWidget {
  const TouristSites({Key? key}) : super(key: key);

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
              "CONOCE SANTO DOMINGO ESTE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Cónoce  que lugares puedes visitar",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
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
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: new DecorationImage(
                          image: new AssetImage(
                            "assets/image 3.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Acuario Nacional",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "El acuario nacional, se encuentra localizado en la Av. España, exactamente en el tramo comprendido entre la Av. 26 de enero y la calle real ubicado en un área de 35,000 m² en el borde costero del litoral de la provincia SDE.",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Conoce más detalles >",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: new DecorationImage(
                          image: new AssetImage(
                            "assets/image 3.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Maravilla Natural: Los 3 ojos",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Los lagos son alimentados por un río subterráneo llamado brujuela, que llega hasta Boca Chica. El agua de los tres lagos subterráneos es muy clara y limpia, se puede ver algunos peces.",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Cónoce más detalles >",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Row(),
            Row()
          ],
        ),
      )),
    );
  }
}
