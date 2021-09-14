

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddPage extends StatefulWidget {


  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
            Color color=  Colors.red;
              String valueChoose="Theme";
              String value_ ="buttons";
                 List listItem =["Theme","App bar color","body background","floating button","bottom bar"];
              List secItem =["buttons","button color","button shapes"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            padding: const EdgeInsets.only(left: 75,),
            child: Text("Add page",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),),
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
            Center(
                child: Container(

                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                       width: size.width, height: 600,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,)

                  ),
                ),

            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 185, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange,width: 4,),borderRadius: BorderRadius.circular(20),),
                          width: 150,height: 30,
                          child: DropdownButton(
                            hint: Text('Theme:',style: TextStyle(color: MengoColors.mainOrange,fontSize: 20,),),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            value: valueChoose,
                            onChanged: (newValue) {
                              setState(() {
                                     valueChoose =newValue.toString();
                              });
                            },
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),);
                              }
                                ).toList(),
                              ),
                 ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: MengoColors.mainOrange,width: 4,),borderRadius: BorderRadius.circular(20),),
                          width: 150,height: 30,
                          child: DropdownButton(
                            hint: Text('Theme:',style: TextStyle(color: MengoColors.mainOrange,fontSize: 20,),),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            value: value_,
                            onChanged: (newValue) {
                              setState(() {
                                value_ =newValue.toString();
                              });
                            },
                            items: secItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),);
                            }
                            ).toList(),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 45, 0, 0),
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(20),),
                        child: MaterialButton(

                            color: MengoColors.mainOrange ,
                            onPressed:(){},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text("  Add Image   ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(20),),
                        child: MaterialButton(

                            color: MengoColors.mainOrange ,
                            onPressed:(){},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text("  Add Text   ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(20),),
                        child: MaterialButton(

                            color: MengoColors.mainOrange ,
                            onPressed:(){},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text("  Add video   ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(20),),
                        child: MaterialButton(

                            color: MengoColors.mainOrange ,
                            onPressed:(){},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text("  Add audio   ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(color: MengoColors.mainOrange,borderRadius: BorderRadius.circular(20),),
                        child: MaterialButton(

                            color: MengoColors.mainOrange ,
                            onPressed:(){},
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text("  save   ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                        ),
                      ),
                    ],
              ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 100, 4, 5),
                      child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,border: Border.all(color: MengoColors.mainOrange,width: 4,)),
                        height: 500,
                        width: 200,
                       child: Column(
                         children: [
                         Container(
                               height: 50,
                                 width: 200,
                       decoration:BoxDecoration(
                          color: MengoColors.mainOrange,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),) ,
                       ),


                        ),

                          Container(

                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 502),
                            child: ColorPicker(pickerColor: color , onColorChanged: (color)=>setState(()=>this.color=color),


                            ),
                          ),

                         ],
                       ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],

      ),
    );
  }
}