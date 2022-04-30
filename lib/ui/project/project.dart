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
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: InkWell(onTap: (){{ showModalBottomSheet(context: context, builder:(builder)=>bottomSheet(),);}} ,
                         child: Icon(Icons.playlist_add,color: MengoColors.mainOrange,size: 40,),),
                      ),

                  Center(
                    child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 70),
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

            child: Container(

              margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
              width: 380,height: 600,
              decoration: BoxDecoration(color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,),borderRadius: BorderRadius.circular(20),

              ),
              child: GridView.count(

                crossAxisCount:2,
                children: List.generate(10, (index){

                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: new Card(
                      elevation: 10,
                      shadowColor: MengoColors.mainOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                        child:Container(
                                decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange,width: 3),borderRadius: BorderRadius.circular(30),),
                          child:Padding(
                            padding: const EdgeInsets.only(left: 15),
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
  Widget bottomSheet(){
    return Container(
      height:150,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20,),
      child: Column(

        children:[ Text("Choose Profile Photo",style: TextStyle(fontSize: 20,),),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.camera), label: Text("Camera"),),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.image), label: Text("gallery"),),
          ],),
        ],),
    );
  }
  }


