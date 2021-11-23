import 'package:asde_app/models/news.dart';
import 'package:asde_app/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main_drawer.dart';
import 'news_detail.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<News>> allNews;
  late List<News> _localNews;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();

  @override
  void initState() {
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
              "NOVEDADES",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Estas son todas las noticias de nuestra ciudad",
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
                  allNews = Future<List<News>>.value(_localNews
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
            FutureBuilder<List<News>>(
              future: allNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.45,
                    children: List.generate(snapshot.data!.length, (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                news: snapshot.data![index],
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
                                      image: new NetworkImage(
                                        snapshot.data![index].image,
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
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data![index].date,
                                  style: TextStyle(
                                    color: Color(0xFF979797),
                                    fontSize: 11,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Leer más >",
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
                    }),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
