import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';

import 'package:provider/provider.dart';

import 'ApiCollection2.dart';
import 'xp_section.dart';
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  GetStorage getStorage = GetStorage();
  TextEditingController subtitle = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController url = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image;
  Color color = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 = MengoColors.mainOrange;
  Color color3 = MengoColors.mainOrange;
  Color color4 = MengoColors.mainOrange;
  Color color5 = MengoColors.mainOrange;
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage = File(pickedFile.path);
      } else {}
    });
  }

  Future<void> _save1() async {
    bool saved1 = Provider.of<ApiP1>(context, listen: false).add2;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved1 = await Provider.of<ApiP1>(context, listen: false).send2(
          getStorage.read('id'),
          color1.toString(),
          color.toString(),
          subtitle.text,
          color2.toString(),
          body.text,
          color3.toString(),
          _pickedImage!,
          color4.toString(),
          url.text,
          color5.toString());

      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on HttpExeptionP1 catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("Check values or\nNo internet connection", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("Check values or\nNo internet connection", context);
    } finally {
      if (saved1) {
        qrDaialog('saved!', context, "Done", () {
          Get.to(()=>const Xp(),transition: Transition.rightToLeft);

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
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: MengoColors.mainOrange,
            )),
        title: Row(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(
                left: 50,
              ),
              child: Text(
                "About me section",
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
                margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                width: 360,
                height: 600,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                    child: Form(
                      key: _key,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () => getImage(),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                child: _pickedImage != null
                                    ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(_pickedImage!))
                                    : image != null
                                    ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    image!,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: Image.asset(
                                          "assets/gallery.png",
                                        ),
                                      );
                                    },
                                  ),
                                )
                                    : Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                  "assets/gallery.png",
                                ),
                                    ),
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                        primary: color1,
                                      ),
                                      onPressed: () => pickColor1(context),
                                      child: Text('About color')),
                                  Spacer(),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                        primary: color,
                                      ),
                                      onPressed: () => pickColor(context),
                                      child: Text('Title color')),
                                  SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(

                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                        primary: color2,
                                      ),
                                      onPressed: () => pickColor2(context),
                                      child: Text('Subtitle color')),
                                  SizedBox(
                                    width: 30,
                                  ),

                                  Container(

                                      width: 150,
                                      child: TextFormField(
                                        controller: subtitle,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: color2,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: "Subtitle",
                                          labelStyle: TextStyle(
                                            color: color2,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),

                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                        primary: color3,
                                      ),
                                      onPressed: () => pickColor3(context),
                                      child: Text('Body color')),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                    width: 160,
                                    child: TextFormField(
                                      controller: body,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: color3,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "Body",
                                        labelStyle: TextStyle(
                                          color: color3,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                        primary: color4,
                                      ),
                                      onPressed: () => pickColor4(context),
                                      child: Text('Portfolio button color')),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 200,
                              child: TextFormField(
                                controller: url,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: color5,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Portfolio Url",
                                  labelStyle: TextStyle(
                                    color: color5,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                        primary: color5,
                                      ),
                                      onPressed: () => pickColor5(context),
                                      child: Text('Portfolio Text color')),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(150, 0, 15, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                        primary: MengoColors.mainOrange,
                                      ),
                                      onPressed: _save1,
                                      child: Text('go next!..')),
                                ],
                              ),
                            ),
                          ],
                        ),
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

  void pickColor3(BuildContext context) => showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
              title: Text('Pick Your Color'),
              content: Column(children: [
                buildColorPicker3(),
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

  void pickColor4(BuildContext context) => showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
              title: Text('Pick Your Color'),
              content: Column(children: [
                buildColorPicker4(),
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

  void pickColor5(BuildContext context) => showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
              title: Text('Pick Your Color'),
              content: Column(children: [
                buildColorPicker5(),
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

  Widget buildColorPicker3() => ColorPicker(
        pickerColor: color3,
        onColorChanged: (color) => setState(() => this.color3 = color),
      );

  Widget buildColorPicker4() => ColorPicker(
        pickerColor: color4,
        onColorChanged: (color) => setState(() => this.color4 = color),
      );

  Widget buildColorPicker5() => ColorPicker(
        pickerColor: color5,
        onColorChanged: (color) => setState(() => this.color5 = color),
      );
}
