import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/logo/logoPage.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:mengo/ui/project/project.dart';
import 'package:mengo/ui/templates/templates.dart';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      home: Project()));
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
