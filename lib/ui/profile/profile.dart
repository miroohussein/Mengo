import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:mengo/api/auth.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/login/login.dart';
import 'package:mengo/ui/myProjects/ProjectModel.dart';
import 'package:mengo/ui/packages/packages.dart';
import 'package:mengo/ui/password/password.dart';
import 'package:mengo/ui/profile/profileProvider.dart';
import 'package:mengo/ui/subscriptions/subscriptions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? packageId;
  GetStorage storage = GetStorage();
  late Future<List<ProfileData>> profileObject;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController company = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool loader = false;
  ProfileData? profile;
  String? image;
  File? _fileimage;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _fileimage = File(pickedFile.path);
      } else {}
    });
  }

  Future<void> _submit() async {
    bool auth = Provider
        .of<Auth>(context, listen: false)
        .doneSent;
    if (!key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      auth = await Provider.of<Auth>(context, listen: false)
          .updateProfile(name.text, email.text, company.text);
      Navigator.of(context).pop();
    } on HttpExeption catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("No internet connection", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog('$error', context);
    } finally {
      if (auth) {
        futureO().then((value) =>
            qrDaialog('Your data has been changed!', context, "Done", () {
              Navigator.of(context).pop();
            }));
      }
    }
  }
  _navLogout(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Login()
        ),
        ModalRoute.withName("/Home")
    );
    storage.write(
      'info',
     null,
    );
  }

  Future<void> _submit1() async {
    bool auth = Provider
        .of<Auth>(context, listen: false)
        .doneSentPhoto;
    showDaialogLoader(context);
    try {
      auth = await Provider.of<Auth>(context, listen: false)
          .updatePhoto(_fileimage!);
      Navigator.of(context).pop();
    } on HttpExeption catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog("No internet connection", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog('No internet connection', context);
    } finally {
      if (auth) {
        futureO().then((value) =>
            qrDaialog('Your data has been changed!', context, "Done", () {
              Navigator.of(context).pop();
            }));
      }
    }
  }

  Future<void> futureO() async {
    setState(() {
      loader = true;
    });

    try {
      profile = (await Provider.of<ProfileProvider>(context, listen: false)
          .fetchData());
      name.text = profile!.name!;
      email.text = profile!.email!;
      company.text = profile!.company!;
      image = profile!.profileImage;
      packageId = profile!.packageId as String?;
      setState(() {
        loader = false;
      });
    } catch (error) {
      setState(() {
        loader = false;
      });
      throw (error);
    }
  }

  @override
  void initState() {
    futureO();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MengoColors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
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
                  "Profile",
                  style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),
                )),
          ),
        ),
        body: loader
            ? Center(child: CircularProgressIndicator())
            : Stack(
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
                  margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  width: 400,
                  height: 750,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: MengoColors.mainOrange, width: 2.5)),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (builder) => bottomSheet(),
                            );
                          },
                          child: Container(
                              child: imageProfile()),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: MaterialButton(
                              color: MengoColors.mainOrange,
                              onPressed: _submit1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "   update photo   ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: 300,
                          child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              labelText: "Your name",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: TextFormField(
                            controller: company,
                            decoration: InputDecoration(
                              labelText: "Your Company",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: "Your Email",
                              labelStyle: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: MaterialButton(
                              color: MengoColors.mainOrange,
                              onPressed: _submit,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "   update profile   ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          child: MaterialButton(
                              color: MengoColors.mainOrange,
                              onPressed: () {
                                Get.to(() => Subscriptions(), transition: Transition.rightToLeft);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                " Subscribe  ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          child: MaterialButton(
                              color: MengoColors.mainOrange,
                              onPressed: ()=>_showToast(context),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "  About us  ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          child: MaterialButton(
                              color: MengoColors.mainOrange,
                              onPressed: () {
                                _navLogout();
                                _showToast2(context);
                                logoutUser();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "   Log out   ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          child: MaterialButton(
                              color: MengoColors.mainOrange,
                              onPressed: () {
                                Get.to(() => Password());
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "   change password   ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                 MaterialButton(
                                    color: MengoColors.mainOrange,
                                    onPressed: ()=>_showToast(context),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Text(
                                      "   Arabic   ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              SizedBox(width: 20,),
                              MaterialButton(
                                  color: MengoColors.mainOrange,
                                  onPressed: ()=>_showToast(context),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Text(
                                    "   English  ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ),
                        ),
                        MaterialButton(
                            color: MengoColors.mainOrange,
                            onPressed: () {
                              if(packageId != "0"){
                                Get.to(() => ProjectView(), transition: Transition.rightToLeft);
                              }else{
                                print(packageId);
                                qrDaialog('you are not subscribed \n Choose package first', context, "error", () {
                                  Navigator.of(context).pop();
                                });
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10)),
                            child: Text(
                              "    My projects   ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                  ),
              ),
            ),
          ],
        ),
    );
  }
  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) =>Login()),
          (Route<dynamic> route) => false,
    );
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Soon'),
        action: SnackBarAction(label: 'ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _showToast2(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Logged out'),
        action: SnackBarAction(label: 'ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            child: _fileimage != null
                ? ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.file(_fileimage!))
                : image != null
                ? ClipRRect(
              borderRadius:
              BorderRadius.circular(500),
              child: Image.network(
                image!,
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
          Positioned(
            bottom: 5,
            right: 10,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (builder) => bottomSheet(),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: MengoColors.mainOrange,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 150,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () => getImage(),
                icon: Icon(Icons.camera),
                label: Text("Camera"),
              ),
              FlatButton.icon(
                onPressed: () => getImage(),
                icon: Icon(Icons.image),
                label: Text("gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
