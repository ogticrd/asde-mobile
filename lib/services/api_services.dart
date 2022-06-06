import 'dart:async';
import 'dart:convert';
import 'package:asde/models/contact.dart';
import 'package:asde/models/news.dart';
import 'package:asde/models/sector.dart';
import 'package:asde/models/service.dart';
import 'package:asde/models/tourist_sites.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<List<News>> fetchAllNews() async {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  List<News> newsList = [];
  final response = await http.get(
    Uri.parse(
        'https://ayuntamientosde.gob.do/wp-json/wp/v2/posts?categories=5&_embed=wp:featuredmedia'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final data = await jsonDecode(response.body);

    for (var i = 0; i < data.length; i++) {
      newsList.add(
        News(
            id: data[i]["id"],
            title: data[i]["title"]["rendered"],
            image: data[i].containsKey("_embedded") && data[i]["_embedded"]["wp:featuredmedia"][0].containsKey("source_url")
                ? data[i]["_embedded"]["wp:featuredmedia"][0]["source_url"]
                : "",
            date: formatter.format(DateTime.parse(data[i]["date"])),
            text: data[i]["content"]["rendered"]),
      );
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
    print('Failed to load news image for: ' + href);
    return "";
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
          contact: data[i]["contact"],
          googleMapsURL: data[i]["google_map"]),
    );
  }
  return sitesList;
}

Future<List<Sector>> fetchAllSectors() async {
  List<Sector> sectorsList = [];
  final response = await http.get(
    Uri.parse(
        'https://api.digital.gob.do/v1/territories/sections?municipalityCode=01&provinceCode=32&regionCode=10'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final data = await jsonDecode(response.body);

    for (var i = 0; i < data["data"].length; i++) {
      sectorsList.add(
        Sector(
            code: data["data"][i]["code"],
            name: data["data"][i]["name"],
            districtCode: data["data"][i]["districtCode"]),
      );
    }
    return sectorsList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load sectors');
  }
}

Future<List<String>> fetchNeiborhoodsBySector(Sector section) async {
  List<String> neighborhoodsList = [];
  final response = await http.get(
    Uri.parse(
        'https://api.digital.gob.do/v1/territories/regions/10/provinces/32/municipalities/01/districts/${section.districtCode}/sections/${section.code}/neighborhoods'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final data = await jsonDecode(response.body);

    for (var i = 0; i < data["data"].length; i++) {
      neighborhoodsList.add(data["data"][i]["name"]);
    }
    return neighborhoodsList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load neighborhoods');
  }
}

Future<List<Service>> fetchAllServices() async {
  List<Service> servicesList = [];
  String response = await rootBundle.loadString('assets/services.json');
  final data = await jsonDecode(response);
  try {
    for (var i = 0; i < data.length; i++) {
      servicesList.add(
        Service(
          id: data[i]["id"],
          title: data[i]["title"],
          image: data[i]["image"],
          description: data[i]["description"],
          public: data[i]["public"],
          offerer: data[i]["offerer"],
          tel: data[i]["tel"],
          email: data[i]["email"].cast<String>(),
          requirements: data[i]["requirements"].cast<String>(),
          procedures: data[i]["procedures"].cast<String>(),
          availableDays: data[i]["available_days"],
          availableTime: data[i]["available_time"],
          cost: data[i]["cost"],
          expectedTime: data[i]["expected_time"],
          deliveryChannel: data[i]["delivery_channel"],
          additionalInformation: converToAdditionalInformationList(
              data[i]["additional_information"]),
        ),
      );
    }
  } catch (e) {
    print("ERROR");
    print(e.toString());
  }
  return servicesList;
}

List<AdditionalInformation> converToAdditionalInformationList(data) {
  List<AdditionalInformation> additionalInformationList = [];
  for (var i = 0; i < data.length; i++) {
    additionalInformationList.add(AdditionalInformation(
      text: data[i]["text"],
      isBold: data[i]["is_bold"],
      color: data[i]["color"],
    ));
  }
  return additionalInformationList;
}

List<Contact> getContacts() {
  List<Contact> contacts = [
    new Contact(
        name: "Ayuntamiento Municipal SDE",
        formattedPhone: "809-788-7056",
        unformattedPhone: "8097887056"),
    new Contact(
        name: "Recepción Alcaldía",
        formattedPhone: "809-788-7676 Ext: 1001",
        unformattedPhone: "8097887676"),
    new Contact(
        name: "Cuerpo de Bomberos",
        formattedPhone: "809-695-1408",
        unformattedPhone: "8096951408"),
    new Contact(name: "9-1-1", formattedPhone: "911", unformattedPhone: "911"),
    new Contact(
        name: "DIGESETT",
        formattedPhone: "809-686-6520",
        unformattedPhone: "8096866520"),
    new Contact(
        name: "Drenaje Pluvial ASDE",
        formattedPhone: "809-788-7676 Ext: 2852",
        unformattedPhone: "8097887676"),
    new Contact(
        name: "Ingeniería y Obras ASDE",
        formattedPhone: "809-788-7676 Ext:2521",
        unformattedPhone: "8097887676"),
    new Contact(
        name: "Cementerio Cristo Salvador",
        formattedPhone: "809-937-0842",
        unformattedPhone: "8099370842"),
    new Contact(
        name: "Funeraria Villa Carmen",
        formattedPhone: "809-728-2762",
        unformattedPhone: "8097282762"),
    new Contact(
        name: "Funeraria Isabelita",
        formattedPhone: "809-599-2798",
        unformattedPhone: "8095992798"),
    new Contact(
        name: "Funeraria Los Frailes",
        formattedPhone: "809-599-6850",
        unformattedPhone: "8095996850"),
    new Contact(
        name: "Funeraria Los Mina",
        formattedPhone: "809-388-1048",
        unformattedPhone: "8093881048"),
  ];

  return contacts;
}

Future<String> sendEmail(String subject, String description, String barrio, String sector, String location, String image) async {
  final response =
      await http.post(Uri.parse('https://api.sendinblue.com/v3/smtp/email'),
          headers: <String, String>{
            'content-type': 'application/json',
            'Api-Key':
                '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',
          },
          body: jsonEncode(
            {
              'sender': {"name": "Triny", "email": "pruebastriny@gmail.com"},
              'to': [
                {"email": "info@asde.gov.do", "name": "ASDE"}
                //{"email": "tomas.familia@outlook.com", "name": "ASDE"}
              ],
              'subject': subject,
              'attachment': [
                {"content" : image, "name" : "Imagen.jpg"}
              ],
              'htmlContent': """
                  <h1>Información:</h1>
                  <p>$description</p>
                  <p>$barrio</p>
                  <p>$sector</p>
                  <p>$location</p>
                  """,
            },
          ));
  print(response.statusCode);
  print("Codigo ejecutandose");
  return "ok";
}
