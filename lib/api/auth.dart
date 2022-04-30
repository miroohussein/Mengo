import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/api/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool getApk = false;
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
       if (response.data["Response"]["status"] == "400") {
          throw HttpExeption(response.data['Response']['result']);
       }
      if (response.data["Response"]["status"] == "200") {
        print(response.data["Response"]["status"]);
        loggedIn = true;
        token = response.data['Response']['result']['token'];
        name = response.data['Response']['result']['name'];
        phone = response.data['Response']['result']['phone'];
        image = response.data['Response']['result']['profile image'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        prefs.setString("info", response.data['Response']['result']['token']);
        print(token);

        storage.write(
          'info',
          response.data['Response']['result'],
        );
      }else
        {
          throw HttpExeption(response.data["Response"]["status"]);
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
            'authorization': 'Bearer ${getStorage.read('info')['token']}'
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
        throw HttpExeption(response.data['resonse']['result']);
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
        throw HttpExeption(response.data['resonse']['status']);
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
    GetStorage getStorage = GetStorage();
    Map data;
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/',
        data: data = {
          "name": "changePassword",
          "param": {"password": "$password"}
        },
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
      );
      print(response.data);
      if (response.data['resonse']['status'] == 400) {
        resetPasswordDone = false;
        throw HttpExeption('error');
      }
      if (response.data['resonse']['status'] == 200) {
        resetPasswordDone = true;
      }
      notifyListeners();
      return resetPasswordDone;
    } catch (error) {
      throw (error);
    }
  }
  Future<bool> requestApk(String id) async {
    GetStorage getStorage = GetStorage();
    Map data;
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/',
        data: data = {
          "name": "convertProject",
          "param": {"projectId": "$id"}
        },
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
      );
      print(response.data);
      if (response.data['resonse']['status'] == "400") {
        resetPasswordDone = false;
        throw HttpExeption('error');
      }
      if (response.data['resonse']['status'] == 200) {
        resetPasswordDone = true;
      }
      notifyListeners();
      return resetPasswordDone;
    } catch (error) {
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
