import 'package:asde_app/models/tourist_sites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../main_drawer.dart';
import '../singleton.dart';
import 'tourist_site_detail.dart';

class TouristSitesPage extends StatefulWidget {
  const TouristSitesPage({Key? key}) : super(key: key);

  @override
  State<TouristSitesPage> createState() => _TouristSitesPageState();
}

class _TouristSitesPageState extends State<TouristSitesPage> {
  late Future<List<TouristSite>> allTouristSites;
  late List<TouristSite> _localTouristSite;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();

  @override
  void initState() {
    allTouristSites =
        Singleton.allTouristSites.then((value) => _localTouristSite = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  allTouristSites = Future<List<TouristSite>>.value(
                      _localTouristSite
                          .where((element) => element.title
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList());
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<List<TouristSite>>(
              future: allTouristSites,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TouristSiteDetailPage(
                                touristSite: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                        child: Card(
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
                                        "assets/" + snapshot.data![index].image,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data![index].title,
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
                                  snapshot.data![index].shortText,
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
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Error para encontrar los sitios ");
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      )),
    );
  }
}
