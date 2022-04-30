import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:provider/provider.dart';
import 'ApiCollection.dart';
import 'addCommericialSingleService.dart';

class FooterECO extends StatefulWidget {
  const FooterECO({Key? key}) : super(key: key);

  @override
  _FooterECOState createState() => _FooterECOState();
}

class _FooterECOState extends State<FooterECO> {
  GetStorage getStorage = GetStorage();
  TextEditingController url = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController text = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Color color = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 =MengoColors.mainOrange;
  Color color3 = MengoColors.mainOrange;
  Color color4 = MengoColors.mainOrange;
  Color color5 = MengoColors.mainOrange;

  Future<void> _save6() async {
    bool saved6 = Provider.of<ApiEco>(context, listen: false).addECO6;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved6 = await Provider.of<ApiEco>(context, listen: false).sendECO6(
        getStorage.read('id'),
        url.text,
        color.toString(),
        title.text,
        color1.toString(),
        text.text,
        color2.toString(),
        color3.toString(),
        color4.toString(),
        color5.toString(),
        address.text,
        email.text,
      );
      print(saved6);
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
      if (saved6) {
        print("done");
        qrDaialog('saved!', context, "Done", () {
           Get.to(() => const SingleProjectECO(), transition: Transition.rightToLeft);
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
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 250),
              width: 350,
              height: 500,
              child: SingleChildScrollView(
                child: Container(
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 160,
                                child: TextFormField(
                                  controller: url,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "your location url",
                                    labelStyle: TextStyle(
                                      color:MengoColors.mainOrange,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5,top: 20),
                                  child: ElevatedButton(

                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                        primary: color,
                                      ),
                                      onPressed: () => pickColor(context),
                                      child: Text('background color')),
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
                                  child: Text('name color')),
                              Spacer(),
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
                                    labelText: "name",
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
                                    primary: color2,
                                  ),
                                  onPressed: () => pickColor2(context),
                                  child: Text('text')),
                              Spacer(),
                              Container(
                                width: 160,
                                child: TextFormField(
                                  controller: text,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color2,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "text",
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
                                  child: Text('about color')),
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
                                    primary: color4,
                                  ),
                                  onPressed: () => pickColor4(context),
                                  child: Text('address color')),
                              Spacer(),
                              Container(
                                width: 160,
                                child: TextFormField(
                                  controller: address,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color4,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "address",
                                    labelStyle: TextStyle(
                                      color: color4,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                    primary: color5,
                                  ),
                                  onPressed: () => pickColor5(context),
                                  child: Text('email')),
                              Spacer(),
                              Container(
                                width: 160,
                                child: TextFormField(
                                  controller: email,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color5,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "email",
                                    labelStyle: TextStyle(
                                      color: color5,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: MengoColors.mainOrange,
                                  ),
                                  onPressed: _save6,
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
                  margin: const EdgeInsets.fromLTRB(0, 425, 0, 0),
                  child: Image.asset("assets/Exam6.png"))),
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
