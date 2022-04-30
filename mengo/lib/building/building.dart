import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mengo/colors/colors.dart';

class BuildingApp extends StatefulWidget {
  const BuildingApp({Key? key}) : super(key: key);

  @override
  _BuildingAppState createState() => _BuildingAppState();
}

class _BuildingAppState extends State<BuildingApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MengoColors.white,
            title: Center(
              child: Text(
                ' Building New Project',
                style: TextStyle(
                    color: MengoColors.mainColorLight, fontWeight: FontWeight.bold),
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  // Navigator.pop(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>),
                  // );
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: MengoColors.mainColorLight,
                )),
            actions: [
              Container(
                  padding: EdgeInsets.all(5),
                  width: 60,
                  height: 15,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.cover,
                  ))
            ],
          ),
          body: Stack(
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
                Center(child: SingleChildScrollView(

                  child: Container(

                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 60),
                    width: 320,height: 500,
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,)

                    ),
                    child: Column(
                      children: [
                        Center(child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 30),
                          child: Text('Building...',style: TextStyle(color: MengoColors.mainOrange,fontSize: 35,fontWeight: FontWeight.bold,),),
                        )),
                      Container(
                        width: 150,
                        height: 140,
                        child: CircleAvatar(backgroundColor:Colors.white, radius: 50,backgroundImage: AssetImage("assets/hammer-icon.png") ,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40,bottom: 60,),
                        child: Text('Building download APK file',style: TextStyle(color: MengoColors.mainOrange,fontSize: 20,fontWeight: FontWeight.bold,),),
                      ),
                        LinearProgressIndicator(

                          valueColor: AlwaysStoppedAnimation(MengoColors.mainOrange),
                          backgroundColor: Colors.white,
                        ),
                ]  ),
                ),
                ),)]),
              ),
        );
  }
}
