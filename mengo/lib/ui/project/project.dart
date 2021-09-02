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

              margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
              width: 380,height: 600,
              decoration: BoxDecoration(color: Color(0xFFFFEFA5),border: Border.all(color:MengoColors.mainOrange,width: 4,),borderRadius: BorderRadius.circular(20),

              ),
              child: GridView.count(
                crossAxisCount:2,
                children: List.generate(10, (index){

                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: new Card(
                      elevation: 10,
                      shadowColor: MengoColors.mainOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                        child:Container(

                          child:Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: new Text("First page",style: TextStyle(fontSize: 20,color: Colors.brown,fontWeight: FontWeight.bold,),),
                          ),
                        )

                    ),
                  );
                }

                ),

              ),

            ),
          ),
          ),
        ],
      ),
    );
  }
}

