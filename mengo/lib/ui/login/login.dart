import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mengo/api/loginApi.dart';
import 'package:mengo/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:mengo/models/loginModel.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:mengo/ui/registeration/registerationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool password_visible = true;
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel(email: '',password: '');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: MengoColors.white,
        leading: IconButton(

            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: MengoColors.mainOrange,
            )),

      ),
      body: Form(
        key: globalFormKey,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/loginBackground.png"),
                    fit: BoxFit.cover),
              ),),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                width: 300, height: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: MengoColors.mainOrange, width: 4,),


                ),

              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 70, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_to_home_screen, color: MengoColors.mainOrange,),
                  ),
                  Text("Sign in",
                    style: TextStyle(color: MengoColors.mainOrange, fontSize: 20),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (input) => loginRequestModel.email = input!,
                    validator: (input) => !input!.contains('@')
                        ? "Email Id should be valid"
                        : null,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      suffixIcon: Icon(Icons.email),
                      labelStyle: TextStyle(
                        color: MengoColors.mainOrange,
                        fontSize: 17,
                      ),),
                  ),


                  TextFormField(
                    onSaved: (input) =>
                    loginRequestModel.password = input!,
                    validator: (input) => input!.length < 3
                        ? "Password should be more than 3 characters"
                        : null,
                    decoration: InputDecoration(

                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: MengoColors.mainOrange,
                        fontSize: 17,

                      ),
                      suffixIcon: IconButton(icon: Icon(
                          password_visible ? Icons.visibility : Icons
                              .visibility_off),
                        onPressed: () {
                          setState(() {
                            password_visible = !password_visible;
                          }
                          );
                        },


                      ),

                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: password_visible,
                  ),

                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: MaterialButton(

                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                color: Colors.white,
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: MengoColors.mainOrange,),),
                                child: Text("previous", style: TextStyle(
                                  color: MengoColors.mainOrange,),)
                            ),
                          ),


                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: MaterialButton(

                                color: MengoColors.mainOrange,
                                onPressed: () {
                                  if (validateAndSave()) {
                                    print(loginRequestModel.toJson());

                                    setState(() {
                                      isApiCallProcess = true;
                                    });

                                    APIService apiService = new APIService();
                                    apiService.login(loginRequestModel).then((value) {
                                      if (value != null) {
                                        setState(() {
                                          isApiCallProcess = false;
                                        });

                                        if (value.token.isNotEmpty) {
                                          final snackBar = SnackBar(
                                              content: Text("Login Successful"));
                                          scaffoldKey.currentState!
                                              // ignore: deprecated_member_use
                                              .showSnackBar(snackBar);
                                        } else {
                                          final snackBar =
                                          SnackBar(content: Text(''));
                                          scaffoldKey.currentState!
                                              // ignore: deprecated_member_use
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    });
                                  }
                                          } ,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("  Next    ", style: TextStyle(
                                  color: Colors.white,), textAlign: TextAlign
                                    .center,)
                            ),
                          ),


                        ]

                    ),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [


                      Text("You don't have an account?",
                        style: TextStyle(color: MengoColors.mainOrange),),


                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => Registration()));
                      },
                          child: Text("Sign up", style: TextStyle(
                              color: MengoColors.mainOrange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),)),

                    ],
                  ),


                ],


              ),
            )


          ],
        ),
      ),
    );
  }
//   Future<LoginModel>(String email,String password) async{
//     if (passController.text.isNotEmpty&& emailController.text.isNotEmpty){
//       var response = await http.post(Uri.parse("http://mengo1.online/application/"),
//           body:({
//         'email': email,
//         'password': password,
//
//     }));
//           var data =response.body;
//     print(data);
//       if(response.statusCode==201){
//        return LoginModel.fromJson(jsonDecode(response.body));
//       }
//     else
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar( content:Text("invalid Credintial.")));
//
//     else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("black field not allowed")));
//
//   }
//     print(emailController);
// }}
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}