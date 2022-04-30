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
  bool addECO1 = false;
  bool addECO2 = false;
  bool addECO3 = false;
  bool addECO4 = false;
  bool addECO6 = false;
  bool addECO7 = false;
  bool addECO5 = false;
  bool addECO8 = false;
  late String? token;
  late String? name;
  late String? email;
  late String? phone;
  late int id;
  late String? image;

  Future<bool> send1(String name,
      String ColorName,
      String title,
      String ColorTitle,
      String Subtitle,
      String ColorSubtitle,
      String TextBody,
      String ColorBody,
      File image,) async {
    GetStorage getStorage = GetStorage();
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
        'http://mengo1.online/application/updatePortfolioStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "app_name": "$name",
          "navbar_color": "$ColorName",
          "start_title": "$title",
          "start_title_color": "$ColorTitle",
          "start_subtitle": "$Subtitle",
          "start_subtitle_color": "$ColorSubtitle",
          "start_body": "$TextBody",
          "start_body_color": "$ColorBody",
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
      }
      notifyListeners();
      return add1;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send2(String aboutColor,
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
        'http://mengo1.online/application/updatePortfolioAbout.php?project_id=id',
        data: Dio.FormData.fromMap({
          "about_color": "$aboutColor",
          "title_color": "$titleColor",
          "subtitle": "$subtitle",
          "subtitle_color": "$subtitleColor",
          "body": "$body",
          "body_color": "$bodyColor",
          "image": imageServer,
          "portfolio_button_color": "$ButtonColor",
          "portfolio_url": "$url",
          "portfolio_text_color": "$PortfolioColor"
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
      }
      notifyListeners();
      return add2;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send3(String XPBColor,
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
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateportfolioExperince.php?project_id=id',
        data: Dio.FormData.fromMap({
          "experience_background": "$XPBColor",
          "experience_title_color": "$XPTColor",
          "titles_color": "$titlesColor",
          "text_color": "$textColor",
          "icons_color": "$iconsColor",
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
      }
      notifyListeners();
      return add3;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send6(String footerBody,
      String footerBodyColor,
      String name_color,
      String address_color,
      String email_color,
      String name,
      String address,
      String email) async {
    GetStorage getStorage = GetStorage();
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updatePortfolioFooter.php?project_id=id',
        data: Dio.FormData.fromMap({
          "footerBody": "$footerBody",
          "footerBodyColor": "$footerBodyColor",
          "name_color": "$name_color",
          "address_color": "$address_color",
          "email_color": "$email_color",
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
      }
      notifyListeners();
      return add6;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send4(String SkillsTColor,
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
        'http://mengo1.online/application/updatePortfolioSkills.php?project_id=49',
        data: Dio.FormData.fromMap({
          "skills_title_color": "$SkillsTColor",
          "skills_title": "$SkillsT",
          "icon_color": "$iconColor",
          "text_color": "$textColor",
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
      }
      notifyListeners();
      return add4;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> send5(String BGColor,
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
    if (image3 != null) {
      imageServer3 = await Dio.MultipartFile.fromFileSync(
        image3.path,
        filename: image3.path
            .split('/')
            .last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updatePortfolioProject.php?project_id=id',
        data: Dio.FormData.fromMap({
          "background": "$BGColor",
          "title_color": "$TColor",
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

