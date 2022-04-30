import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mengo/api/auth.dart';
import 'package:mengo/building/dialogs.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:provider/provider.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> _submit() async {
    bool auth = Provider.of<Auth>(context, listen: false).resetPasswordDone;
    if (!key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      auth = await Provider.of<Auth>(context, listen: false).resetPassword(
        password.text,
      );
      // ignore: unused_catch_clause
    } on HttpExeption catch (error) {
      Navigator.of(context).pop();
      showErrorDaialog("user not founded", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog('No internet connection', context);
    } finally {
      if (auth) {
        qrDaialog("Your data has been changed!", context, "Done", () {
          Navigator.of(context).pop();
        });
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
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => Profile()));
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
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                width: 300,
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: MengoColors.mainOrange, width: 2.5)),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                        width: 200,
                        child: TextFormField(
                          validator: (val) {
                            if (val!.length <= 5) {
                              return 'please enter valid password';
                            } else if (val.isEmpty) {
                              return 'Required!';
                            }
                            return null;
                          },
                          controller: password,
                          decoration: InputDecoration(
                            labelText: "New password!",
                            labelStyle: TextStyle(
                              color: MengoColors.mainOrange,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          validator: (val) {
                            if (val != password.text) {
                              return 'password dose not match';
                            }
                            return null;
                          },
                          controller: confirmPassword,
                          decoration: InputDecoration(
                            labelText: "Confirm password",
                            labelStyle: TextStyle(
                              color: MengoColors.mainOrange,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: MaterialButton(
                            color: MengoColors.mainOrange,
                            onPressed: _submit,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              " Reset Password!  ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
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
