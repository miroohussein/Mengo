import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool passwordVisibility = true;
    bool passwordVisifbilityConfirm = true;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              color: MengoColors.white,
              width: size.width,
              height: size.height,
              child: Image.asset(
                "assets/Splash-screen-light.png",
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
                      margin: EdgeInsets.only(top: 15),
                      width: 175.0,
                      height: 85.0,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
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
                          TextField(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: MengoColors.mainColorLight,
                                      width: 2.0),
                                ),
                                labelText: "Company Name",
                                labelStyle: TextStyle(
                                  color: MengoColors.mainColorLight,
                                )),

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
                          TextField(
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
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: MengoColors.mainColorLight,
                                      width: 2.0),
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: MengoColors.mainColorLight,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: MengoColors.mainColorLight,
                                  ),
                                  iconSize: 18.0,
                                  onPressed: () {
                                    setState(() {
                                      passwordVisibility = !passwordVisibility;
                                    });
                                  },
                                )),
                            obscureText: passwordVisibility,
                            keyboardType: TextInputType.visiblePassword,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisifbilityConfirm
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: MengoColors.mainColorLight,
                                  ),
                                  iconSize: 18.0,
                                  onPressed: () {
                                    setState(() {
                                      passwordVisifbilityConfirm =
                                      !passwordVisifbilityConfirm;
                                    });
                                  },
                                )),
                            obscureText: passwordVisifbilityConfirm,
                            keyboardType: TextInputType.visiblePassword,
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
                                  onPressed: (){},
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
}
