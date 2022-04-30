import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';

import 'package:provider/provider.dart';

import 'ApiCollection.dart';
import 'CommericialProjects.dart';

class ServiceECO extends StatefulWidget {
  const ServiceECO({Key? key}) : super(key: key);

  @override
  _ServiceECOState createState() => _ServiceECOState();
}

class _ServiceECOState extends State<ServiceECO> {
  TextEditingController title = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Color color = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 = MengoColors.mainOrange;
  Color color3 = MengoColors.mainOrange;

  Future<void> _save3() async {
    bool saved3 = Provider.of<ApiEco>(context, listen: false).addECO3;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved3 = await Provider.of<ApiEco>(context, listen: false).sendECO3(
        color.toString(),
        color1.toString(),
        title.text,
        color2.toString(),
        color3.toString(),

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
      if (saved3) {
        qrDaialog('saved!', context, "Done", () {
          Get.to(() => const ProjectsECO(), transition: Transition.rightToLeft);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
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
              height: 400,
              child: Container(
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 160,
                                child: TextFormField(
                                  controller: title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color1,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "    Text   ",
                                    labelStyle: TextStyle(
                                      color: color1,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 18,
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
                                child: Text('  Text color  ')),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
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
                                child: Text('Title Color')),
                          ],
                        ),
                      ),
                      SizedBox(height: 18,),
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
                                  primary: color2,
                                ),
                                onPressed: () => pickColor2(context),
                                child: Text('more button color')),
                          ],
                        ),
                      ),
                      SizedBox(height: 18,),
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
                                  primary: color3,
                                ),
                                onPressed: () => pickColor3(context),
                                child: Text('button text color')),
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
                                onPressed: _save3,
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
                  margin: const EdgeInsets.fromLTRB(0, 425, 0, 0),
                  child: Image.asset("assets/Exam3.png"))),
          Center(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 435, 0, 0),
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
