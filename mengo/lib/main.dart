
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mengo/building/building.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/try/try.dart';
import 'package:mengo/ui/addPage/addPage.dart';
import 'package:mengo/ui/login/login.dart';

import 'package:mengo/ui/logo/logoPage.dart';
import 'package:mengo/ui/myProjects/myProjects.dart';
import 'package:mengo/ui/newProject/newProject.dart';
import 'package:mengo/ui/packages/packages.dart';
import 'package:mengo/ui/packs/packs.dart';
import 'package:mengo/ui/pojo/pojo.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:mengo/ui/project/project.dart';
import 'package:mengo/ui/registeration/registerationPage.dart';
import 'package:mengo/ui/subscriptions/subscriptions.dart';
import 'package:mengo/ui/templates/templates.dart';


void main() {
  HttpOverrides.global = new MyHttpOverrides();

  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      home: Try()));
}

class Mengo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mengo',
      home: MyHomePage(title: 'Mengo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MengoColors.mainColorLight,
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}