import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/api/auth.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/login/login.dart';

import 'package:provider/provider.dart';



class Registration extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> _submit() async {
    bool auth = Provider
        .of<Auth>(context, listen: false)
        .loggedIn;
    if (!key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      auth = await Provider.of<Auth>(context, listen: false)
          .register(name.text, phone.text, email.text, password.text);
      // ignore: unused_catch_clause
    } on HttpExeption catch (error) {
      Navigator.of(context).pop();
      showErrorDaialog("already have account", context);
    } catch (error) {
      Navigator.of(context).pop();
      showErrorDaialog('$error', context);
    } finally {
      if (auth) {
        print("sucsses");
        Get.to(() => Login(), transition: Transition.rightToLeft);
      }
    }
  }

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text("Registration",
              style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),),
          )),
          backgroundColor: Colors.white,
          leading: IconButton(

              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false,
                );
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: MengoColors.mainOrange,
              )),),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              color: MengoColors.white,
              width: size.width,
              height: size.height,
              child: Image.asset(
                "assets/loginBackground.png",
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Form(
                key: key,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        alignment: AlignmentDirectional.center,
                        margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: MengoColors.mainColorLight,
                              blurRadius: 20.0,
                              // offset: Offset(1, 1)
                            )
                          ],
                          color: MengoColors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: MengoColors.mainColorLight,
                              width: 5.0,
                              style: BorderStyle.solid),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 18,
                            ),
                            Icon(Icons.account_circle_outlined,
                              color: MengoColors.mainColorLight, size: 35,),
                            SizedBox(
                              height: 18,
                            ),
                            //user full name
                            TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MengoColors.mainColorLight,
                                        width: 2.0),
                                  ),
                                  labelText: "Full Name",
                                  labelStyle: TextStyle(
                                    color: MengoColors.mainColorLight,
                                  )),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter name";
                                }
                                return null;
                              },
                              onSaved: (String? name) {},
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            //Company name
                            TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MengoColors.mainColorLight,
                                        width: 2.0),
                                  ),
                                  labelText: "company Name",
                                  labelStyle: TextStyle(
                                    color: MengoColors.mainColorLight,
                                  )),
                              validator: (String?value) {
                                if (value!.isEmpty) {
                                  return "Please enter company";
                                }
                                return null;
                              },
                              onSaved: (String? company) {},
                            ),
                            SizedBox(
                              height: 18,),
                            TextFormField(
                              controller: phone,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MengoColors.mainColorLight,
                                        width: 2.0),
                                  ),
                                  labelText: "Phone Number",
                                  labelStyle: TextStyle(
                                    color: MengoColors.mainColorLight,
                                  )),
                              keyboardType: TextInputType.phone,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter  phone";
                                }
                                if (value.length < 9) {
                                  return "Please enter valid phone";
                                }
                                return null;
                              },
                              onSaved: (String ?phone) {},
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            //user E-mail
                            TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MengoColors.mainColorLight,
                                        width: 2.0),
                                  ),
                                  labelText: "E-mail",
                                  labelStyle: TextStyle(
                                    color: MengoColors.mainColorLight,
                                  )),
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter  email";
                                }
                                if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return "Please enter valid email";
                                }
                                return null;
                              },
                              onSaved: (String? email) {},
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            //Password
                            TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: MengoColors.mainColorLight,
                                      width: 2.0),
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: MengoColors.mainColorLight,
                                  // ignore: dead_code
                                ),
                                suffixIcon: IconButton(icon: Icon(
                                    passwordVisible ? Icons.visibility : Icons
                                        .visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    }
                                    );
                                  },
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: passwordVisible,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              controller: confirmPassword,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: MengoColors.mainColorLight,
                                      width: 2.0),
                                ),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                  color: MengoColors.mainColorLight,
                                ),
                                suffixIcon: IconButton(icon: Icon(
                                    passwordVisible ? Icons.visibility : Icons
                                        .visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    }
                                    );
                                  },
                                ),),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: passwordVisible,
                              validator: (String ?value) {
                                if (value!.isEmpty) {
                                  return "Please enter re-password";
                                }
                                if (password.text != confirmPassword.text) {
                                  return "Password Do not match";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            //Buttons
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  MaterialButton(
                                    elevation: 0.0,
                                    minWidth: 40,
                                    padding: EdgeInsets.fromLTRB(
                                        40.0, 10.0, 40.0, 10.0),
                                    color: MengoColors.white,
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login()),
                                            (Route<dynamic> route) => false,
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: MengoColors.mainColorLight
                                        ),
                                        borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: Text("Sign in", style: TextStyle(
                                        color: MengoColors.mainColorLight),),
                                  ),
                                  MaterialButton(

                                    elevation: 0.0,
                                    minWidth: 40,
                                    padding: EdgeInsets.fromLTRB(
                                        50.0, 10.0, 50.0, 10.0),
                                    color: MengoColors.mainColorLight,
                                    onPressed: _submit,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: Text("Sign Up ! ", style: TextStyle(
                                        color: MengoColors.white),),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            // Scaffold(
            //
            // )
          ],
        ),
      ),
    );
  }
// ignore: non_constant_identifier_names
//   Future <http.Response> RegistrationUser()  async{
//     // url to registration php script
//     var APIURL = "https://mengo1.online/application/";
//     Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
//     final msg = jsonEncode({
//       'name' : 'register',
//       'param': {
//         'name': '$_name',
//         'phone': '$_phone',
//         'email': '$_email',
//         'password': '$_password'
//       }
//
//     });
//     //json maping user entered details
//     Map mapeddate =
//     {
//       'name' : 'register',
//        'param': {
//               'name': '$_name',
//               'phone': '$_phone',
//               'email': '$_email',
//               'password': '$_password'
//         }
//
//     };
//     var body = jsonEncode(mapeddate);
//     //send  data using http post to our php code
//     var response = await http.post(Uri.parse(APIURL),headers: headers,
//         body: jsonEncode(msg)
//         );
//     var data = jsonDecode(response.body);
//     print("DATA: ${data}");
//     print(msg);
//     return response;
//   }
// }
}
