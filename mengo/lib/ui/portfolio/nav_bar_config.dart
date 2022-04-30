import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:provider/provider.dart';
import 'ApiCollection2.dart';
import 'about_section.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController name = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController body = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image;
  Color color =MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 = MengoColors.mainOrange;
  Color color3 =MengoColors.mainOrange;
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
    bool saved1 = Provider.of<ApiP1>(context, listen: false).add1;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved1 = await Provider.of<ApiP1>(context, listen: false).send1(
          name.text,
          color.toString(),
          title.text,
          color1.toString(),
          subtitle.text,
          color3.toString(),
          body.text,
          color3.toString(),
          _pickedImage!);

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
          Get.to(()=>const About(),transition: Transition.rightToLeft);
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
                "top bar config",
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
              width: size.width,
              height: 900,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.fromLTRB(12, 150, 12, 0),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => getImage(),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: _pickedImage != null
                                ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.file(_pickedImage!))
                                : image != null
                                ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                image!,
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      "assets/person.png",
                                    ),
                                  );
                                },
                              ),
                            )
                                : Image.asset(
                              "assets/person.png",
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
                                    primary: color,
                                  ),
                                  onPressed: () => pickColor(context),
                                  child: Text('Pick color')),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                width: 200,
                                child: TextFormField(
                                  controller: name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "name",
                                    labelStyle: TextStyle(
                                      color: color,
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
                                    primary: color1,
                                  ),
                                  onPressed: () => pickColor1(context),
                                  child: Text('Pick color')),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                width: 200,
                                child: TextFormField(
                                  controller: title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color1,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "title",
                                    labelStyle: TextStyle(
                                      color: color1,
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
                                    primary: color2,
                                  ),
                                  onPressed: () => pickColor2(context),
                                  child: Text('Pick color')),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                width: 200,
                                child: TextFormField(
                                  controller: subtitle,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color2,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "subtitle",
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
                                  child: Text('Pick color')),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                width: 200,
                                child: TextFormField(
                                  controller: body,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color3,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "text body",
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
                        SizedBox(height: 10,),
                        Container(
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
}
