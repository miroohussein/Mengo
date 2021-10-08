import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';

class Project extends StatefulWidget {


  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
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
            padding: const EdgeInsets.only(left: 80,),
            child: Text("project",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 88),
            child: CircleAvatar(radius: 25,backgroundImage: AssetImage("assets/gallery.png"),),
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
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 520),
            child: Center(
              child: Row(
                children:[


                  Center(
                    child: Container(
                    margin: const EdgeInsets.fromLTRB(90, 0, 0, 70),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image:DecorationImage(image: AssetImage("assets/logo.png"),),
                    ),),
                  ),


                ],
              ),
            ),
          ),
          Center(child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.only(bottom: 50,),
              child: Container(

                margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                width: 340,height: 400,
                decoration: BoxDecoration(color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,),borderRadius: BorderRadius.circular(20),

                ),

                child: Column(children:[
                Padding(
                  padding: const EdgeInsets.only(right: 5,top: 20,left: 10,),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:[Container(
                    height: 170, width: 150,
                    child: Card(
                            elevation: 10,
                            shadowColor: MengoColors.mainOrange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                              child:Container(
                                      decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange,width: 3),borderRadius: BorderRadius.circular(10),),
                                child:Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: new Text("First page",style: TextStyle(fontSize: 18,color: Colors.brown,fontWeight: FontWeight.bold,),),
                                ),
                              )
                          ),

                  ),
                           Container(
                             height: 170, width: 150,
                             child: Padding(
                               padding: const EdgeInsets.only(right: 0,),
                               child: Card(
                                   elevation: 10,
                                   shadowColor: MengoColors.mainOrange,
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                                   child:Container(
                                     decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange,width: 3),borderRadius: BorderRadius.circular(10),),
                                     child:Padding(
                                       padding: const EdgeInsets.only(left: 10),
                                       child: new Text("Second page",style: TextStyle(fontSize: 18,color: Colors.brown,fontWeight: FontWeight.bold,),),
                                     ),
                                   )
                               ),
                             ),

                           ),  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(

                          color: MengoColors.mainOrange ,
                          onPressed:(){},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Text("Preview app",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                      ),
                      MaterialButton(

                          color: MengoColors.mainOrange ,
                          onPressed:(){},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Text("Templates",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                      ),
                      MaterialButton(

                          color: MengoColors.mainOrange ,
                          onPressed:(){},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Text("Add page",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                      ),
                    ],



                  ),
                )
                ],  ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }

  }


