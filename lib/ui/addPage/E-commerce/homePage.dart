import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';

import 'package:provider/provider.dart';
import 'apiColiiection.dart';
import 'offersProduct.dart';

class HomePageE extends StatefulWidget {
  const HomePageE({Key? key}) : super(key: key);

  @override
  State<HomePageE> createState() => _HomePageEState();
}

class _HomePageEState extends State<HomePageE> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();
  TextEditingController text7 = TextEditingController();
  TextEditingController text8 = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image3;
  String? image4;
  String? image5;
  String? image6;
  String? image7;
  String? image8;
  String? image9;
  String? image0;
  Color color6 = MengoColors.mainOrange;
  Color color1 = MengoColors.mainOrange;
  Color color2 = MengoColors.mainOrange;
  Color color3 = MengoColors.mainOrange;
  Color color4 = MengoColors.mainOrange;
  Color color5 = MengoColors.mainOrange;
  File? _pickedImage3;
  File? _pickedImage4;
  File? _pickedImage5;
  File? _pickedImage6;
  File? _pickedImage7;
  File? _pickedImage8;
  File? _pickedImage9;
  File? _pickedImage0;
  final ImagePicker _picker3 = ImagePicker();
  final ImagePicker _picker4 = ImagePicker();
  final ImagePicker _picker5 = ImagePicker();
  final ImagePicker _picker6 = ImagePicker();
  final ImagePicker _picker7 = ImagePicker();
  final ImagePicker _picker8 = ImagePicker();
  final ImagePicker _picker9 = ImagePicker();
  final ImagePicker _picker0 = ImagePicker();
  GetStorage getStorage = GetStorage();

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

  Future getImage6() async {
    final pickedFile = await _picker6.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage6 = File(pickedFile.path);
      } else {}
    });
  }

  Future getImage7() async {
    final pickedFile = await _picker7.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage7 = File(pickedFile.path);
      } else {}
    });
  }

  Future getImage8() async {
    final pickedFile = await _picker8.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage8 = File(pickedFile.path);
      } else {}
    });
  }

  Future getImage9() async {
    final pickedFile = await _picker9.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage9 = File(pickedFile.path);
      } else {}
    });
  }

  Future getImage0() async {
    final pickedFile = await _picker0.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _pickedImage0 = File(pickedFile.path);
      } else {}
    });
  }

  Future<void> _save11() async {
    bool saved11 = Provider.of<ApiEcoo>(context, listen: false).addC1;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      saved11 = await Provider.of<ApiEcoo>(context, listen: false).sendCO1(
        getStorage.read('id'),
        text1.text,
        color6.toString(),
        _pickedImage3!,
        _pickedImage4!,
        _pickedImage5!,
        _pickedImage6!,
        _pickedImage7!,
        _pickedImage8!,
        _pickedImage9!,
        _pickedImage0!,
        text2.text,
        text3.text,
        text4.text,
        color1.toString(),
        text5.text,
        color2.toString(),
        color3.toString(),
        text6.text,
        color4.toString(),
        color5.toString(),
        text7.text,
        text8.text,
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
      if (saved11) {
        qrDaialog('saved!', context, "Done", () {
          Get.to(() => OffersProduct(), transition: Transition.rightToLeft);
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
                "Home Page",
                style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 50),
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
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
              width: 380,
              height: size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(
                    color: MengoColors.mainOrange,
                    width: 4,
                  )),
              child: SingleChildScrollView(
                child: Form(
                  key: _key,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: text1,
                            decoration: InputDecoration(
                              labelText: "Enter site name",
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
                              labelText: "Enter category 1",
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
                            controller: text3,
                            decoration: InputDecoration(
                              labelText: "Enter category 2",
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
                              labelText: "Enter category 3",
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
                            controller: text5,
                            decoration: InputDecoration(
                              labelText: "Enter site description",
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
                              labelText: "Enter footer text",
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
                            controller: text7,
                            decoration: InputDecoration(
                              labelText: "Enter footer address",
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
                              labelText: "Enter footer email",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child:
                                                    Image.file(_pickedImage3!))
                                            : image3 != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500),
                                                    child: Image.network(
                                                      image3!,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: MengoColors
                                                                    .mainOrange,
                                                                width: 4,
                                                              ),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/plus.jpg"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            )),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Add category 1 image',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
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
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child:
                                                    Image.file(_pickedImage4!))
                                            : image4 != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500),
                                                    child: Image.network(
                                                      image4!,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: MengoColors
                                                                    .mainOrange,
                                                                width: 4,
                                                              ),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/plus.jpg"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            )),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Add category 2 image',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child:
                                                    Image.file(_pickedImage5!))
                                            : image5 != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500),
                                                    child: Image.network(
                                                      image5!,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: MengoColors
                                                                    .mainOrange,
                                                                width: 4,
                                                              ),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/plus.jpg"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            )),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Add category 3 image',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () => getImage6(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: _pickedImage6 != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child:
                                                    Image.file(_pickedImage6!))
                                            : image6 != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500),
                                                    child: Image.network(
                                                      image6!,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: MengoColors
                                                                    .mainOrange,
                                                                width: 4,
                                                              ),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/plus.jpg"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            )),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '  Add offers image      ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () => getImage7(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: _pickedImage7 != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child:
                                                    Image.file(_pickedImage7!))
                                            : image7 != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500),
                                                    child: Image.network(
                                                      image7!,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: MengoColors
                                                                    .mainOrange,
                                                                width: 4,
                                                              ),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/plus.jpg"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            )),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '    Add sales image   ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () => getImage8(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: _pickedImage8 != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child:
                                                    Image.file(_pickedImage8!))
                                            : image8 != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500),
                                                    child: Image.network(
                                                      image8!,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: MengoColors
                                                                    .mainOrange,
                                                                width: 4,
                                                              ),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/plus.jpg"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            )),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Add first home image',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () => getImage9(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: _pickedImage9 != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child:
                                                    Image.file(_pickedImage9!))
                                            : image9 != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500),
                                                    child: Image.network(
                                                      image9!,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: MengoColors
                                                                    .mainOrange,
                                                                width: 4,
                                                              ),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/plus.jpg"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            )),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '   Add second home image   ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () => getImage0(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: _pickedImage0 != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child:
                                                    Image.file(_pickedImage0!))
                                            : image0 != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            500),
                                                    child: Image.network(
                                                      image0!,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: MengoColors
                                                                    .mainOrange,
                                                                width: 4,
                                                              ),
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/plus.jpg"),
                                                                  fit: BoxFit
                                                                      .cover),
                                                            )),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '  Add about image      ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  primary: color6,
                                ),
                                onPressed: () => pickColor6(context),
                                child: Text('   NavBar title color   ')),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  primary: color1,
                                ),
                                onPressed: () => pickColor1(context),
                                child: Text('  About title color   ')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  primary: color2,
                                ),
                                onPressed: () => pickColor2(context),
                                child: Text('Categories titles color')),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  primary: color3,
                                ),
                                onPressed: () => pickColor3(context),
                                child: Text(' footer titles color ')),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    primary: color4,
                                  ),
                                  onPressed: () => pickColor4(context),
                                  child: Text(' footer address color ')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    primary: color5,
                                  ),
                                  onPressed: () => pickColor5(context),
                                  child: Text('  footer email color  ')),
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
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    primary: MengoColors.mainOrange,
                                  ),
                                  onPressed: _save11,
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
          ),
        ],
      ),
    );
  }

  void pickColor6(BuildContext context) => showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
            child: AlertDialog(
              title: Text('Pick Your Color'),
              content: Column(children: [
                buildColorPicker6(),
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

  Widget buildColorPicker6() => ColorPicker(
        pickerColor: color6,
        onColorChanged: (color) => setState(() => this.color6 = color),
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
