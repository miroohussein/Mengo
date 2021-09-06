import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';

class Templates extends StatefulWidget {


  @override
  _TemplatesState createState() => _TemplatesState();
}

class _TemplatesState extends State<Templates> {
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
           child: Text("Templates",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),),
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

            margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
            width: 380,height: 600,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,)

    ),
             child: GridView.count(
               crossAxisCount:2,
               children: List.generate(10, (index) => Padding(
                 padding: const EdgeInsets.all(15),
                 child: Card(
                       elevation: 10,
                       shadowColor: MengoColors.mainOrange,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius
                           .circular(30),),
                       child: Container(
                         decoration: BoxDecoration(border: Border.all(
                             color: MengoColors.mainOrange, width: 3),
                           borderRadius: BorderRadius.circular(30),),

                       ),



             ),
               )
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


