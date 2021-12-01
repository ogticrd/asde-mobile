import 'package:asde/models/service.dart';
import 'package:asde/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../main_drawer.dart';
import 'service_detail.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late Future<List<Service>> allServices;

  @override
  void initState() {
    allServices = fetchAllServices();
    super.initState();
  }

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
                "SERVICIOS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Seleccione un servicio a pagar",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<List<Service>>(
                  future: allServices,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 4.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ServiceDetailPage(
                                        service: snapshot.data![index],
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data![index].title,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 80,
                                                    child: Image.asset(
                                                        "assets/" +
                                                            snapshot
                                                                .data![index]
                                                                .image),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      snapshot.data![index]
                                                          .description,
                                                      maxLines: 4,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        height: 1.5,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
