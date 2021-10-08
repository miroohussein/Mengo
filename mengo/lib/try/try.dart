import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mengo/colors/colors.dart';

Future<List<ProjectModel>> fetchData(String token) async {
  final resonse = await http.get(
      Uri.parse('http://mengo1.online/application/userProjectsData.php'),
    headers:{
  'content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer $token' ,},
  );
  if (resonse.statusCode == 200) {
    // List jsonResponse = json.decode(resonse.body);
   print(resonse.body);
    final jsonResponse = json.decode(resonse.body);
    final dataList = jsonResponse['resonse']['result'] as List;
    return dataList.map((data) => new ProjectModel.fromMap(data)).toList();
  } else {
    throw Exception("can not get");
  }
}
class ProjectModel {
  String? id;
  String ?name;
  String? icon;
  String ?url;
  String ?createdAt;
  String ?type;

  ProjectModel(
      {this.id, required this.name, required this.icon, required this.url, required this.createdAt,this.type});

  factory ProjectModel.fromMap(Map<String, dynamic> json){
    return ProjectModel(
        id:json["id"],
        name: json["name"],
        icon: json["icon"],
        url: json["url"],
        createdAt: json["created at"],
        type: json["type"]
    );
  }
}
class Try extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}
class _SubscriptionsState extends State<Try> {
  late Future<List<ProjectModel>> projectsObject;

  @override
  void initState() {
    super.initState();
    projectsObject = fetchData("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MzM2MDcxNTYsImlzcyI6ImxvY2FsaG9zdCIsInVzZXJJZCI6IjQ1In0.S2F2NlbjHozZ1xDHy7gbo6DVwZcv-M6D_ta248WJiuQ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: MengoColors.white,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: MengoColors.mainOrange,
          )),
      title:
      Row(
        children: [

          Center(child: Padding(
            padding: const EdgeInsets.only(left: 45,),
            child: Text("Projects",
              style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),),
          )),

        ],
      ),
    ),
      body:
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mainBackground.png"),
                  fit: BoxFit.cover),
            ),),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 600,),
              child: Container(

                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"),),
                ),),
            ),
          ),
          Container(
            child: FutureBuilder<List<ProjectModel>>(
                future: projectsObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProjectModel>? data = snapshot.data;
                    return Container(

                        margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                        width: 380,height: 600,
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,)

                        ),
                        child:GridView.count(crossAxisCount:2,
                    children: List.generate(data!.length, (index) => Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(
                            color: MengoColors.mainOrange, width: 3),
                          borderRadius: BorderRadius.circular(30),),
                        child: Card(

                          shadowColor: MengoColors.mainOrange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius
                              .circular(30),),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children:[ Container(

                                      child: Text(data[0].name!),
                            ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: Container(

                                    width: 100,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image:DecorationImage(image: NetworkImage(data[0].icon!),),
                                    ),),
                                ),
                              ),


                            ],
                          ),



                        ),
                      ),
                    )
                    ),),);
                  } else if (snapshot.hasError){
                    return Container(
                      child: Center(child: Text('Error${snapshot.error}')),
                    );
                  }return Text("aa");
                }),
          ),





        ],
      ),
    );
  }

}