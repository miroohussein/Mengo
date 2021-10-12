import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'pack-info.dart';

Future<List<PackagesModel>> fetchData() async {
  final resonse = await http.get(
      Uri.parse('http://mengo1.online/application/allPackage.php'));
  if (resonse.statusCode == 200) {
    // List jsonResponse = json.decode(resonse.body);
    final jsonResponse = json.decode(resonse.body);
    final dataList = jsonResponse['resonse']['result'] as List;
    return dataList.map((data) => new PackagesModel.fromMap(data)).toList();
  } else {
    throw Exception("can not get");
  }
}
class PackagesModel {
  String ?id;
  String? englishName;
  String? arabicName;
  String ?projectNo;
  String ?price;

  PackagesModel(
      {this.id, required this.englishName, required this.arabicName, required this.projectNo, required this.price});

  factory PackagesModel.fromMap(Map<String, dynamic> json){
    return PackagesModel(
      englishName:json["english name"],
      arabicName: json["arabic name"],
      projectNo: json["project_no"],
      price: json["price"],
    );
  }
}

class Subscriptions extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}
class _SubscriptionsState extends State<Subscriptions> {
  late Future<List<PackagesModel>> packagesObject;

  @override
  void initState() {
    super.initState();
    packagesObject = fetchData();
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
            child: Text("Subscriptions",
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
            child: FutureBuilder<List<PackagesModel>>(
                future: packagesObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<PackagesModel>? data = snapshot.data;
                    return Center(
                      child: CarouselSlider.builder(
                        options: CarouselOptions(height: 500),
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const PackInfo(),
                                settings: RouteSettings(
                                  arguments: data[index],
                                ),
                              ),
                              );
                            },
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
                                            Text(data[index].englishName!, style: TextStyle(
                                                color: Colors.white, fontSize: 25),),
                                            Text(data[index].arabicName!, style: TextStyle(
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
                                              Text("Create "+ data[index].projectNo! +" apps", style: TextStyle(
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
                                              Text('Price: ${data[index].price!}', style: TextStyle(
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
                        },),
                    );
                  } else {
                    return Container(
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                }),
          ),


          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 570, 5, 0),
              child: MaterialButton(

                  color: MengoColors.mainOrange,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("   Already subscribed   ",
                    style: TextStyle(color: Colors.white,),
                    textAlign: TextAlign.center,)
              ),
            ),
          ),


        ],
      ),
    );
  }

}
