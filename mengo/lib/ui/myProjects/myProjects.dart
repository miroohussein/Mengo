import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/pojo/pojo.dart';
class ProjectRequest{
  static const String url='http://mengo1.online/application/userProjectsData.php';
  static List<ProjectModel> parseProjects (String responseBody){
    var list=json.decode(responseBody)["resonse"]["result"] as List ;
    List <ProjectModel> projectsList=list.map((model)=>ProjectModel.fromJson(model)).toList();
return projectsList;
}
static Future<List<ProjectModel>>fetchProjects(String token)async{
    final response=await http.get(Uri.parse('$url') ,
        headers:{
      'content-Type': 'application/json',
          'Accept': 'application/json',
    'Authorization': 'bearer $token' ,},);

    if (response.statusCode==200) {
      print(response.body);
      return compute(parseProjects, response.body);
    }else{
      throw Exception("can not get");
    }
}
}


class MyProjects extends StatefulWidget {


  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  circularProgress(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  gridView(AsyncSnapshot<List<ProjectModel>>snapshot){
    GridView.count(

        crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: snapshot.data!.map((project) {
        return GestureDetector(
          child: GridTile(
            child: ProjectPhotos(project),),
          );
      }).toList(),
);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MengoColors.white,
          title: Center(
            child: Text(
              'My Projects',
              style: TextStyle( color: MengoColors.mainColorLight, fontWeight:FontWeight.bold),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(
                //   context,
                //   MaterialPageRoute(builder: (context) =>),
                // );
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: MengoColors.mainColorLight,
              )),
          actions: [
            Container(
                padding: EdgeInsets.all(5),
                width:60,height: 15,
                child:Image.asset("assets/logo.png", fit:BoxFit.cover,))
          ],
        ),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            color: MengoColors.white,
            width: size.width,
            height: size.height,
            child: Image.asset(
              "assets/mainBackground.png",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.fromLTRB(15, 70, 15, 150),
              padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: MengoColors.mainColorLight,
                      blurRadius: 20.0,
                      offset: Offset(1, 1))
                ],
                color: MengoColors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: MengoColors.mainColorLight,
                    width: 5.0,
                    style: BorderStyle.solid),
              ),
              child: Column(
                children: [
                  Expanded(

                      child:
                      FutureBuilder<List<ProjectModel>>(
                               future:ProjectRequest.fetchProjects("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MzM2MDQ1MTEsImlzcyI6ImxvY2FsaG9zdCIsInVzZXJJZCI6IjQ1In0.H6brwYB9QDp2mYCoKzUIQwB5ssstMc1et0PxTVKfiXo"),
                              builder: (context,snapshot){
                    if(snapshot.hasError){
                         return Text('Error${snapshot.error}');
                            }else if (snapshot.hasData){ return
                        gridView(snapshot);
                              }
                               return Text("") ;
                       },
                    ),
                   ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 150, top: 10),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
                color: MengoColors.white,
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                    color: MengoColors.mainColorLight,
                    width: 2
                )
            ),
            child: CircleAvatar(radius: 50,backgroundImage: AssetImage("assets/gallery.png") ,),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add, color: MengoColors.white,),
          onPressed: () {  },
          backgroundColor: MengoColors.mainColorLight,

        ),
      ),

    );
  }
}
class ProjectModel {
  String? id;
  String ?name;
   String? icon;
  String ?url;
  String ?createdAt;
  String ?type;

  ProjectModel(
      {required this.id, required this.name, required this.icon, required this.url, required this.createdAt, required this.type});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    url = json['url'];
    createdAt = json['created at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['created at'] = this.createdAt;
    data['type'] = this.type;
    return data;
  }
}
class ProjectPhotos extends StatelessWidget {

final ProjectModel project;
const ProjectPhotos(this.project);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(
          color: MengoColors.mainOrange, width: 3),
        borderRadius: BorderRadius.circular(30),),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "image${project.id}", child: FadeInImage.assetNetwork(placeholder: "images/logo.png", image: "${project.icon}",width: 100,height: 100,),
                ),

              )),
              Text("${project.name}",
                maxLines: 1,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),

              )
            ],
            ),

          ),
        ),
      ),
    );
  }
}
