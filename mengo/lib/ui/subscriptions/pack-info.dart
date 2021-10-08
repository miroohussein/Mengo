import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/subscriptions/subscriptions.dart';


class PackInfo extends StatelessWidget {
  const PackInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as PackagesModel;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mainBackground.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 95),
            child: Container(
              margin: const EdgeInsets.fromLTRB(85, 0, 0, 500),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                  width: 380,
                  height: 600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: MengoColors.mainOrange,
                        width: 4,
                      )),
                  child:Card(
                          child: Column(
                            children: [
                              Text(data.englishName!),
                              Text(data.arabicName!),
                              Text(data.projectNo!),
                              Text(data.price!),
                            ],
                          ),
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
