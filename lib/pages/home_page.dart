import 'package:asde_app/models/news.dart';
import 'package:asde_app/models/tourist_sites.dart';
import 'package:asde_app/services/api_services.dart';
import 'package:asde_app/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import '../main_drawer.dart';
import 'news_detail.dart';
import 'news_page.dart';
import 'tourist_site_detail.dart';
import 'tourist_sites.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<TouristSite>> allTouristSites;
  late Future<List<News>> allNews;
  late List<News> _localNews;
  late List<TouristSite> _localTouristSite;
  final searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Singleton.allTouristSites = allTouristSites =
        fetchAllTouristSites().then((value) => _localTouristSite = value);
    allNews = Singleton.allNews.then((List<News> value) {
      _localNews = value;
      return _localNews;
    });
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
          icon: Image.asset("assets/drawer_button.png"),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/logo.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText2,
                        children: <TextSpan>[
                          TextSpan(
                            text: "ASDE: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "UNA CIUDAD JUSTA Y CREATIVA",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                    allNews = Future<List<News>>.value(_localNews
                        .where((element) => element.title
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList());
                    allTouristSites = Future<List<TouristSite>>.value(
                        _localTouristSite
                            .where((element) => element.title
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList());
                  });
                },
              ),
              FutureBuilder<List<News>>(
                future: allNews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Widget> carrouselItems = [];
                    for (var i = 0; i < snapshot.data!.length; i = i + 2) {
                      carrouselItems.add(
                        Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NewsDetailPage(
                                              news: snapshot.data![i],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 150,
                                                decoration: new BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: new DecorationImage(
                                                    image: new NetworkImage(
                                                      snapshot.data![i].image,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                snapshot.data![i].title,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                snapshot.data![i].date,
                                                style: TextStyle(
                                                  color: Color(0xFF979797),
                                                  fontSize: 11,
                                                ),
                                              ),
                                              Expanded(child: Container()),
                                              Text(
                                                "Leer más >",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ((i + 1) < snapshot.data!.length)
                                        ? InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewsDetailPage(
                                                    news: snapshot.data![i + 1],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration:
                                                          new BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image:
                                                            new DecorationImage(
                                                          image:
                                                              new NetworkImage(
                                                            snapshot
                                                                .data![i + 1]
                                                                .image,
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data![i + 1].title,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data![i + 1].date,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF979797),
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(),
                                                    ),
                                                    Text(
                                                      "Leer más >",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.orange,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    if (carrouselItems.length > 0) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Novedades",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NewsPage()),
                                  );
                                },
                                child: Text(
                                  "Ver todo",
                                ),
                                style: TextButton.styleFrom(
                                  primary: Color(0xFF1BBC9B),
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 270.0,
                              enableInfiniteScroll: false,
                              viewportFraction: 0.95,
                            ),
                            items: carrouselItems,
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  );
                },
              ),
              FutureBuilder<List<TouristSite>>(
                  future: allTouristSites,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.length > 0) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Conoce nuestra ciudad",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  "Ver todo",
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TouristSitesPage()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  primary: Color(0xFF1BBC9B),
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CarouselSlider(
                              options: CarouselOptions(
                                height: 330.0,
                                enableInfiniteScroll: false,
                                viewportFraction: 0.95,
                              ),
                              items: snapshot.data!.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0, top: 10.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TouristSiteDetailPage(
                                                  touristSite: i,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    decoration:
                                                        new BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image:
                                                          new DecorationImage(
                                                        image: new AssetImage(
                                                          "assets/" + i.image,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    i.title,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    i.shortText,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Expanded(child: Container()),
                                                  Text(
                                                    "Conoce más detalles >",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.orange,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList()),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
