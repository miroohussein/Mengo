import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mengo/colors/colors.dart';



class Profile extends StatefulWidget {


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:MengoColors.white,
        leading: IconButton(

          onPressed: ()
          { },
          icon: Icon(
            Icons.arrow_back_ios,
            color: MengoColors.mainOrange,
          )),
        title: Padding(
          padding: const EdgeInsets.only(right: 80,),
          child: Center(child: Text("Profile",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),)),
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
                    width: 300,height: 600,
                    decoration: BoxDecoration(color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 2.5)

                    ),
                    child:Column(
                                 children:[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                      width:200,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Your name",
                          labelStyle: TextStyle(
                            color: MengoColors.mainOrange,
                            fontSize: 17,

                          ),),
                      ),
                    ),
                                   Container(

                                     width:200,
                                     child: TextField(
                                       decoration: InputDecoration(
                                         labelText: "Your Company",
                                         labelStyle: TextStyle(
                                           color: MengoColors.mainOrange,
                                           fontSize: 17,

                                         ),),
                                     ),
                                   ),
                                   Container(

                                     width:200,
                                     child: TextField(
                                       decoration: InputDecoration(
                                         labelText: "Your Email",
                                         labelStyle: TextStyle(
                                           color: MengoColors.mainOrange,
                                           fontSize: 17,

                                         ),),
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                     child: MaterialButton(

                                         color: MengoColors.mainOrange ,
                                         onPressed:(){},
                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                         child: Text(" Packages  ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                                     ),
                                   ),
                                   Container(

                                     child: MaterialButton(

                                         color: MengoColors.mainOrange ,
                                         onPressed:(){},
                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                         child: Text(" Subscribe  ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                                     ),
                                   ),
                                   Container(

                                     child: MaterialButton(

                                         color: MengoColors.mainOrange ,
                                         onPressed:(){},
                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                         child: Text("  About us  ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                                     ),
                                   ),
                                   Container(

                                     child: MaterialButton(

                                         color: MengoColors.mainOrange ,
                                         onPressed:(){},
                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                         child: Text("   Log out   ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                                     ),
                                   ),

                                      Container(

                                       child: Row(
                                         children:[
                                       Container(
                                         margin: const EdgeInsets.fromLTRB(50, 0, 5, 0),
                                         child: MaterialButton(

                                                 color: MengoColors.mainOrange ,
                                                 onPressed:(){},
                                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                 child: Text("   Arabic   ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                                             ),
                                       ),
                                           MaterialButton(

                                               color: MengoColors.mainOrange ,
                                               onPressed:(){},
                                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                               child: Text("   English  ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                                           )],),),],),),),),
                                               Container(
                                                       margin: const EdgeInsets.fromLTRB(0, 50, 0, 450),
                                                    child: imageProfile()
                                                ),],),);
                                }
                                Widget imageProfile(){
                                  return Center(
                                    child: Stack(
                                      children: [CircleAvatar(radius: 50,backgroundImage: AssetImage("assets/gallery.png") ,),
                                      Positioned(bottom:5,right:10,
                                        child: InkWell(onTap: (){ showModalBottomSheet(context: context, builder:(builder)=>bottomSheet(),);},
                                             child: Icon(Icons.camera_alt,color: MengoColors.mainOrange,size: 28,),),),
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
