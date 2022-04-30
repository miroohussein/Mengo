import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/addPage/portfolio/skills.dart';
import 'package:provider/provider.dart';

import 'ApiCollection2.dart';


class Xp extends StatefulWidget {
  const Xp({Key? key}) : super(key: key);

  @override
  _XpState createState() => _XpState();
}

class _XpState extends State<Xp> {
  GetStorage getStorage = GetStorage();
  TextEditingController title1 = TextEditingController();
  TextEditingController title2 = TextEditingController();
  TextEditingController title4 = TextEditingController();
  TextEditingController title3 = TextEditingController();
  TextEditingController body1 = TextEditingController();
  TextEditingController body2 = TextEditingController();
  TextEditingController body3 = TextEditingController();
  TextEditingController body4 = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Color color = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 = MengoColors.mainOrange;
  Color color3 = MengoColors.mainOrange;
  Color color4 = MengoColors.mainOrange;

  Future<void> _save3() async {
    bool saved3 = Provider.of<ApiP1>(context, listen: false).add3;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved3 = await Provider.of<ApiP1>(context, listen: false).send3(
          getStorage.read('id'),
          color.toString(),
          color1.toString(),
          color2.toString(),
          color3.toString(),
          color4.toString(),
          title1.text,
          title2.text,
          title3.text,
          title4.text,
          body1.text,
          body2.text,
          body3.text,
          body4.text);

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
      if (saved3) {
        qrDaialog('saved!', context, "Done", () {
          Get.to(() => const Skills(), transition: Transition.rightToLeft);
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
                "experience",
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
                  padding: EdgeInsets.fromLTRB(0,130,0,0),
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
                                  child: Text('xp back color')),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: color1,
                                  ),
                                  onPressed: () => pickColor1(context),
                                  child: Text('xp title color')),
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
                                    primary: color2,
                                  ),
                                  onPressed: () => pickColor2(context),
                                  child: Text('titles color')),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: color3,
                                  ),
                                  onPressed: () => pickColor3(context),
                                  child: Text('text color')),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(160,10,0,10),
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
                                  child: Text('icons color')),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 140,
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
                                  width: 140,
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
                              ]
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8,8,8,8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 140,
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
                                Spacer(),
                                Container(
                                  width: 140,
                                  child: TextFormField(
                                    controller: title4,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "title 4",
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
                                Container(
                                  width: 140,
                                  child: TextFormField(
                                    controller: body1,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "body 1",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 140,
                                  child: TextFormField(
                                    controller: body2,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "body 2",
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
                                Container(
                                  width: 140,
                                  child: TextFormField(
                                    controller: body3,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "body 3",
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 140,
                                  child: TextFormField(
                                    controller: body4,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "body 4",
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
                          padding:EdgeInsets.fromLTRB(170,8,8,8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: MengoColors.mainOrange,
                                  ),
                                  onPressed: _save3,
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
}
