import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/colors/colors.dart';

import 'package:json_annotation/json_annotation.dart';


// Future create(
// File image , String projectType,String projectName,int ad)async{
//   var imageServer;
//   if (image!=null){
//     imageServer=await Dio.MultipartFile.fromFileSync(image.path,filename:image.path.split('/').last,);
//   }
//   try{
//     Dio.Response response=await dio().post('http://mengo1.online/application/createProject.php',
//     data:Dio.FormData.fromMap({
//       "name":"$projectName",
//       "type":"$projectType",
//       "icon":imageServer,
//       "ad":"$ad",
//     }),
//     options:Dio.Options(
//       headers: {
//         'content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'bearer $token' ,
//       },
//     ),
//     );
//     print(response.data);
//     if(response.data['status']==400) {
//       throw HttpException('error');
//     }
//     if
//     }
//   }
// }
// )
class CreateModel {
  String? name;
  String? type;
  File? icon;
  int? ad;

  CreateModel({this.name, this.type,this.icon,this.ad});

  CreateModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    type = json['icon'];
    type = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['icon'] = this.icon;
    data['ad'] = this.ad;
    return data;
  }
}
// Future<CreateModel> multiRequest(String url,Map<String,String>body,{File?image,required String key}) async {
//   const String url = 'http://mengo1.online/application/userProjectsData.php';
//
//
//   var request = http.MultipartRequest("POST", Uri.parse(url));
//
//
//     request.files.add(await http.MultipartFile.fromPath(key, image!.path));
//     request.fields[key] = 'name';
//     request.fields[key] = 'type';
//     request.fields[key] = 'ad';
//   var response = await request.send();
//   if (response.statusCode == 200) print('Uploaded!');
//   }
//
// }

class NewProject extends StatefulWidget {




  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  String _value='1';



File? image;
 Future pickImage(ImageSource source)async{
   try{
  final image =await ImagePicker().pickImage(source: source);


  if (image==null) return ;
  final imageTemporary=File(image.path);
  setState(() => this.image=imageTemporary);
  }on PlatformException catch (e){
    print('failed to pick image:$e');
  }

  }

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
                          child: Center(
                            child: ProjectIcon(),
                          ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0,left: 70,right: 70,bottom: 0,),
                      child: Center(child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(hintText: "Project name",),style: TextStyle(fontSize: 15,color: MengoColors.mainOrange),)),
                    ),



                       Padding(
                         padding: const EdgeInsets.only(left: 30,right: 30,),
                         child: TextField(
                           controller: typeController,
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
  Widget ProjectIcon(){
    return Center(
      child: Stack(
        children: [
          Positioned(
            child: InkWell(onTap: (){ showModalBottomSheet(context: context, builder:(builder)=>bottomSheet(),);},
              child:Container(
                child: Center(
                  child: image!=null?Image.file(image!,fit: BoxFit.cover,) : Container(
                    width: 200,height: 200,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/dog.png"),
                          fit: BoxFit.cover),
                    ),),
                ),),
              ),),
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

        children:[ Text("Choose project icon",style: TextStyle(fontSize: 20,),),
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            FlatButton.icon(onPressed: (){pickImage(ImageSource.camera);}, icon: Icon(Icons.camera), label: Text("Camera"),),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.image), label: Text("gallery"),),
          ],),
        ],),
    );
  }

}
