import 'dart:async';
import 'dart:convert';
import 'package:asde_app/models/news.dart';
import 'package:asde_app/models/tourist_sites.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<List<News>> fetchAllNews() async {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  List<News> newsList = [];
  final response = await http.get(
    Uri.parse(
        'https://ayuntamientosde.gob.do/wp-json/wp/v2/posts?categories=5'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final data = await jsonDecode(response.body);

    for (var i = 0; i < data.length; i++) {
      //String dateformatted =
      //  formatter.format(DateTime.parse(data[i]["date"].substring(1, 11)));
      newsList.add(News(
          id: data[i]["id"],
          title: data[i]["title"]["rendered"],
          image: await getNewsImage(
              data[i]["_links"]["wp:featuredmedia"][0]["href"]),
          date: formatter.format(DateTime.parse(data[i]["date"])),
          text: data[i]["content"]["rendered"]));
    }
    return newsList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load news');
  }
}

getNewsImage(href) async {
  final response = await http.get(Uri.parse(href));

  if (response.statusCode == 200) {
    return jsonDecode(response.body)["guid"]["rendered"];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load news image');
  }
}

Future<List<TouristSite>> fetchAllTouristSites() async {
  List<TouristSite> sitesList = [];
  String response = await rootBundle.loadString('assets/tourist_sites.json');
  final data = await jsonDecode(response);
  for (var i = 0; i < data.length; i++) {
    sitesList.add(
      TouristSite(
          id: data[i]["id"],
          title: data[i]["title"],
          image: data[i]["image"],
          shortText: data[i]["shortText"],
          longText: data[i]["longText"],
          availability: data[i]["availability"],
          schedule: data[i]["schedule"],
          location: data[i]["location"],
          contact: data[i]["contact"]),
    );
  }
  return sitesList;
}
