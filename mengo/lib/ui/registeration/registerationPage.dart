import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/login/login.dart';
import 'package:mengo/ui/profile/profile.dart';
import 'package:mengo/ui/userModel/userModel.dart';


Future<RegistrationModel> createRegistration(String name,String number,String email,String password) async {

  final response = await http.post(
    Uri.parse("https://mengo1.online/application/"),

    body: jsonEncode(<String, dynamic>{
      'full name': name,
      'phone number': number,
      'email': email,
      'password':password,
    }),
  );

  if (response.statusCode == 201) {

    return RegistrationModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
class RegistrationModel {
  final String name;
  final String number;
  final String email;
  final String password;


  RegistrationModel({required this.name, required this.number, required this.email, required this.password});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      name: json['full name'],
      number: json['phone number'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationState();
}
// Future<UserModel> createUserModel(String title) async {

//   final response = await http.post(
//     Uri.parse('http://mengo1.online/application/'),
//
//     body: jsonEncode(<String, String>{
//       // 'name':name,
//       // 'phone':phone,
//       // 'email':email,
//       // 'password':password,
//     }),
//   );
//
//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return UserModel.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }

class _RegistrationState extends State<Registration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<RegistrationModel>? _futureModel;
  // final formKey=GlobalKey<FormState>();
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
            {  Navigator.pop(context, MaterialPageRoute(builder: (context)=>Login())); },
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
                          TextField(
                            controller: nameController,
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
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          //Company name

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
                          TextField(
                            controller: numberController,
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
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          //user E-mail
                          TextField(
                            controller: emailController,
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
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          //Password
                          TextField(
                            controller: passwordController,
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
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          //Confirm Password
                          TextField(
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                                    (_futureModel == null) ? setState(() {
                                     String email=emailController.text;
                                     String password=passwordController.text;
                                     String number= numberController.text;
                                     String name=nameController.text;
                                     _futureModel = createRegistration(nameController.text,numberController.text,emailController.text,passwordController.text,);
                                   })
                                        : buildFutureBuilder();


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
    );

  }
  FutureBuilder<RegistrationModel> buildFutureBuilder() {
    return FutureBuilder<RegistrationModel>(
      future: _futureModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children:[
              Text(snapshot.data!.name),
          Text(snapshot.data!.number),
          Text(snapshot.data!.email),
          Text(snapshot.data!.password,),]
        );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
