import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mengo/api/auth.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:mengo/ui/registeration/registerationPage.dart';
import 'package:provider/provider.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  bool password_visible = true;
  bool hidePassword = true;
  bool isApiCallProcess = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> _submit() async {
    bool auth = Provider.of<Auth>(context, listen: false).loggedIn;
    if (!key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      auth = await Provider.of<Auth>(context, listen: false)
          .signIn(email.text, password.text);
    } on HttpExeption catch (error) {
      Navigator.of(context).pop();
      showErrorDaialog("this user not found pleas sign up", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog('$error', context);
    } finally {
      if (auth) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>Profile()),
              (Route<dynamic> route) => false,
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MengoColors.white,
        leading: IconButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: MengoColors.mainOrange,
            )),
      ),
      body: Form(
        key: key,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/loginBackground.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 70, 0, 30),
                width: 300,
                height: 400,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add_to_home_screen,
                          color: MengoColors.mainOrange,
                        ),
                      ),
                      Text(
                        "Sign in",
                        style:
                        TextStyle(color: MengoColors.mainOrange, fontSize: 20),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (input) => !input!.contains('@')
                            ? "Email Id should be valid"
                            : null,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          suffixIcon: Icon(Icons.email),
                          labelStyle: TextStyle(
                            color: MengoColors.mainOrange,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: password,
                        validator: (input) => input!.length < 3
                            ? "Password should be more than 3 characters"
                            : null,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: MengoColors.mainOrange,
                            fontSize: 17,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(password_visible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                password_visible = !password_visible;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: password_visible,
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: MaterialButton(
                                    color: MengoColors.mainOrange,
                                    onPressed: _submit,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text(
                                      "  Sign in    ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ]),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You don't have an account?",
                            style: TextStyle(color: MengoColors.mainOrange),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registration()));
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: MengoColors.mainOrange,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(
                    color: MengoColors.mainOrange,
                    width: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = key.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
