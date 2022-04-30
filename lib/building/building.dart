import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/api/auth.dart';

import 'package:mengo/colors/colors.dart';
import 'package:mengo/ui/myProjects/ProjectModel.dart';
import 'package:provider/provider.dart';

import 'dialogs.dart';

class BuildingApp extends StatefulWidget {
  const BuildingApp({Key? key}) : super(key: key);

  @override
  _BuildingAppState createState() => _BuildingAppState();
}

class _BuildingAppState extends State<BuildingApp> {
  GetStorage getStorage = GetStorage();
  GetStorage storage2 = GetStorage();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Future<void> _request() async {
    bool auth = Provider.of<Auth>(context, listen: false).getApk;
    if (!key.currentState!.validate()) {
      return;
    }
    showDaialogLoader(context);
    try {
      auth = await Provider.of<Auth>(context, listen: false).requestApk(

        getStorage.read('id'),
      );
      // ignore: unused_catch_clause
    } on HttpExeption catch (error) {
      Navigator.of(context).pop();
      showErrorDaialog("Error send request", context);
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      showErrorDaialog('Error send request', context);
    } finally {
      if (auth) {
        qrDaialog("We will send the apk \nlink to your email", context, "Done", () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => ProjectView()
              ),
              ModalRoute.withName("/Home")
          );
          storage2.write(
            'id',
            null,
          );
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MengoColors.white,
            title: Center(
              child: Text(
                ' Building New Project',
                style: TextStyle(
                    color: MengoColors.mainColorLight, fontWeight: FontWeight.bold),
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: MengoColors.mainColorLight,
                )),
            actions: [
              Container(
                  padding: EdgeInsets.all(5),
                  width: 60,
                  height: 15,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.cover,
                  ))
            ],
          ),
          body: Stack(
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
                Form(
                  key: key,
                  child: Center(child: SingleChildScrollView(

                    child: Container(

                      margin: const EdgeInsets.fromLTRB(0, 100, 0, 60),
                      width: 320,height: 500,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.white,border: Border.all(color:MengoColors.mainOrange,width: 4,)

                      ),
                      child: Column(
                        children: [
                          Center(child: Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 30),
                            child: Text('Build',style: TextStyle(color: MengoColors.mainOrange,fontSize: 35,fontWeight: FontWeight.bold,),),
                          )),
                        Container(
                          width: 150,
                          height: 140,
                          child: CircleAvatar(backgroundColor:MengoColors.mainOrange, radius: 50,
                              child:CircleAvatar(
                                  backgroundColor:Colors.white,
                                backgroundImage:AssetImage("assets/hammer-icon.png") ,
                                radius: 58,
                              )  ,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40,bottom: 60,),
                          child: Text('Building download APK file',style: TextStyle(color: MengoColors.mainOrange,fontSize: 20,fontWeight: FontWeight.bold,),),
                        ),
                          Center(
                            child: InkWell(
                              onTap: _request,
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: MengoColors.mainOrange,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("Request Send Apk",style: TextStyle(fontSize: 20,color: Colors.white),)),
                              ),
                            ),
                          )

                  ]  ),
                  ),
                  ),),
                )]),
              ),
        );
  }
}
