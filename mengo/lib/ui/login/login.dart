
import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool password_visible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor:MengoColors.white,
        leading: IconButton(

        onPressed: ()
    { },
    icon: Icon(
    Icons.arrow_back_ios,
    color: MengoColors.mainOrange,
    )),

        ),
      body: Stack(
          children: [
      Container(
      decoration: BoxDecoration(
      image:DecorationImage(image: AssetImage("assets/loginBackground.png"),fit: BoxFit.cover),
    ),),
          Center(
            child: Container(
    margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
    width: 300,height: 400,
    decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,),


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
                    child: Icon(Icons.add_to_home_screen, color: MengoColors.mainOrange,),
                  ),
                  Text("Sign in",style: TextStyle( color: MengoColors.mainOrange ,fontSize: 20),
                  ),

                     TextField(
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        suffixIcon: Icon(Icons.email),
                        labelStyle: TextStyle(
                          color: MengoColors.mainOrange ,
                          fontSize: 17,
                        ),),
                    ),


                     TextField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: MengoColors.mainOrange ,
                          fontSize: 17,

                        ),
                        suffixIcon: IconButton( icon:Icon(password_visible?Icons.visibility:Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              password_visible=! password_visible;

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
                        children:<Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: MaterialButton(

                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                color: Colors.white,
                                onPressed:(){},
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side:BorderSide(color: MengoColors.mainOrange,),),
                                child: Text("previous",style: TextStyle( color: MengoColors.mainOrange ,),)
                            ),
                          ),


                             Container(
                               margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: MaterialButton(

                                  color: MengoColors.mainOrange ,
                                  onPressed:(){},
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  child: Text("  Next    ",style: TextStyle(color: Colors.white,),textAlign:TextAlign.center,)
                              ),
                            ),


                        ]

                    ),),

                  Row(
                    mainAxisAlignment:MainAxisAlignment.center ,

                    children: [


                      Text("You don't have an account?",style:TextStyle(color: MengoColors.mainOrange),),


                      TextButton(onPressed: (){} , child: Text("Sign up",style: TextStyle(color: MengoColors.mainOrange,fontSize:15,fontWeight: FontWeight.bold),)),

                    ],
                  ),



                ],








              ),
            )



          ],
      ),
    );
  }
}
