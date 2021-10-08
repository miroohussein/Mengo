import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mengo/colors/colors.dart';
import 'package:http/http.dart' as http;
Future<NewProjectModel> createNewProject(String name,String type ,String icon,) async {
  try{
    final response = await http.post(
      Uri.parse("https://mengo1.online/application/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'  },

      body: jsonEncode(<String, dynamic>{
        'name': name,
        'type': type,
        'icon': icon,

      }),

    );

    if (response.statusCode == 201) {

      return NewProjectModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create .');
    }
  }
  on SocketException {
    throw ('internet problem');
  }on HandshakeException {
    throw ('second problem');
  }on TimeoutException{
    throw ('third problem');


  }
}
class NewProjectModel {
  late final String name;
  late final String type;
  late final Image icon;


  NewProjectModel({required this.name,required this.type, required this.icon, });

  factory NewProjectModel.fromJson(Map<String, dynamic> json) {
    return NewProjectModel(
      name: json['name'],
      type: json['type'],
      icon: json['icon'],
    );
  }
}

class NewProject extends StatefulWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController iconController = TextEditingController();


  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  String _value='1';
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
          child: Center(child: Text("New Project",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),)),
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

            child: Padding(
              padding: const EdgeInsets.only(bottom: 50,),
              child: Container(

                margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                width: 300,height: 450,
                decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 2.5,)

                ),
                child:Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(

                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(border: Border.all(width:2,color: MengoColors.mainOrange),borderRadius: BorderRadius.circular(20),),
                          child: Image.asset(
                            "assets/dog.png",fit: BoxFit.cover,
                          ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0,left: 70,right: 70,bottom: 0,),
                      child: Center(child: TextFormField(decoration: InputDecoration(hintText: "First",),style: TextStyle(fontSize: 20,color: MengoColors.mainOrange),)),
                    ),



                       Padding(
                         padding: const EdgeInsets.only(left: 30,right: 30,),
                         child: TextField(
                            decoration: InputDecoration(

                                  fillColor: MengoColors.mainOrange,
                              labelText: "Project type",

                              labelStyle: TextStyle(

                                color: MengoColors.mainOrange,
                                fontSize: 15,

                              ),),
                      ),
                       ),

                    Row(
                      children: [
                        Radio(value: '1', groupValue: _value, onChanged:(value){setState(() {
                          _value=value.toString();
                        });},
                        ),
                        SizedBox(width: 10,),
                        Text("Admob ads")
                      ],

                    ),
                    Row(
                      children: [

                        Radio(value: '2', groupValue: _value, onChanged:(value){setState(() {
                          _value=value.toString();
                        });},

                        ),
                        SizedBox(width: 10,),
                        Text("Facebook ads")
                      ],

                    ),

                          ],
    ),
    ),
            ),  ),),],
    ),

    );
  }


}
