import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/myProjects/ProjectModel.dart';
import 'package:mengo/ui/newProject/sender.dart';
import 'package:provider/provider.dart';


class NewProject extends StatefulWidget {
  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? image1;
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
  String _value = '1';

  Future<void> _send() async {
    bool sended = Provider.of<Sender>(context, listen: false).sendType;
    if (!_key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    print(sended);
    try {
      sended = await Provider.of<Sender>(context, listen: false).send(
        nameController.text,
        _value,
        _pickedImage1!,
      );
      print(nameController.text);
      print(_value);
      print(_pickedImage1!);
      Navigator.of(context).pop();
      // ignore: unused_catch_clause
    } on HttpExeptionSender catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("$error", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("$error", context);
    } finally {
      if (sended) {
        print(_value);
          // if (_value == "1"){
          //   Get.to(() => const AddPage(), transition: Transition.rightToLeft);
          // }
          // if (_value == "2"){
          //   Get.to(() => const AddPageECO(), transition: Transition.rightToLeft);
          // }
          // if (_value == 3){
          //   Get.to(() => const AddPage(), transition: Transition.rightToLeft);
          // }
        Get.to(() => ProjectView(), transition: Transition.rightToLeft);
        }
    }
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
        title: Padding(
          padding: const EdgeInsets.only(
            right: 80,
          ),
          child: Center(
              child: Text(
            "New Project",
            style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),
          )),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50,
                  ),
                  child: Form(
                    key: _key,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                      width: 300,
                      height: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: MengoColors.mainOrange,
                            width: 2.5,
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: MengoColors.mainOrange),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: InkWell(
                                  onTap: () => getImage1(),
                                  child: Column(children: [
                                    CircleAvatar(
                                      radius: 80,
                                      backgroundColor: Colors.white,
                                      child: _pickedImage1 != null
                                          ? ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          child: Image.file(_pickedImage1!))
                                          : image1 != null
                                          ? ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(50),
                                        child: Image.network(
                                          image1!,
                                          errorBuilder: (context, error,
                                              stackTrace) {
                                            return CircleAvatar(
                                              radius: 50,
                                              backgroundColor:
                                              Colors.white,
                                              child: Image.asset(
                                                "assets/dog.png",
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                          : Image.asset(
                                        "assets/dog.png",
                                      ),
                                    ),
                                    Text("logo")
                                  ]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0,
                                left: 70,
                                right: 70,
                                bottom: 0,
                              ),
                              child: Center(
                                  child: TextFormField(
                                    controller: nameController,
                                decoration: InputDecoration(
                                  hintText: "name",
                                ),
                                style: TextStyle(
                                    fontSize: 20, color: MengoColors.mainOrange),
                              )),
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: Text("Project type"),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: '1',
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value.toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Portfolio")
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: '2',
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value.toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Commercial")
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: '3',
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value.toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("E-commerce")
                              ],
                            ),
                            Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)),
                                    primary: MengoColors.mainOrange,
                                  ),
                                  onPressed: _send,
                                  child: Text('go next!..')),
                            )
                          ],
                        ),
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
}
