import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mengo/colors/colors.dart';



class NewProject extends StatefulWidget {


  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
  int _value=0;
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
        title: Padding(
          padding: const EdgeInsets.only(right: 80,),
          child: Center(child: Text("New Project",style: TextStyle(color: MengoColors.mainOrange,fontSize: 27),)),
        ),
      ),
      body:
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage("assets/mainBackground.png"),fit: BoxFit.cover),
            ),),
          Padding(
            padding: const EdgeInsets.only(bottom: 95),
            child: Container(
              margin: const EdgeInsets.fromLTRB(85, 0, 0, 500),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage("assets/logo.png"),),
              ),),
          ),
          Center(child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.only(bottom: 50,),
              child: Container(

                margin: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                width: 300,height: 450,
                decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 2.5,)

                ),
                child:Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(border: Border.all(width:2,color: MengoColors.mainOrange),borderRadius: BorderRadius.circular(20),),
                          child: Image.asset(
                            "assets/dog.png",fit: BoxFit.cover,
                          ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,),
                      child: Text("First",style: TextStyle(fontSize: 20,color: MengoColors.mainOrange),),
                    ),
                      Container(width: 80,height: 1,color: Colors.grey,),

                       Padding(
                         padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                         child: TextField(
                          decoration: InputDecoration(

                                fillColor: MengoColors.mainOrange,
                            labelText: "ID",

                            labelStyle: TextStyle(

                              color: MengoColors.mainOrange,
                              fontSize: 20,

                            ),),
                      ),
                       ),
                    Row(
                      children: [
                        Radio(value: 1, groupValue: _value, onChanged:(value){setState(() {
                           value=_value;
                        });},
                        ),
                        SizedBox(width: 10,),
                        Text("Admob ads")
                      ],

                    ),
                    Row(
                      children: [
                        Radio(value: 2, groupValue: _value, onChanged:(value){setState(() {
                           value=_value;
                        });},
                        ),
                        SizedBox(width: 10,),
                        Text("Facebook ads")
                      ],

                    ),

                          ],
    ),
    ),
            ),  ),),],
    ),

    );
  }


}
