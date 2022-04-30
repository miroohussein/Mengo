import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/e_commerce/finshPage.dart';
import 'package:provider/provider.dart';

import 'ApiCollection2.dart';
class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  TextEditingController footerBody = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Color color = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 = MengoColors.mainOrange;
  Color color3 = MengoColors.mainOrange;
  Future<void> _save6() async {
    bool saved6 = Provider.of<ApiP1>(context, listen: false).add6;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved6= await Provider.of<ApiP1>(context, listen: false).send6(
        footerBody.text,
        color.toString(),
        color1.toString(),
        color2.toString(),
        color3.toString(),
        name.text,
        address.text,
        email.text,
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
      if (saved6) {
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
                    "Footer",
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

           Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
              width: 390,
              height: 400,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0,30,0,0),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5,0,5,15),
                          child: Row(

                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: color,
                                  ),
                                  onPressed: () => pickColor(context),
                                  child: Text('footer body color')),
                              Spacer(),
                              Container(
                                width: 120,
                                child: TextFormField(
                                  controller: footerBody,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "footer body",
                                    labelStyle: TextStyle(
                                      color: MengoColors.mainOrange,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
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
                                    controller: name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: color1,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "your name",
                                      labelStyle: TextStyle(
                                        color: color1,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    controller: address,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: color2,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "your address",
                                      labelStyle: TextStyle(
                                        color: color2,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    controller: email,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: color3,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: "your email",
                                      labelStyle: TextStyle(
                                        color: color3,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8,28,8,8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18)),
                                      primary: color1,
                                    ),
                                    onPressed: () => pickColor1(context),
                                    child: Text('name color')),
                                Spacer(),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18)),
                                      primary: color2,
                                    ),
                                    onPressed: () => pickColor2(context),
                                    child: Text('address color')),
                                Spacer(),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18)),
                                      primary: color3,
                                    ),
                                    onPressed: () => pickColor3(context),
                                    child: Text('email color')),
                              ]
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.fromLTRB(145,18,8,8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: MengoColors.mainOrange,
                                  ),
                                  onPressed: _save6,
                                  child: Text('  go next!..  ')),
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
