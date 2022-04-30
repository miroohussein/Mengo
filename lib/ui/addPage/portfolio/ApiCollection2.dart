import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/api/dio.dart';

class ApiP1 with ChangeNotifier {
  bool add1 = false;
  bool add2 = false;
  bool add3 = false;
  bool add4 = false;
  bool add5 = false;
  bool add6 = false;
  late String? token;
  late String? name;
  late String? email;
  late String? phone;
  late int id;
  late String? image;

  Future<bool> send1(
      String id,
      String name,
      String ColorName,
      String title,
      String ColorTitle,
      String Subtitle,
      String ColorSubtitle,
      String TextBody,
      String ColorBody,
      File image,) async {

    GetStorage getStorage = GetStorage();
    final oldColor = ColorName.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor.replaceAll(")", "");

    final oldColor2 = ColorTitle.replaceAll("Color(0xff", "#");
    final newColor2= oldColor2.replaceAll(")", "");

    final oldColor3 = ColorSubtitle.replaceAll("Color(0xff", "#");
    final newColor3 = oldColor3.replaceAll(")", "");

    final oldColor4 = ColorBody.replaceAll("Color(0xff", "#");
    final newColor4 = oldColor4.replaceAll(")", "");

    var imageServer;
    if (image != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path
            .split('/')
            .last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updatePortfolioStart.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "app_name": "$name",
          "navbar_color": "$newColor1",
          "start_title": "$title",
          "start_title_color": "$newColor2",
          "start_subtitle": "$Subtitle",
          "start_subtitle_color": "$newColor3",
          "start_body": "$TextBody",
          "start_body_color": "$newColor4",
          "start_image": imageServer
        }),
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
        ),
      );
      print(getStorage.read('info')['token']);
      print(response.data);
      if (response.data['status'] == 400) {
        add1 = false;
        throw HttpExeptionP1('error');
      }
      if (response.data['response']['status'] == '200') {
        add1 = true;
        print(add1);
        print(id);
      }
      notifyListeners();
      return add1;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send2(
      String id,
      String aboutColor,
      String titleColor,
      String subtitle,
      String subtitleColor,
      String body,
      String bodyColor,
      File image,
      String ButtonColor,
      String url,
      String PortfolioColor) async {
    GetStorage getStorage = GetStorage();
    final oldColor = aboutColor.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor.replaceAll(")", "");

    final oldColor2 = titleColor.replaceAll("Color(0xff", "#");
    final newColor2= oldColor2.replaceAll(")", "");

    final oldColor3 = subtitleColor.replaceAll("Color(0xff", "#");
    final newColor3 = oldColor3.replaceAll(")", "");

    final oldColor4 = bodyColor.replaceAll("Color(0xff", "#");
    final newColor4 = oldColor4.replaceAll(")", "");

    final oldColor5 = ButtonColor.replaceAll("Color(0xff", "#");
    final newColor5 = oldColor5.replaceAll(")", "");

    final oldColor6 = PortfolioColor.replaceAll("Color(0xff", "#");
    final newColor6 = oldColor6.replaceAll(")", "");

    var imageServer;
    if (image != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path
            .split('/')
            .last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updatePortfolioAbout.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "about_color": "$newColor1",
          "title_color": "$newColor2",
          "subtitle": "$subtitle",
          "subtitle_color": "$newColor3",
          "body": "$body",
          "body_color": "$newColor4",
          "image": imageServer,
          "portfolio_button_color": "$newColor5",
          "portfolio_url": "$url",
          "portfolio_text_color": "$newColor6"
        }),
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
        ),
      );
      print(getStorage.read('info')['token']);
      print(response.data);
      if (response.data['response']['status'] == '400') {
        add2 = false;
        throw HttpExeptionP1('error');
      }
      if (response.data['response']['status'] == '200') {
        add2 = true;
        print(add2);
        print(id);
      }
      notifyListeners();
      return add2;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send3(
      String id,
      String XPBColor,
      String XPTColor,
      String titlesColor,
      String textColor,
      String iconsColor,
      String t1,
      String t2,
      String t3,
      String t4,
      String b1,
      String b2,
      String b3,
      String b4) async {
    GetStorage getStorage = GetStorage();
    final oldColor = XPBColor.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor.replaceAll(")", "");

    final oldColor2 = XPTColor.replaceAll("Color(0xff", "#");
    final newColor2= oldColor2.replaceAll(")", "");

    final oldColor3 = titlesColor.replaceAll("Color(0xff", "#");
    final newColor3 = oldColor3.replaceAll(")", "");

    final oldColor4 = textColor.replaceAll("Color(0xff", "#");
    final newColor4 = oldColor4.replaceAll(")", "");

    final oldColor5 = iconsColor.replaceAll("Color(0xff", "#");
    final newColor5 = oldColor5.replaceAll(")", "");


    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateportfolioExperince.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "experience_background": "$newColor1",
          "experience_title_color": "$newColor2",
          "titles_color": "$newColor3",
          "text_color": "$newColor4",
          "icons_color": "$newColor5",
          "title1": "$t1",
          "title2": "$t2",
          "title3": "$t3",
          "title4": "$t4",
          "body1": "$b1",
          "body2": "$b2",
          "body3": "$b3",
          "body4": "$b4",
        }),
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
        ),
      );
      print(getStorage.read('info')['token']);
      print(response.data);
      if (response.data['response']['status'] == '400') {
        add3 = false;
        throw HttpExeptionP1('error');
      }
      if (response.data['response']['status'] == '200') {
        add3 = true;
        print(add3);
        print(id);
      }
      notifyListeners();
      return add3;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send6(String id,
      String footerBody,
      String footerBodyColor,
      String name_color,
      String address_color,
      String email_color,
      String name,
      String address,
      String email) async {
    GetStorage getStorage = GetStorage();
    final oldColor = footerBodyColor.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor.replaceAll(")", "");

    final oldColor2 = name_color.replaceAll("Color(0xff", "#");
    final newColor2= oldColor2.replaceAll(")", "");

    final oldColor3 = address_color.replaceAll("Color(0xff", "#");
    final newColor3 = oldColor3.replaceAll(")", "");

    final oldColor4 = email_color.replaceAll("Color(0xff", "#");
    final newColor4 = oldColor4.replaceAll(")", "");



    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updatePortfolioFooter.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "footerBody": "$footerBody",
          "footerBodyColor": "$newColor1",
          "name_color": "$newColor2",
          "address_color": "$newColor3",
          "email_color": "$newColor4",
          "name": "$name",
          "address": "$address",
          "email": "$email",
        }),
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
        ),
      );
      print(getStorage.read('info')['token']);
      print(response.data);
      if (response.data['response']['status'] == '400') {
        add6 = false;
        throw HttpExeptionP1('error');
      }
      if (response.data['response']['status'] == '200') {
        add6 = true;
        print(add6);
        print(id);
      }
      notifyListeners();
      return add6;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send4(String id,
      String SkillsTColor,
      String SkillsT,
      String iconColor,
      String textColor,
      String t1,
      String t2,
      String t3,
      File Icon1,
      File Icon2,
      File Icon3) async {
    GetStorage getStorage = GetStorage();
    final oldColor = SkillsTColor.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor.replaceAll(")", "");

    final oldColor2 = iconColor.replaceAll("Color(0xff", "#");
    final newColor2= oldColor2.replaceAll(")", "");

    final oldColor3 = textColor.replaceAll("Color(0xff", "#");
    final newColor3 = oldColor3.replaceAll(")", "");

    var imageServer;
    var imageServer2;
    var imageServer3;
    if (Icon1 != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        Icon1.path,
        filename: Icon1.path
            .split('/')
            .last,
      );
    }
    if (Icon2 != null) {
      imageServer2 = await Dio.MultipartFile.fromFileSync(
        Icon2.path,
        filename: Icon2.path
            .split('/')
            .last,
      );
    }
    if (Icon3 != null) {
      imageServer3 = await Dio.MultipartFile.fromFileSync(
        Icon3.path,
        filename: Icon3.path
            .split('/')
            .last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updatePortfolioSkills.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "skills_title_color": "$newColor1",
          "skills_title": "$SkillsT",
          "icon_color": "$newColor2",
          "text_color": "$newColor3",
          "title1": "$t1",
          "title2": "$t2",
          "title3": "$t3",
          "icon1": "fas fa-pencil-ruler",
          "icon2": "fas fa-pencil-ruler",
          "icon3": "fas fa-pencil-ruler",
        }),
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
        ),
      );
      print(getStorage.read('info')['token']);
      print(response.data);
      if (response.data['response']['status'] == '400') {
        add4 = false;
        throw HttpExeptionP1('error');
      }
      if (response.data['response']['status'] == '200') {
        add4 = true;
        print(add4);
        print(id);
      }
      notifyListeners();
      return add4;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send5(String id,
      String BGColor,
      String TColor,
      File image1,
      File image2,
      File image3,
      String url1,
      String url2,
      String url3,
      String projectT1,
      String projectT2,
      String projectT3,
      String projectB1,
      String projectB2,
      String projectB3,) async {
    GetStorage getStorage = GetStorage();
    final oldColor = BGColor.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor.replaceAll(")", "");

    final oldColor2 = TColor.replaceAll("Color(0xff", "#");
    final newColor2= oldColor2.replaceAll(")", "");


    var imageServer;
    var imageServer2;
    var imageServer3;
    if (image1 != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        image1.path,
        filename: image1.path
            .split('/')
            .last,
      );
    }
    if (image2 != null) {
      imageServer2 = await Dio.MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path
            .split('/')
            .last,
      );
    }
    imageServer3 = Dio.MultipartFile.fromFileSync(
      image3.path,
      filename: image3.path
          .split('/')
          .last,
    );
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updatePortfolioProject.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "background": "$newColor1",
          "title_color": "$newColor2",
          "image1": imageServer,
          "image2": imageServer2,
          "image3": imageServer3,
          "url1": "$url1",
          "url2": "$url2",
          "url3": "$url3",
          "projectTitle1": "$projectT1",
          "projectTitle2": "$projectT2",
          "projectTitle3": "$projectT3",
          "projecBody1": "$projectB1",
          "projecBody2": "$projectB2",
          "projecBody3": "$projectB3",
        }),
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          },
        ),
      );
      print(getStorage.read('info')['token']);
      print(response.data);
      if (response.data['response']['status'] == '400') {
        add5 = false;
        throw HttpExeptionP1('error');
      }
      if (response.data['response']['status'] == '200') {
        add5 = true;
        print(add5);
        print(id);
      }
      notifyListeners();
      return add5;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}

class HttpExeptionP1 implements Exception {
  final String message;

  HttpExeptionP1(this.message);

  @override
  String toString() {
    return message;
  }
}

