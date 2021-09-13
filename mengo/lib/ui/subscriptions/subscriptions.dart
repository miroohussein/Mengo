

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Subscriptions extends StatefulWidget {


  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
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
            padding: const EdgeInsets.only(left: 45,),
            child: Text("Subscriptions",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),),
          )),

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

           Center(
             child: Padding(
               padding: const EdgeInsets.only(bottom: 600,),
               child: Container(

                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image:DecorationImage(image: AssetImage("assets/logo.png"),),
                ),),
             ),
           ),

                 Center(
                   child: CarouselSlider.builder(


                    options: CarouselOptions(height: 500 ),itemCount: 4, itemBuilder: (BuildContext context, int index, int realIndex) {
                       return Container(
                         height: 500,
                         width: 300,
                         decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),border: Border.all(color: MengoColors.mainOrange,width: 4,),color: MengoColors.white),
                            child: Column(
                              children: [
                                Container(

                                  width: 600,
                                  height: 100,
                                  decoration:BoxDecoration( color: MengoColors.mainOrange,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),) ,

                                ),
                                  child:Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children:[
                                       Text("Beginner",style: TextStyle(color: Colors.white,fontSize: 25),),
                                          Text("EGP 196.99 per month",style: TextStyle(color: Colors.white,fontSize: 15),),
                                      ],
                                ),
                                    ),
                                  ),
                                ),
                                Container(
                                child: Column(
                                  children:[

                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(width: 15,height: 15, decoration:BoxDecoration( color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(70),),),
                                          ),
                                            Text("Create 50 apps",style: TextStyle(color: Colors.black,fontSize: 20),),

                                      ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(width: 15,height: 15, decoration:BoxDecoration( color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(70),),),
                                          ),
                                          Text("2 GB Cloud Storage",style: TextStyle(color: Colors.black,fontSize: 20),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(width: 15,height: 15, decoration:BoxDecoration( color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(70),),),
                                          ),
                                          Text("With mengo ads",style: TextStyle(color: Colors.black,fontSize: 20),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(width: 15,height: 15, decoration:BoxDecoration( color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(70),),),
                                          ),
                                          Text("5 Builds Apk per app",style: TextStyle(color: Colors.black,fontSize: 20),),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(width: 15,height: 15, decoration:BoxDecoration( color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(70),),),
                                          ),
                                          Text("50 Pages per app",style: TextStyle(color: Colors.black,fontSize: 20),),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                ),
                              ],

                            ),
                       );

                   },),
                 ),


          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 570, 5, 0),
              child: MaterialButton(

                  color: MengoColors.mainOrange ,
                  onPressed:(){},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text("   Already subscribed   ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
              ),
            ),
          ),



        ],
      ),
    );
  }

}
