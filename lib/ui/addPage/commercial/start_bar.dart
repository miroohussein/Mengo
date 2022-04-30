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
import 'about.dart';

class AddPageECO extends StatefulWidget {
  const AddPageECO({Key? key}) : super(key: key);

  @override
  _AddPageECOState createState() => _AddPageECOState();
}

class _AddPageECOState extends State<AddPageECO> {
  GetStorage getStorage = GetStorage();
  TextEditingController name = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image1;
  String? image2;
  Color color =MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  File? _pickedImage1;
  File? _pickedImage2;
  final ImagePicker _picker1 = ImagePicker();
  final ImagePicker _picker2 = ImagePicker();

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

  Future getImage2() async {
    final pickedFile = await _picker2.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage2 = File(pickedFile.path);
      } else {}
    });
  }

  Future<void> _save1() async {
    bool saved1 = Provider.of<ApiEco>(context, listen: false).addECO1;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved1 = await Provider.of<ApiEco>(context, listen: false).sendECO1(
        getStorage.read('id'),
        color.toString(),
        name.text,
        _pickedImage1!,
        _pickedImage2!,
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
      if (saved1) {
        qrDaialog('saved!', context, "Done", () {
         Get.to(() => const AboutECO(), transition: Transition.rightToLeft);
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
                left: 50,
              ),
              child: Text(
                "Top bar config",
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
              height: 400,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.fromLTRB(12, 150, 12, 0),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Row(

                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              InkWell(
                                onTap: () => getImage1(),
                                child: Column(children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: _pickedImage1 != null
                                        ? ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.file(_pickedImage1!))
                                        : image1 != null
                                        ? ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(500),
                                      child: Image.network(
                                        image1!,
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
                                        : Image.asset(
                                      "assets/gallery.png",
                                    ),
                                  ),
                                  Text("image1")
                                ]),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () => getImage2(),
                                child: Column(
                                    children:[ CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.white,
                                      child: _pickedImage2 != null
                                          ? ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.file(_pickedImage2!))
                                          : image2 != null
                                          ? ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(500),
                                        child: Image.network(
                                          image2!,
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
                                          : Image.asset(
                                        "assets/gallery.png",
                                      ),
                                    ),
                                      Text("image2")
                                    ]),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                            ]),
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
                                      labelText: "Site Name",
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
          Center(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 400, 0, 0),
                  child: Image.asset("assets/Exam1.png"))),
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

  Widget buildColorPicker() => ColorPicker(
        pickerColor: color,
        onColorChanged: (color) => setState(() => this.color = color),
      );
}
