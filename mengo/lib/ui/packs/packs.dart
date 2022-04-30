import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/pojo/pojo.dart';

class Packs extends StatefulWidget {


  @override
  _PacksState createState() => _PacksState();
}

class _PacksState extends State<Packs> {
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
            padding: const EdgeInsets.only(left: 60,),
            child: Text("Packages",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),),
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
          Center(child: SingleChildScrollView(

            child: Container(

              margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
              width: 380,height: 450,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,)

              ),
              child: Column(
                  children: [
                    Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange)),
                            child: Column(
                              children: [
                                Center(child: Container(width:80,height: 90, decoration: BoxDecoration(
                                  image:DecorationImage(image: AssetImage("assets/cloud.png"),
                                ),),),


),
                              ],
                            ),
                          ),
                        ),

                           Container(
                             margin: const EdgeInsets.only(left: 16),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange)),

                          ),

                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange)),

                          ),
                        ),

                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange)),

                          ),

                      ],
                    ),
                  ],





              ),

            ),
          ),
          ),
        ],
      ),
    );
  }

}

