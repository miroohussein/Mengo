import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';

import 'package:provider/provider.dart';

import 'ApiCollection.dart';
import 'CommericialServices.dart';

class SingleProjectECO extends StatefulWidget {
  const SingleProjectECO({Key? key}) : super(key: key);

  @override
  _SingleProjectECOState createState() => _SingleProjectECOState();
}

class _SingleProjectECOState extends State<SingleProjectECO> {
  TextEditingController name = TextEditingController();
  TextEditingController text = TextEditingController();
  TextEditingController link = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image1;
  File? _pickedImage1;
  final ImagePicker _picker1 = ImagePicker();
  Future getImage1() async {
    final pickedFile = await _picker1.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage1 = File(pickedFile.path);
      } else {}
    });
  }

  Future<void> _save7() async {
    bool saved7 = Provider.of<ApiEco>(context, listen: false).addECO7;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved7 = await Provider.of<ApiEco>(context, listen: false).sendECO7(
        _pickedImage1!,
        name.text,
        text.text,
        link.text,
      );
      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on HttpExeptionEco catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("Check values or\nNo internet connection", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("Check values or\nNo internet connection", context);
    } finally {
      if (saved7) {
        qrDaialog('saved!', context, "Done", () {
          Get.to(() => const ServiceECO(), transition: Transition.rightToLeft);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MengoColors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: MengoColors.mainOrange,
            )),
        title: Row(
          children: [
            Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 75,
                  ),
                  child: Text(
                    "add project",
                    style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),
                  ),
                )),
          ],
        ),
      ),
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
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 130),
              width: 350,
              height: 490,
              child: SingleChildScrollView(
                child: Container(
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => getImage1(),
                                  child: Column(children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: _pickedImage1 != null
                                          ? ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                          child: Image.file(_pickedImage1!))
                                          : image1 != null
                                          ? ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(500),
                                        child: Image.network(
                                          image1!,
                                          errorBuilder: (context, error,
                                              stackTrace) {
                                            return CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                              Colors.white,
                                              child: Image.asset(
                                                "assets/gallery.png",
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                          : Image.asset(
                                        "assets/gallery.png",
                                      ),
                                    ),
                                    Text("image1")
                                  ]),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 160,
                                  child: TextFormField(
                                    controller: name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "Project name",
                                      labelStyle: TextStyle(
                                        color:MengoColors.mainOrange,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 160,
                                  child: TextFormField(
                                    controller: text,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "description",
                                      labelStyle: TextStyle(
                                        color: MengoColors.mainOrange,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 160,
                                  child: TextFormField(
                                    controller: link,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "Project link",
                                      labelStyle: TextStyle(
                                        color: MengoColors.mainOrange,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18)),
                                      primary: MengoColors.mainOrange,
                                    ),
                                    onPressed: _save7,
                                    child: Text('go next!..')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(
                    color: MengoColors.mainOrange,
                    width: 4,
                  )),
            ),
          ),
          Center(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 400, 0, 0),
                  child: Text("add new project to site"))),
          Center(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 500, 0, 0),
                  child: Text("Example"))),
        ],
      ),
    );
  }
}
