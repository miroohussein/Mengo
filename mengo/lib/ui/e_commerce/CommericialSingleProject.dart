import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';

import 'package:provider/provider.dart';
import 'ApiCollection.dart';
import 'finshPage.dart';

class SingleServiceECO extends StatefulWidget {
  const SingleServiceECO({Key? key}) : super(key: key);

  @override
  _SingleServiceECOState createState() => _SingleServiceECOState();
}

class _SingleServiceECOState extends State<SingleServiceECO> {
  TextEditingController text = TextEditingController();
  TextEditingController title = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image1;
  Color color = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
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

  Future<void> _save8() async {
    bool saved8 = Provider.of<ApiEco>(context, listen: false).addECO8;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved8 = await Provider.of<ApiEco>(context, listen: false).sendECO8(
        _pickedImage1!,
        title.text,
        text.text,
        color.toString(),
        color1.toString(),

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
      if (saved8) {
        qrDaialog('saved!', context, "Done", () {
          Get.to(() => const Finish(), transition: Transition.rightToLeft);
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
                    "Services",
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
              height: 450,
              child: Container(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Row(
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
                                    color: color,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "title",
                                    labelStyle: TextStyle(
                                      color: MengoColors.mainOrange,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18)),
                                    primary: color,
                                  ),
                                  onPressed: () => pickColor(context),
                                  child: Text('title color')),
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
                            Container(
                              width: 160,
                              child: TextFormField(
                                controller: text,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: color1,
                                ),
                                decoration: InputDecoration(
                                  labelText: "text",
                                  labelStyle: TextStyle(
                                    color: MengoColors.mainOrange,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  primary: color1,
                                ),
                                onPressed: () => pickColor1(context),
                                child: Text('text color')),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40,),
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
                                  onPressed: _save8,
                                  child: Text('go next!..')),
                            ],
                          ),
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
                  child: Text("add new service to site"))),
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

  Widget buildColorPicker() => ColorPicker(
    pickerColor: color,
    onColorChanged: (color) => setState(() => this.color = color),
  );

  Widget buildColorPicker1() => ColorPicker(
    pickerColor: color1,
    onColorChanged: (color) => setState(() => this.color1 = color),
  );

}
