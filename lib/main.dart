
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mengo/Root.dart';
import 'package:mengo/building/building.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/addPage/E-commerce/offersProduct.dart';
import 'package:mengo/ui/addPage/commercial/ApiCollection.dart';
import 'package:mengo/ui/addPage/commercial/about.dart';
import 'package:mengo/ui/addPage/portfolio/ApiCollection2.dart';
import 'package:mengo/ui/addPage/portfolio/nav_bar_config.dart';
import 'package:mengo/ui/login/login.dart';
import 'package:mengo/ui/logo/logoPage.dart';
import 'package:mengo/ui/myProjects/ProjectModel.dart';
import 'package:mengo/ui/newProject/newProject.dart';
import 'package:mengo/ui/newProject/sender.dart';
import 'package:mengo/ui/packages/packages.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:mengo/ui/project/project.dart';
import 'package:mengo/ui/registeration/registerationPage.dart';
import 'package:mengo/ui/subscriptions/ApiPack.dart';
import 'package:provider/provider.dart';


import 'api/auth.dart';
import 'ui/addPage/E-commerce/apiColiiection.dart';
import 'ui/addPage/commercial/start_bar.dart';
import 'ui/addPage/portfolio/footer.dart';
import 'ui/addPage/portfolio/projects.dart';
import 'ui/addPage/portfolio/skills.dart';
import 'ui/profile/profileProvider.dart';



void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
      Mengo());
}
class Mengo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth(),),
        ChangeNotifierProvider(create: (context) => ApiP1(),),
        ChangeNotifierProvider(create: (context) => ApiEco(),),
        ChangeNotifierProvider(create: (context) => Sender(),),
        ChangeNotifierProvider(create: (context) => packApi(),),
        ChangeNotifierProvider(create: (context) => ApiEcoo(),),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mengo',
        home: Profile()
      ),
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