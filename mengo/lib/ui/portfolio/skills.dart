import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/portfolio/projects.dart';
import 'package:provider/provider.dart';

import 'ApiCollection2.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  TextEditingController skillsTitle = TextEditingController();
  TextEditingController title1 = TextEditingController();
  TextEditingController title2 = TextEditingController();
  TextEditingController title3 = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image1;
  String? image2;
  String? image3;
  Color color = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 = MengoColors.mainOrange;
  File? _pickedImage1;
  File? _pickedImage2;
  File? _pickedImage3;
  final ImagePicker _picker1 = ImagePicker();
  final ImagePicker _picker2 = ImagePicker();
  final ImagePicker _picker3 = ImagePicker();
  Future getImage1() async {
    final _pickedFile = await _picker1.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (_pickedFile != null) {
        _pickedImage1 = File(_pickedFile.path);
      } else {}
    });
  }
  Future getImage2() async {
    final _pickedFile = await _picker2.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (_pickedFile != null) {
        _pickedImage2 = File(_pickedFile.path);
      } else {}
    });
  }
  Future getImage3() async {
    final _pickedFile = await _picker3.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (_pickedFile != null) {
        _pickedImage3 = File(_pickedFile.path);
      } else {}
    });
  }

  Future<void> _save4() async {
    bool saved4 = Provider.of<ApiP1>(context, listen: false).add4;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved4 = await Provider.of<ApiP1>(context, listen: false).send4(
          color.toString(),
        skillsTitle.text,
          color1.toString(),
          color2.toString(),
          title1.text,
          title2.text,
          title3.text,
        _pickedImage1!,
        _pickedImage2!,
        _pickedImage3!,

      );
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
      if (saved4) {
        qrDaialog('saved!', context, "Done", () {
          Get.to(() => const Projects(), transition: Transition.rightToLeft);
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
                    "Skills",
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
              width: 390,
              height: 700,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0,30,0,0),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5,0,5,0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: color,
                                  ),
                                  onPressed: () => pickColor(context),
                                  child: Text('Skills color')),
                              Spacer(),
                              Container(
                                width: 140,
                                child: TextFormField(
                                  controller: skillsTitle,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Skills",
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5,0,5,0),
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
                                  child: Text('icons color')),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: color2,
                                  ),
                                  onPressed: () => pickColor2(context),
                                  child: Text('text color')),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    controller: title1,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "title 1",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    controller: title2,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "title 2",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    controller: title3,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "title 3",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                InkWell(
                                  onTap: () => getImage1(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: _pickedImage1 != null
                                        ? ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.file(_pickedImage1!))
                                        : image1 != null
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(500),
                                      child: Image.network(
                                        image1!,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                              "assets/logo.png",
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                        : Image.asset(
                                      "assets/logo.png",
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () => getImage2(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: _pickedImage2 != null
                                        ? ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.file(_pickedImage2!))
                                        : image2 != null
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(500),
                                      child: Image.network(
                                        image2!,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                              "assets/logo.png",
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                        : Image.asset(
                                      "assets/logo.png",
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () => getImage3(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: _pickedImage3 != null
                                        ? ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.file(_pickedImage3!))
                                        : image3 != null
                                        ? ClipRRect(
                                      borderRadius: BorderRadius.circular(500),
                                      child: Image.network(
                                        image3!,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                              "assets/logo.png",
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                        : Image.asset(
                                      "assets/logo.png",
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.fromLTRB(160,148,8,8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: MengoColors.mainOrange,
                                  ),
                                  onPressed: _save4,
                                  child: Text('go next!..')),
                            ],
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

  Widget buildColorPicker() =>
    ColorPicker(
      pickerColor: color,
      onColorChanged: (color) => setState(() => this.color = color),

  );

  Widget buildColorPicker1() =>
    ColorPicker(
      pickerColor: color1,
      onColorChanged: (color) => setState(() => this.color1 = color),

  );

  Widget buildColorPicker2() =>
     ColorPicker(
      pickerColor: color2,
      onColorChanged: (color) => setState(() => this.color2 = color),

  );

}
