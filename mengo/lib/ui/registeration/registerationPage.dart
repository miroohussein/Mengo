import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/login/login.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:mengo/ui/userModel/userModel.dart';



class Registration extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool passwordVisible=true;
  // late String _password, _confirmPassword;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var doRegister=() {
    //   print('on doRegister');
    //   final form = formKey.currentState;
    //   if (form!.validate()) {
    //     formKey.currentState!.save();
    //     print('username');
    //     print('password');
    //
    //
    //     if (_password.endsWith(_confirmPassword)) {
    //
    //     } else {
    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar( content:Text("mismatch password")));}
    //     }
    //
    //   else {
    //    ScaffoldMessenger.of(context).showSnackBar(SnackBar( content:Text("invalid form")));}
    //   };


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text("Registration",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),),
          )),
          backgroundColor: Colors.white,
          leading: IconButton(

              onPressed: ()
              {   },
              icon: Icon(
                Icons.arrow_back_ios,
                color: MengoColors.mainOrange,
              )),),
        body: Form(
          key: _formkey,
          child: Stack(
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
                              color: MengoColors.mainColorLight, width: 5.0, style: BorderStyle.solid),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 18,
                            ),
                            Icon(Icons.account_circle_outlined, color: MengoColors.mainColorLight, size: 35,),
                            SizedBox(
                              height: 18,
                            ),
                            //user full name
                            TextFormField(
                              controller: _name,
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
                              validator: (String? value){
                                if(value!.isEmpty)
                                {
                                  return "Please enter name";
                                }
                                return null;
                              },
                              onSaved: (String? name){
                              },
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
                              validator: (String?value){
                                if(value!.isEmpty)
                                {
                                  return "Please enter company";
                                }
                                return null;
                              },
                              onSaved: (String? company){
                              },
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            // TextField(
                            //   decoration: InputDecoration(
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color: MengoColors.mainColorLight,
                            //             width: 2.0),
                            //       ),
                            //       labelText: "Address",
                            //       labelStyle: TextStyle(
                            //         color: MengoColors.mainColorLight,
                            //       )),
                            //   keyboardType: TextInputType.streetAddress,
                            // ),
                            // SizedBox(
                            //   height: 18,
                            // ),
                            //user phone Number
                            TextFormField(
                              controller: _phone,
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
                              validator: (String? value){
                                if(value!.isEmpty)
                                {
                                  return "Please enter  phone";
                                }
                                if(value.length < 9)
                                {
                                  return "Please enter valid phone";
                                }
                                return null;
                              },
                              onSaved: (String ?phone){
                              },
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            //user E-mail
                            TextFormField(
                              controller: _email,
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
                              validator: (String? value){
                                if(value!.isEmpty)
                                {
                                  return "Please enter  email";
                                }
                                if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                                {
                                  return "Please enter valid email";
                                }
                                return null;
                              },
                              onSaved: (String? email){
                              },
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            //Password
                            TextFormField(
                              controller: _password,
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
                                ),  suffixIcon: IconButton( icon:Icon(passwordVisible?Icons.visibility:Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible= ! passwordVisible;

                                  }
                                  );
                                },




                              ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: passwordVisible,
                              validator: (String ?value){
                                if(value!.isEmpty)
                                {
                                  return "Please enter password";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            //Confirm Password
                            TextFormField(
                              controller: _confirmpassword,
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
                                suffixIcon: IconButton( icon:Icon(passwordVisible?Icons.visibility:Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible=!passwordVisible;

                                    }
                                    );

                                  },




                                ),),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: passwordVisible,
                              validator: (String ?value){
                                if(value!.isEmpty)
                                {
                                  return "Please enter re-password";
                                }
                                if(_password.text != _confirmpassword.text)
                                {
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  MaterialButton(
                                    elevation: 0.0,
                                    minWidth:40,
                                    padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                                    color: MengoColors.white,
                                    onPressed: (){},
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: MengoColors.mainColorLight
                                        ),
                                        borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: Text("Previous", style: TextStyle( color: MengoColors.mainColorLight),),
                                  ),
                                  MaterialButton(

                                    elevation: 0.0,
                                    minWidth: 40,
                                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                                    color: MengoColors.mainColorLight,
                                    onPressed: (){

                                      if(_formkey.currentState!.validate())

                                      {


                                        print("Successful");
                                      }else
                                      {
                                        print("Unsuccessfull");
                                      }



                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: Text("Next ", style: TextStyle( color: MengoColors.white),),
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
              )
              // Scaffold(
              //
              // )
            ],
          ),
        ),
      ),
    );

  }
  // ignore: non_constant_identifier_names
  Future RegistrationUser()  async{
    // url to registration php script
    var APIURL = "https://mengo1.online/application/";
    //json maping user entered details
    Map mapeddate ={
      'name':_name.text,
      'email':_email.text,
      'phone':_phone.text,
      'password':_password.text
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapeddate );
    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    print("DATA: ${data}");
  }
}

