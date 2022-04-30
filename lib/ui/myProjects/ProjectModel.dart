import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mengo/building/building.dart';
import 'dart:convert';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/addPage/E-commerce/homePage.dart';
import 'package:mengo/ui/addPage/commercial/start_bar.dart';
import 'package:mengo/ui/addPage/portfolio/nav_bar_config.dart';
import 'package:mengo/ui/newProject/newProject.dart';
import 'package:url_launcher/url_launcher.dart';

Future<List<ProjectModel>> fetchData(String token) async {
  GetStorage storage22 = GetStorage();
  final resonse = await http.get(
    Uri.parse('http://mengo1.online/application/userProjectsData.php'),
    headers: {
      'content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
  if (resonse.statusCode == 200) {
    print(resonse.body);
    final jsonResponse = json.decode(resonse.body);
    final dataList = jsonResponse['resonse']['result'] as List;
    storage22.write(
      'ids',
      dataList,
    );
    return dataList.map((data) => new ProjectModel.fromMap(data)).toList();
  } else {
    throw Exception("can not get");
  }
}

class ProjectModel {
  String? id;
  String? name;
  String? icon;
  String? url;
  String? createdAt;
  String? type;

  ProjectModel(
      {this.id,
      required this.name,
      required this.icon,
      required this.url,
      required this.createdAt,
      this.type});

  factory ProjectModel.fromMap(Map<String, dynamic> json) {
    return ProjectModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        url: json["url"],
        createdAt: json["created at"],
        type: json["type"]);
  }
}

class ProjectView extends StatefulWidget {
  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  String? id;
  late Future<List<ProjectModel>> projectsObject;

  @override
  void initState() {
    super.initState();
    GetStorage _getStorage = GetStorage();
    projectsObject = fetchData(_getStorage.read('info')['token']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MengoColors.white,
        leading: IconButton(
            onPressed: () {Navigator.of(context).pop();},
            icon: Icon(
              Icons.arrow_back_ios,
              color: MengoColors.mainOrange,
            )),
        title: Center(
          child: Text(
            "Projects",
            style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mainBackground.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 600,
              ),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: FutureBuilder<List<ProjectModel>>(
                  future: projectsObject,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ProjectModel>? data = snapshot.data;
                      return Container(
                        margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                        width: 380,
                        height: 600,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                              color: MengoColors.mainOrange,
                              width: 4,
                            )),
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                              data!.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (builder) => Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  data[index].name!,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FlatButton.icon(
                                                      onPressed: () async {
                                                        String? Url =
                                                            data[index].url;
                                                        var urllaunchable =
                                                            await canLaunch(
                                                                Url!); //canLaunch is from url_launcher package
                                                        if (urllaunchable) {
                                                          await launch(
                                                              Url); //launch is from url_launcher package to launch URL
                                                        } else {
                                                          print(
                                                              "URL can't be launched.");
                                                        }
                                                      },
                                                      icon:
                                                          Icon(Icons.language),
                                                      label: Text("Preview"),
                                                    ),
                                                    FlatButton.icon(
                                                      onPressed: () {
                                                        GetStorage storage2 =
                                                            GetStorage();
                                                        storage2.write(
                                                          'id',
                                                          data[index].id,
                                                        );
                                                        if (data[index].type ==
                                                            "1") {
                                                          Get.to(
                                                              () => AddPage(),
                                                              transition: Transition
                                                                  .rightToLeft);
                                                        }
                                                        if (data[index].type ==
                                                            "2") {
                                                          Get.to(
                                                              () =>
                                                                  AddPageECO(),
                                                              transition: Transition
                                                                  .rightToLeft);
                                                        }
                                                        if (data[index].type ==
                                                            "3") {
                                                          Get.to(
                                                              () => HomePageE(),
                                                              transition: Transition
                                                                  .rightToLeft);
                                                        }
                                                      },
                                                      icon: Icon(Icons.image),
                                                      label: Text("Edit"),
                                                    ),
                                                    FlatButton.icon(
                                                      onPressed: () {
                                                        GetStorage storage2 =
                                                            GetStorage();
                                                        storage2.write(
                                                          'id',
                                                          data[index].id,
                                                        );
                                                        Get.to(
                                                            () => BuildingApp(),
                                                            transition: Transition
                                                                .rightToLeft);
                                                      },
                                                      icon: Icon(Icons
                                                          .android_rounded),
                                                      label:
                                                          Text("Request apk"),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: MengoColors.mainOrange,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Card(
                                          shadowColor: MengoColors.mainOrange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(data[index].name!),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 30),
                                                  child: Container(
                                                    width: 100,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            data[index].icon!),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        child: Center(child: Text('Error${snapshot.error}')),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 630
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    primary: MengoColors.mainOrange,
                  ),
                  onPressed: () {
                    Get.to(() => NewProject(),
                        transition: Transition.rightToLeft);
                  },
                  child: Text('  Create New project  ')),
            ),
          )
        ],
      ),
    );
  }
}
