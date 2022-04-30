import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/api/dio.dart';

class Auth with ChangeNotifier {
  bool loggedIn = false;
  bool forgetPasword = false;
  bool checkCodeStatus = false;
  bool resetPasswordDone = false;
  bool faceBookloggedIn = false;
  bool loggedOut = false;
  bool isRegistered = false;
  bool loginfromfacebook = false;
  bool doneSent = false;
  bool doneSentPhoto = false;
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

  Future<bool> signIn(String user, String password) async {
    GetStorage storage = GetStorage();
    try {
      Map<String, Object> data;
      Dio.Response response = await dio().post(
          'http://mengo1.online/application/',
          data: data = {
            "name": "login",
            "param": {"email": "$user", "password": "$password"}
          },
          options: Dio.Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      // if (response.data["Response"]["status"] == "400") {
      //    throw HttpExeption('error');
      // }
      if (response.data["Response"]["status"] == "200") {
        print(response.data["Response"]["status"]);
        loggedIn = true;
        token = response.data['Response']['result']['token'];
        name = response.data['Response']['result']['name'];
        phone = response.data['Response']['result']['phone'];
        image = response.data['Response']['result']['profile image'];
        print(token);

        storage.write(
          'info',
          response.data['Response']['result'],
        );
      }
      notifyListeners();
      return loggedIn;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> signInFaceBook(String token, String id) async {
    GetStorage storage = GetStorage();
    try {
      Dio.Response response = await dio().get(
        'Auth/login_facebook?token=${token}',
      );
      print(response.data['data']['token']);
      if (response.data['status'] == 400) {
        faceBookloggedIn = false;
        throw HttpExeption('error');
      }
      if (response.data['status'] == 200) {
        faceBookloggedIn = true;
        loginfromfacebook = true;
        storage.write(
          'info',
          response.data['data'],
        );
      }
      notifyListeners();
      return faceBookloggedIn;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> logout() async {
    GetStorage getStorage = GetStorage();
    try {
      Dio.Response response = await dio().post(
        'Auth/logOut',
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['api_token']}'
          },
        ),
      );
      print(response.data);
      if (response.data['status'] == 400) {
        loggedOut = false;
        throw HttpExeption('error');
      }
      if (response.data['status'] == 200) {
        loggedOut = true;
        getStorage.erase();
      }
      notifyListeners();
      return loggedOut;
    } catch (error) {
      getStorage.erase();
      throw (error);
    }
  }

  Future<bool> register(
      String name, String phone, String email, String password) async {
    Map data;
    try {
      Dio.Response response = await dio().post(
          'http://mengo1.online/application/',
          data: data = {
            "name": "register",
            "param": {
              "name": "$name",
              "phone": "$phone",
              "email": "$email",
              "password": "$password"
            }
          },
          options: Dio.Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}));
      print(response.data);
      if (response.data['resonse']['status'] == 400) {
        print(response);
        isRegistered = false;
        throw HttpExeption('error');
      }
      if (response.data['resonse']['status'] == 200) {
        isRegistered = true;
        print(Dio.FormData());
        print(response);
      }
      notifyListeners();
      return isRegistered;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> updateProfile(String name, String company, String email) async {
    Map data;
    GetStorage getStorage = GetStorage();
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/',
        data: data = {
          "name": "editProfile",
          "param": {"name": "$name", "email": "$email", "company": "$company"}
        },
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
      );
      print(response.data);
      // print(data);
      if (response.data['resonse']['status'] == 400) {
        doneSent = false;
        throw HttpExeption('error');
      }
      if (response.data['resonse']['status'] == 200) {
        doneSent = true;
      }
      notifyListeners();
      return doneSent;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> updatePhoto(File image) async {
    GetStorage getStorage = GetStorage();
    var imageServer;
    if (image != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/changeProfileImage.php',
        data: Dio.FormData.fromMap({"image": imageServer}),
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
      );
      print(response.data);
      // print(data);
      if (response.data['resonse']['status'] == 400) {
        doneSentPhoto = false;
        throw HttpExeption('error');
      }
      if (response.data['resonse']['status'] == 200) {
        doneSentPhoto = true;
      }
      notifyListeners();
      return doneSent;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> sentEmail(String userEmail) async {
    try {
      Dio.Response response = await dio().post(
        'Auth/forgetPassword',
        data: Dio.FormData.fromMap({"provider": userEmail}),
      );
      print(response.data);
      if (response.data['status'] == 400) {
        forgetPasword = false;
        throw HttpExeption('error');
      }
      if (response.data['status'] == 200) {
        forgetPasword = true;
      }
      notifyListeners();
      return forgetPasword;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> checkCode(String code, String userEmail) async {
    try {
      Dio.Response response = await dio().post(
        'Auth/checkCodeCorrect',
        data: Dio.FormData.fromMap({"email": userEmail, "code": code}),
      );
      print(response.data);
      if (response.data['status'] == 400) {
        checkCodeStatus = false;
        throw HttpExeption('error');
      }
      if (response.data['status'] == 200) {
        checkCodeStatus = true;
      }
      notifyListeners();
      return checkCodeStatus;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> resetPassword(String password) async {
    Map data;
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/',
        data: data = {
          "name": "changePassword",
          "param": {"password": "$password"}
        },
      );
      print(response.data);
      if (response.data['status'] == 400) {
        resetPasswordDone = false;
        throw HttpExeption('error');
      }
      if (response.data['status'] == 200) {
        resetPasswordDone = true;
      }
      notifyListeners();
      return resetPasswordDone;
    } catch (error) {
      throw (error);
    }
  }

  Future<bool> send1(
    String name,
    String ColorName,
    String title,
    String ColorTitle,
    String Subtitle,
    String ColorSubtitle,
    String TextBody,
    String ColorBody,
    File image,
  ) async {
    GetStorage getStorage = GetStorage();
    var imageServer;
    if (image != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
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
        throw HttpExeption('error');
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

  Future<bool> send2(
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
    var imageServer;
    if (image != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
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
        throw HttpExeption('error');
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

  Future<bool> send3(
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
        throw HttpExeption('error');
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

  Future<bool> send6(
      String footerBody,
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
        throw HttpExeption('error');
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

  Future<bool> send4(
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
    var imageServer;
    var imageServer2;
    var imageServer3;
    if (Icon1 != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        Icon1.path,
        filename: Icon1.path.split('/').last,
      );
    }
    if (Icon2 != null) {
      imageServer2 = await Dio.MultipartFile.fromFileSync(
        Icon2.path,
        filename: Icon2.path.split('/').last,
      );
    }
    if (Icon3 != null) {
      imageServer3 = await Dio.MultipartFile.fromFileSync(
        Icon3.path,
        filename: Icon3.path.split('/').last,
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
        throw HttpExeption('error');
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

  Future<bool> send5(
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
    String projectB3,
  ) async {
    GetStorage getStorage = GetStorage();
    var imageServer;
    var imageServer2;
    var imageServer3;
    if (image1 != null) {
      imageServer = await Dio.MultipartFile.fromFileSync(
        image1.path,
        filename: image1.path.split('/').last,
      );
    }
    if (image2 != null) {
      imageServer2 = await Dio.MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path.split('/').last,
      );
    }
    if (image3 != null) {
      imageServer3 = await Dio.MultipartFile.fromFileSync(
        image3.path,
        filename: image3.path.split('/').last,
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
        throw HttpExeption('error');
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

  Future<bool> sendECO1(
    String navbar_color,
    String site_name,
    File image,
    File image2,
  ) async {
    GetStorage getStorage = GetStorage();
    var imageServer1;
    var imageServer2;
    if (image != null) {
      imageServer1 = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      );
    }
    if (image2 != null) {
      imageServer2 = await Dio.MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path.split('/').last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "navbar_color": "$navbar_color",
          "site_name": "$site_name",
          "image1": imageServer1,
          "image2": imageServer2,
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
        addECO1 = false;
        throw HttpExeption('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO1 = true;
        print(addECO1);
      }
      notifyListeners();
      return addECO1;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO2(
    String background_color,
    String title_color,
    String text_color,
    String text,
    File image,
  ) async {
    GetStorage getStorage = GetStorage();
    var imageServer1;
    if (image != null) {
      imageServer1 = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialAbout.php?project_id=id',
        data: Dio.FormData.fromMap({
          "background_color": "$background_color",
          "title_color": "$title_color",
          "text_color": "$text_color",
          "text": "$text",
          "image": imageServer1,
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
        addECO2 = false;
        throw HttpExeption('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO2 = true;
        print(addECO2);
      }
      notifyListeners();
      return addECO2;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO3(String title_color, String text_color, String text,
      String more_button_color, String more_button_text_color) async {
    GetStorage getStorage = GetStorage();

    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialServices.php?project_id=id',
        data: Dio.FormData.fromMap({
          "title_color": "$title_color",
          "text_color": "$text_color",
          "text": "$text",
          "more_button_color": "$more_button_color",
          "more_button_text_color": "$more_button_text_color",
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
        addECO3 = false;
        throw HttpExeption('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO3 = true;
        print(addECO3);
      }
      notifyListeners();
      return addECO3;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO4(
      String background_color,
      String title_color,
      String text_color,
      String text,
      String more_button_color,
      String more_button_text_color) async {
    GetStorage getStorage = GetStorage();

    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "background_color": "$background_color",
          "title_color": "$title_color",
          "text_color": "$text_color",
          "text": "$text",
          "more_button_color": "$more_button_color",
          "more_button_text_color": "$more_button_text_color",
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
        addECO1 = false;
        throw HttpExeption('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO1 = true;
        print(addECO1);
      }
      notifyListeners();
      return addECO1;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO5(String title_color, String text_color, String text1,
      String text2, File image1, File image2) async {
    GetStorage getStorage = GetStorage();
    var imageServer1;
    var imageServer2;
    if (image1 != null) {
      imageServer1 = await Dio.MultipartFile.fromFileSync(
        image1.path,
        filename: image1.path.split('/').last,
      );
    }
    if (image2 != null) {
      imageServer2 = await Dio.MultipartFile.fromFileSync(
        image2.path,
        filename: image2.path.split('/').last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialLatest.php?project_id=id',
        data: Dio.FormData.fromMap({
          "title_color": "$title_color",
          "text_color": "$text_color",
          "text1": "$text1",
          "text2": "$text2",
          "image1": imageServer1,
          "image2": imageServer2,
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
        addECO5 = false;
        throw HttpExeption('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO5 = true;
        print(addECO5);
      }
      notifyListeners();
      return addECO5;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO6(
    String map_link,
    String background_color,
    String title,
    String title_color,
    String text,
    String text_color,
    String about_color,
    String address_color,
    String email_color,
    String address,
    String email,
  ) async {
    GetStorage getStorage = GetStorage();
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialFooter.php?project_id=id',
        data: Dio.FormData.fromMap({
          "map_link": "$map_link",
          "background_color": "$background_color",
          "title": "$title",
          "title_color": "$title_color",
          "text": "$text",
          "text_color": "$text_color",
          "about_color": "$about_color",
          "address_color": "$address_color",
          "email_color": "$email_color",
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
      if (response.data['status'] == 400) {
        addECO6 = false;
        throw HttpExeption('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO6 = true;
        print(addECO6);
      }
      notifyListeners();
      return addECO6;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO7(
    File image,
    String name,
    String text,
    String link,
  ) async {
    GetStorage getStorage = GetStorage();
    var imageServer1;
    if (image != null) {
      imageServer1 = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/addCommericialSingleProject.php?project_id=id',
        data: Dio.FormData.fromMap({
          "image": imageServer1,
          "name": "$name",
          "text": "$text",
          "link": "$link",
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
        addECO7 = false;
        throw HttpExeption('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO7 = true;
        print(addECO7);
      }
      notifyListeners();
      return addECO7;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO8(
    File image,
    String title,
    String text,
    String title_color,
    String text_color,
  ) async {
    GetStorage getStorage = GetStorage();
    var imageServer1;
    if (image != null) {
      imageServer1 = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/addCommericialSingleService.php?project_id=id',
        data: Dio.FormData.fromMap({
          "image": imageServer1,
          "title": "$title",
          "text": "$text",
          "title_color": "$title_color",
          "text_color": "$text_color",
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
        addECO8 = false;
        throw HttpExeption('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO8 = true;
        print(addECO8);
      }
      notifyListeners();
      return addECO8;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}

class HttpExeption implements Exception {
  final String message;

  HttpExeption(this.message);

  @override
  String toString() {
    return message;
  }
}
