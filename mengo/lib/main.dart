import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/registeration/registerationPage.dart';
void main() {
  runApp(Mengo());
}

class Mengo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mengo',
      home: Registration(),
    );
  }
}
