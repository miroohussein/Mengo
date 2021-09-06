import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/pojo/pojo.dart';

class Packages extends StatefulWidget {


  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  @override
 final List<PackagesList> packagesList=[
   PackagesList("assets/cloud.png","Free","Days Left"),
    PackagesList("assets/cal.png","592.56KB/256MB","Shared storage"),
    PackagesList("assets/squares.png","3/3","App created"),
    PackagesList("assets/right.png"," ","buy a storage"),

  ];
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
              child: Center(
                child: GridView.extent(
                       mainAxisSpacing: 25,

                  maxCrossAxisExtent: 200,
                  children: List.generate(4, (int index) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                        child: Card(

                          elevation: 10,
                          shadowColor: MengoColors.mainOrange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius
                              .circular(30),),

                          child: Container(

                            decoration: BoxDecoration(border: Border.all(
                                color: MengoColors.mainOrange, width: 3),
                              borderRadius: BorderRadius.circular(30),),
                                 child: Column(
                                   children: [
                                     Center(child: Container(width:80,height: 90, decoration: BoxDecoration(
                                       image:DecorationImage(image: AssetImage(packagesList[index].image),fit: BoxFit.cover,),
                                     ),)),

                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(packagesList[index].data,style: TextStyle(fontSize: 10),),
                                     ),


                                   ],
                                 ),
                          ),



                        ),

                    ),
                  ),

                  ),
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

