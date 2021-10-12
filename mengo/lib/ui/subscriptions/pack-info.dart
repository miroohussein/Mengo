import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/subscriptions/subscriptions.dart';


class PackInfo extends StatelessWidget {
  const PackInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as PackagesModel;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mainBackground.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 95),
            child: Container(
              margin: const EdgeInsets.fromLTRB(85, 0, 0, 500),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                  width: 300,
                  height: 490,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: MengoColors.mainOrange,
                        width: 4,

                      )),
                  child:Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0,top: 10,right: 70,),
                        child: Text("Your Package:"  ,style: TextStyle(color: MengoColors.mainOrange, fontSize: 27,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0,top: 50,right: 70,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
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
                                      Text(data.englishName!, style: TextStyle(
                                          color: Colors.black, fontSize: 20),),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30,bottom: 30,left: 8,right: 8),
                                        child: Container(width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: MengoColors.mainOrange,
                                            borderRadius: BorderRadius.circular(70),),),
                                      ),
                                      Text("Create "+ data.projectNo! +" apps", style: TextStyle(
                                          color: Colors.black, fontSize: 20),),

                                    ],
                                  ),
                                  Row(
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
                                      Text('Price: ${data.price!}', style: TextStyle(
                                          color: Colors.black, fontSize: 20),),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),],
                  ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
