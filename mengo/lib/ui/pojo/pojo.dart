import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mengo/api/loginApi.dart';
import 'package:mengo/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:mengo/models/loginModel.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:mengo/ui/registeration/registerationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool password_visible = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
      body: Stack(
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

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    suffixIcon: Icon(Icons.email),
                    labelStyle: TextStyle(
                      color: MengoColors.mainOrange,
                      fontSize: 17,
                    ),),
                ),


                TextField(
                  controller: passController,
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
                              onPressed: () async{
                                Profile();
                                String email=emailController.text;
                                String password=passController.text;

                              },
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
    );
  }
  void login()async{

    if (passController.text.isNotEmpty&& emailController.text.isNotEmpty){
      var response = await http.post(Uri.parse("http://mengo1.online/application/"),
          body:({
        'email': emailController.text,
        'password': passController.text,

    }));

      if(response.statusCode==200){
        final body=jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Token:${body['token']}")));
        pageRoute(body['token']);

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid Credential.")));
      {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("blank field not allowed")));
    }
  }
    print(emailController);
}}
void pageRoute(String token)async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("login", token);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => Registration()));
}
}