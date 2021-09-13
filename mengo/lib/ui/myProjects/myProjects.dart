import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/pojo/pojo.dart';


class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<MyProjectsData> myProjectsData= [
      MyProjectsData("Project1", "assets/food.png"),
      MyProjectsData("Project2", "assets/food.png"),
      MyProjectsData("Project3", "assets/food.png"),
      MyProjectsData("Project4", "assets/food.png"),

    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MengoColors.white,
          title: Center(
            child: Text(
              'My Projects',
              style: TextStyle( color: MengoColors.mainColorLight, fontWeight:FontWeight.bold),
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
                width:60,height: 15,
                child:Image.asset("assets/logo.png", fit:BoxFit.cover,))
          ],
        ),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            color: MengoColors.white,
            width: size.width,
            height: size.height,
            child: Image.asset(
              "assets/mainBackground.png",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.fromLTRB(15, 70, 15, 150),
              padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
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
              child: Column(
                children: [
                  Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: List.generate(myProjectsData.length, (index) {
                          return Card(
                            child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[

                                      ],
                                      color: MengoColors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: MengoColors.mainColorLight,
                                          width: 5.0,
                                          style: BorderStyle.solid),
                                    ),
                                    child: Image.asset(myProjectsData[index].projectLogo, fit: BoxFit.cover,),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    child: Text('${myProjectsData[index].projectName}', style: TextStyle(
                                        fontWeight: FontWeight.bold,color: MengoColors.mainOrange,
                                    ),),
                                  )
                                ]
                            ),
                          );
                        }),
                      )),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 150, top: 10),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                color: MengoColors.white,
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                    color: MengoColors.mainColorLight,
                    width: 2
                )
            ),
            child: CircleAvatar(radius: 50,backgroundImage: AssetImage("assets/gallery.png") ,),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add, color: MengoColors.white,),
          onPressed: () {  },
          backgroundColor: MengoColors.mainColorLight,

        ),
      ),

    );
  }
}
