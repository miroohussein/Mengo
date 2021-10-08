import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/pojo/pojo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
Future<List<BeginnerModel>> fetchData() async {
  final response = await http.get(
      Uri.parse('http://mengo1.online/application/singlePackage.php?pid=1'));
  if (response.statusCode == 200) {
    // List jsonResponse = json.decode(response.body);
    print(response.body);
    final jsonResponse = json.decode(response.body);
    final dataList = jsonResponse['response']['result'] as List;
    return dataList.map((data) => new BeginnerModel.fromMap(data)).toList();
  } else {
    throw Exception("can not get");
  }
}
class BeginnerModel {
  String ?id;
  String? englishName;
  String? arabicName;
  String ?projectNo;
  String ?price;

  BeginnerModel(
      {this.id, required this.englishName, required this.arabicName, required this.projectNo, required this.price});

  factory BeginnerModel.fromMap(Map<String, dynamic> json){
    return BeginnerModel(
      englishName:json["english name"],
      arabicName: json["arabic name"],
      projectNo: json["project_no"],
      price: json["price"],
    );
  }

}
class Packages extends StatefulWidget {



  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  late Future<List<BeginnerModel>> packagesObject;

  @override
  void initState() {
    super.initState();
    packagesObject = fetchData();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:MengoColors.white,
      leading: IconButton(

          onPressed: ()
          { },
          icon: Icon(
            Icons.arrow_back_ios,
            color: MengoColors.mainOrange,
          )),

      title:
      Row(
        children:[

          Center(child: Padding(
            padding: const EdgeInsets.only(left: 20,),
            child: Text("Your Package",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: CircleAvatar(radius: 27,backgroundImage: AssetImage("assets/gallery.png"),),
          ),
        ],
      ),
    ),
      body:
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage("assets/mainBackground.png"),fit: BoxFit.cover),
            ),),
          Padding(
            padding: const EdgeInsets.only(bottom: 95),
            child: Container(
              margin: const EdgeInsets.fromLTRB(85, 0, 0, 500),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage("assets/logo.png"),),
              ),),
          ),
          Container(
            child: FutureBuilder<List<BeginnerModel>>(
                future: packagesObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<BeginnerModel>? data = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 500,
                              width: 300,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: MengoColors.mainOrange, width: 4,),
                                  color: MengoColors.white),
                              child: Column(
                                children: [
                                  Container(

                                    width: 600,
                                    height: 100,
                                    decoration: BoxDecoration(color: MengoColors.mainOrange,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),),

                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            Text(data![1].englishName!, style: TextStyle(
                                                color: Colors.white, fontSize: 25),),
                                            Text(data[0].price!, style: TextStyle(
                                                color: Colors.white, fontSize: 15),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                    color: MengoColors.mainOrange,
                                                    borderRadius: BorderRadius.circular(70),),),
                                              ),
                                              Text("Create 50 apps", style: TextStyle(
                                                  color: Colors.black, fontSize: 20),),

                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                    color: MengoColors.mainOrange,
                                                    borderRadius: BorderRadius.circular(70),),),
                                              ),
                                              Text("With mengo ads", style: TextStyle(
                                                  color: Colors.black, fontSize: 20),),

                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                    color: MengoColors.mainOrange,
                                                    borderRadius: BorderRadius.circular(70),),),
                                              ),
                                              Text("5 Builds Apk per app", style: TextStyle(
                                                  color: Colors.black, fontSize: 20),),

                                            ],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ],

                              ),
                            ),
                          );


                  } else {
                    return Container(
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                }),
          ),

          ]
                    ),
                                        );



  }

}

