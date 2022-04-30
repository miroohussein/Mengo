import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';

import 'package:provider/provider.dart';

import 'ApiCollection.dart';
import 'CommericialServices.dart';
class AboutECO extends StatefulWidget {
  const AboutECO({Key? key}) : super(key: key);

  @override
  _AboutECOState createState() => _AboutECOState();
}

class _AboutECOState extends State<AboutECO> {
  GetStorage getStorage = GetStorage();
  TextEditingController title = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image1;
  Color color = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 = MengoColors.mainOrange;
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

  Future<void> _save2() async {
    bool saved2 = Provider.of<ApiEco>(context, listen: false).addECO2;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved2 = await Provider.of<ApiEco>(context, listen: false).sendECO2(
        getStorage.read('id'),
        color.toString(),
        color1.toString(),
        color2.toString(),
        title.text,
        _pickedImage1!,
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
      if (saved2) {
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
            onPressed: () {Navigator.of(context).pop();},
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
                    "about",
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
              height: 500,
              child: Container(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
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
                            children: [
                              Container(
                                width: 160,
                                child: TextFormField(
                                  controller: title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color2,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "about text",
                                    labelStyle: TextStyle(
                                      color: MengoColors.mainOrange,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 50,top: 20,),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(18)),
                                      primary: color2,
                                    ),
                                    onPressed: () => pickColor2(context),
                                    child: Text('text color')),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  primary: color,
                                ),
                                onPressed: () => pickColor(context),
                                child: Text('Background Color')),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  primary: color1,
                                ),
                                onPressed: () => pickColor1(context),
                                child: Text('Background Color')),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40,),
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
                                onPressed: _save2,
                                child: Text('go next!..')),
                          ],
                        ),
                      ),
                    ],
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
                  child: Image.asset("assets/Exam2.png"))),
          Center(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 500, 0, 0),
                  child: Text("Example"))),
        ],
      ),
    );
  }

  void pickColor(BuildContext context) => showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          title: Text('Pick Your Color'),
          content: Column(children: [
            buildColorPicker(),
            TextButton(
              child: Text(
                'SELECT',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ]),
        ),
      ));

  void pickColor1(BuildContext context) => showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          title: Text('Pick Your Color'),
          content: Column(children: [
            buildColorPicker1(),
            TextButton(
              child: Text(
                'SELECT',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ]),
        ),
      ));

  void pickColor2(BuildContext context) => showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          title: Text('Pick Your Color'),
          content: Column(children: [
            buildColorPicker2(),
            TextButton(
              child: Text(
                'SELECT',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ]),
        ),
      ));

  Widget buildColorPicker() => ColorPicker(
    pickerColor: color,
    onColorChanged: (color) => setState(() => this.color = color),
  );

  Widget buildColorPicker1() => ColorPicker(
    pickerColor: color1,
    onColorChanged: (color) => setState(() => this.color1 = color),
  );

  Widget buildColorPicker2() => ColorPicker(
    pickerColor: color2,
    onColorChanged: (color) => setState(() => this.color2 = color),
  );
}
