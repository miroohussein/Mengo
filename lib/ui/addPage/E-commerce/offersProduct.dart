import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/building.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:provider/provider.dart';
import 'apiColiiection.dart';

class OffersProduct extends StatefulWidget {
  @override
  _OffersProductState createState() => _OffersProductState();
}

class _OffersProductState extends State<OffersProduct> {
  GetStorage getStorage = GetStorage();
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();
  TextEditingController text7 = TextEditingController();
  TextEditingController text8 = TextEditingController();
  TextEditingController text9 = TextEditingController();
  TextEditingController text0 = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  File? _pickedImage1;
  File? _pickedImage2;
  File? _pickedImage3;
  File? _pickedImage4;
  File? _pickedImage5;
  final ImagePicker _picker1 = ImagePicker();
  final ImagePicker _picker2 = ImagePicker();
  final ImagePicker _picker3 = ImagePicker();
  final ImagePicker _picker4 = ImagePicker();
  final ImagePicker _picker5 = ImagePicker();

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

  Future getImage3() async {
    final pickedFile = await _picker3.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage3 = File(pickedFile.path);
      } else {}
    });
  }

  Future getImage4() async {
    final pickedFile = await _picker4.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage4 = File(pickedFile.path);
      } else {}
    });
  }

  Future getImage5() async {
    final pickedFile = await _picker5.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage5 = File(pickedFile.path);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
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
                left: 10,
              ),
              child: Text(
                "Project Sections",
                style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 20),
              child: CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage("assets/gallery.png"),
              ),
            ),
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
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                  width: 380,
                  height: 600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: MengoColors.mainOrange,
                        width: 4,
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 2,
                            top: 20,
                          ),
                          child: Text(
                            "Single offers Product section:",
                            style: TextStyle(
                              color: MengoColors.mainOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text1,
                            decoration: InputDecoration(
                              labelText: "Enter name",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text2,
                            decoration: InputDecoration(
                              labelText: "Enter price",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () => getImage1(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 60,
                                  height: 60,
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
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        border: Border.all(
                                                          color: MengoColors
                                                              .mainOrange,
                                                          width: 4,
                                                        ),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/plus.jpg"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                              border: Border.all(
                                                color: MengoColors.mainOrange,
                                                width: 4,
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/plus.jpg"),
                                                  fit: BoxFit.cover),
                                            )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add image',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ],
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
                                  child: Text('Save')),
                            ],
                          ),
                        ),///////////////////////////////////request1///////////////////////////////
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 2,
                            top: 20,
                          ),
                          child: Text(
                            "Single sales Product section:",
                            style: TextStyle(
                              color: MengoColors.mainOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text3,
                            decoration: InputDecoration(
                              labelText: "Enter name",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text4,
                            decoration: InputDecoration(
                              labelText: "Enter price",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () => getImage2(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 60,
                                  height: 60,
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
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        border: Border.all(
                                                          color: MengoColors
                                                              .mainOrange,
                                                          width: 4,
                                                        ),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/plus.jpg"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                              border: Border.all(
                                                color: MengoColors.mainOrange,
                                                width: 4,
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/plus.jpg"),
                                                  fit: BoxFit.cover),
                                            )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add image',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ],
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
                                  onPressed: _save2,
                                  child: Text('Save')),
                            ],
                          ),
                        ),///////////////////////////////////request2///////////////////////////////
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 2,
                            top: 20,
                          ),
                          child: Text(
                            "Category one Product section:",
                            style: TextStyle(
                              color: MengoColors.mainOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text5,
                            decoration: InputDecoration(
                              labelText: "Enter name",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text6,
                            decoration: InputDecoration(
                              labelText: "Enter price",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () => getImage3(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  child: _pickedImage3 != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.file(_pickedImage3!))
                                      : image3 != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(500),
                                              child: Image.network(
                                                image3!,
                                                errorBuilder:
                                                    (context, error, stackTrace) {
                                                  return CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        border: Border.all(
                                                          color: MengoColors
                                                              .mainOrange,
                                                          width: 4,
                                                        ),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/plus.jpg"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                              border: Border.all(
                                                color: MengoColors.mainOrange,
                                                width: 4,
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/plus.jpg"),
                                                  fit: BoxFit.cover),
                                            )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add image',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ],
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
                                  child: Text('Save')),
                            ],
                          ),
                        ),///////////////////////////////////request3///////////////////////////////
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 2,
                            top: 20,
                          ),
                          child: Text(
                            "Category two Product section:",
                            style: TextStyle(
                              color: MengoColors.mainOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text7,
                            decoration: InputDecoration(
                              labelText: "Enter name",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text8,
                            decoration: InputDecoration(
                              labelText: "Enter price",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () => getImage4(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  child: _pickedImage4 != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.file(_pickedImage4!))
                                      : image4 != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(500),
                                              child: Image.network(
                                                image4!,
                                                errorBuilder:
                                                    (context, error, stackTrace) {
                                                  return CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        border: Border.all(
                                                          color: MengoColors
                                                              .mainOrange,
                                                          width: 4,
                                                        ),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/plus.jpg"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                              border: Border.all(
                                                color: MengoColors.mainOrange,
                                                width: 4,
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/plus.jpg"),
                                                  fit: BoxFit.cover),
                                            )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add image',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ],
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
                                  onPressed: _save4,
                                  child: Text('Save')),
                            ],
                          ),
                        ),///////////////////////////////////request4///////////////////////////////
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 2,
                            top: 20,
                          ),
                          child: Text(
                            "Category three Product section:",
                            style: TextStyle(
                              color: MengoColors.mainOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text9,
                            decoration: InputDecoration(
                              labelText: "Enter name",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text0,
                            decoration: InputDecoration(
                              labelText: "Enter price",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () => getImage5(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  child: _pickedImage5 != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.file(_pickedImage5!))
                                      : image5 != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(500),
                                              child: Image.network(
                                                image5!,
                                                errorBuilder:
                                                    (context, error, stackTrace) {
                                                  return CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                        border: Border.all(
                                                          color: MengoColors
                                                              .mainOrange,
                                                          width: 4,
                                                        ),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                "assets/plus.jpg"),
                                                            fit: BoxFit.cover),
                                                      )),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                              border: Border.all(
                                                color: MengoColors.mainOrange,
                                                width: 4,
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/plus.jpg"),
                                                  fit: BoxFit.cover),
                                            )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add image',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ],
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
                                  onPressed: _save5,
                                  child: Text('Finish')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _save1() async {
    bool saved1 = Provider.of<ApiEcoo>(context, listen: false).addC2;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved1 = await Provider.of<ApiEcoo>(context, listen: false).sendCO2(
        getStorage.read('id'),
        text1.text,
        text2.text,
        _pickedImage1!,
      );

      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on HttpExeptionEcoo catch (error) {
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
          Navigator.of(context).pop();
        });
      }
    }
  }

  Future<void> _save2() async {
    bool saved2 = Provider.of<ApiEcoo>(context, listen: false).addC3;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved2 = await Provider.of<ApiEcoo>(context, listen: false).sendCO3(
        getStorage.read('id'),
        text3.text,
        text4.text,
        _pickedImage2!,
      );

      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on HttpExeptionEcoo catch (error) {
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
          Navigator.of(context).pop();
        });
      }
    }
  }

  Future<void> _save3() async {
    bool saved3 = Provider.of<ApiEcoo>(context, listen: false).addC4;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved3 = await Provider.of<ApiEcoo>(context, listen: false).sendCO4(
        getStorage.read('id'),
        text5.text,
        text6.text,
        _pickedImage3!,
      );

      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on HttpExeptionEcoo catch (error) {
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
          Navigator.of(context).pop();
        });
      }
    }
  }

  Future<void> _save4() async {
    bool saved4 = Provider.of<ApiEcoo>(context, listen: false).addC5;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved4 = await Provider.of<ApiEcoo>(context, listen: false).sendCO5(
        getStorage.read('id'),
        text7.text,
        text8.text,
        _pickedImage4!,
      );

      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on HttpExeptionEcoo catch (error) {
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
          Navigator.of(context).pop();
        });
      }
    }
  }

  Future<void> _save5() async {
    bool saved5 = Provider.of<ApiEcoo>(context, listen: false).addC6;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved5 = await Provider.of<ApiEcoo>(context, listen: false).sendCO6(
        getStorage.read('id'),
        text9.text,
        text0.text,
        _pickedImage5!,
      );

      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on HttpExeptionEcoo catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("Check values or\nNo internet connection", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("Check values or\nNo internet connection", context);
    } finally {
      if (saved5) {
        qrDaialog('saved!', context, "Done", () {
          Get.to(() => const BuildingApp(), transition: Transition.rightToLeft);
        });
      }
    }
  }
}
