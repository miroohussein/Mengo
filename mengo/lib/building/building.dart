import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  margin: EdgeInsets.only(bottom: 5.0),
                  color: MengoColors.white,
                  width: size.width,
                  height: size.height,
                  child: Image.asset(
                    "assets/Splash-screen-light.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      margin: EdgeInsets.fromLTRB(15, 70, 15, 50),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: MengoColors.mainColorLight,
                              blurRadius: 20.0,
                              offset: Offset(1, 1))
                        ],
                        color: MengoColors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: MengoColors.mainColorLight,
                            width: 5.0,
                            style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[

                                  SizedBox(
                                    height: 18,
                                  ),

                                  Container(
                                    margin: EdgeInsets.all(13),
                                    child: Text('Building',style: TextStyle(
                                        color: MengoColors.mainColorLight,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: MengoColors.white,
                                        borderRadius: BorderRadius.circular(70),
                                        border: Border.all(
                                            color: MengoColors.mainColorLight,
                                            width: 3
                                        )
                                    ),
                                    child: Image.asset("assets/hammer-icon.png", fit: BoxFit.cover,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(50),
                                    child: Text('Building Download Apk file',style: TextStyle(
                                        color: MengoColors.mainColorLight,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: MengoColors.white,
                                              borderRadius: BorderRadius.circular(70),
                                              border: Border.all(
                                                  color: MengoColors.mainColorLight,
                                                  width: 3
                                              )
                                          ),
                                          child: Image.asset("assets/hammer-icon.png", fit: BoxFit.cover,),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: MengoColors.mainColorLight,
                                                  width: 2.0),
                                            ),
                                            labelText: " ",
                                            labelStyle: TextStyle(
                                              color: MengoColors.mainColorLight,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                      ],
                                    ),
                                  )
                                ]
                            ),
                          ],
                        ),
                      )),
                ),
              ]),
        ));
  }
}
