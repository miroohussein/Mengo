import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/api/dio.dart';

class ApiEco with ChangeNotifier {
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

  Future<bool> sendECO1(
      String id,
      String navbar_color,
      String site_name,
      File image,
      File image2,
      ) async {
    GetStorage getStorage = GetStorage();
    final newString = navbar_color.replaceAll("Color(0xff", "#");
    final newString2 = newString.replaceAll(")", "");
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
        'http://mengo1.online/application/updateCommericialStart.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "navbar_color": "$newString2",
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
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO1 = true;
        print(addECO1);
        print(id);
        print(newString2);
      }
      notifyListeners();
      return addECO1;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO2(
      String id,
      String background_color,
      String title_color,
      String text_color,
      String text,
      File image,
      ) async {
    GetStorage getStorage = GetStorage();
    final oldColor = background_color.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor.replaceAll(")", "");

    final oldColor2 = title_color.replaceAll("Color(0xff", "#");
    final newColor2= oldColor2.replaceAll(")", "");

    final oldColor3 = title_color.replaceAll("Color(0xff", "#");
    final newColor3 = oldColor3.replaceAll(")", "");
    var imageServer1;
    if (image != null) {
      imageServer1 = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialAbout.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "background_color": "$newColor1",
          "title_color": "$newColor2",
          "text_color": "$newColor3",
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
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO2 = true;
        print(addECO2);
        print(id);
      }
      notifyListeners();
      return addECO2;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO3(String id,
      String title_color, String text_color, String text, String more_button_color, String more_button_text_color) async {
    GetStorage getStorage = GetStorage();
    final oldColor1 = title_color.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor1.replaceAll(")", "");

    final oldColor2 = text_color.replaceAll("Color(0xff", "#");
    final newColor2 = oldColor2.replaceAll(")", "");

    final oldColor3 = more_button_color.replaceAll("Color(0xff", "#");
    final newColor3= oldColor3.replaceAll(")", "");

    final oldColor4 = more_button_text_color.replaceAll("Color(0xff", "#");
    final newColor4 = oldColor4.replaceAll(")", "");
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialServices.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "title_color": "$newColor1",
          "text_color": "$newColor2",
          "text": "$text",
          "more_button_color": "$newColor3",
          "more_button_text_color": "$newColor4",
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
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO3 = true;
        print(addECO3);
        print(id);
      }
      notifyListeners();
      return addECO3;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO4(
      String id,
      String background_color,
      String title_color,
      String text_color,
      String text,
      String more_button_color,
      String more_button_text_color) async {
    GetStorage getStorage = GetStorage();
    final oldColor1 = background_color.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor1.replaceAll(")", "");

    final oldColor2 = title_color.replaceAll("Color(0xff", "#");
    final newColor2 = oldColor2.replaceAll(")", "");

    final oldColor3 = text_color.replaceAll("Color(0xff", "#");
    final newColor3 = oldColor3.replaceAll(")", "");

    final oldColor4 = more_button_color.replaceAll("Color(0xff", "#");
    final newColor4 = oldColor4.replaceAll(")", "");

    final oldColor5 = more_button_text_color.replaceAll("Color(0xff", "#");
    final newColor5 = oldColor5.replaceAll(")", "");

    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialStart.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "background_color": "$newColor1",
          "title_color": "$newColor2",
          "text_color": "$newColor3",
          "text": "$text",
          "more_button_color": "$newColor4",
          "more_button_text_color": "$newColor5",
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
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO1 = true;
        print(addECO1);
        print(id);
      }
      notifyListeners();
      return addECO1;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO5(String id,String title_color, String text_color, String text1, String text2, File image1, File image2) async {
    GetStorage getStorage = GetStorage();
    final oldColor2 = text_color.replaceAll("Color(0xff", "#");
    final newColor2 = oldColor2.replaceAll(")", "");

    final oldColor1 = title_color.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor1.replaceAll(")", "");
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
        'http://mengo1.online/application/updateCommericialLatest.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "title_color": "$newColor1",
          "text_color": "$newColor2",
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
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO5 = true;
        print(addECO5);
        print(id);
      }
      notifyListeners();
      return addECO5;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO6(
      String id,
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
    final oldColor1 = background_color.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor1.replaceAll(")", "");

    final oldColor2 = title_color.replaceAll("Color(0xff", "#");
    final newColor2 = oldColor2.replaceAll(")", "");

    final oldColor4 = about_color.replaceAll("Color(0xff", "#");
    final newColor4 = oldColor4.replaceAll(")", "");

    final oldColor5 = address_color.replaceAll("Color(0xff", "#");
    final newColor5 = oldColor5.replaceAll(")", "");

    final oldColor6 = email_color.replaceAll("Color(0xff", "#");
    final newColor6 = oldColor6.replaceAll(")", "");

    final oldColor3 = text_color.replaceAll("Color(0xff", "#");
    final newColor3 = oldColor3.replaceAll(")", "");
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialFooter.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "map_link": "$map_link",
          "background_color": "$newColor1",
          "title": "$title",
          "title_color": "$newColor2",
          "text": "$text",
          "text_color": "$newColor3",
          "about_color": "$newColor4",
          "address_color": "$newColor5",
          "email_color": "$newColor6",
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
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO6 = true;
        print(addECO6);
        print(id);
      }
      notifyListeners();
      return addECO6;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO7(
      String id,
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
        'http://mengo1.online/application/addCommericialSingleProject.php?project_id=$id',
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
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO7 = true;
        print(addECO7);
        print(id);
      }
      notifyListeners();
      return addECO7;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<bool> sendECO8(
      String id,
      File image,
      String title,
      String text,
      String title_color,
      String text_color,
      ) async {
    GetStorage getStorage = GetStorage();
    final oldColor1 = title_color.replaceAll("Color(0xff", "#");
    final newColor1 = oldColor1.replaceAll(")", "");

    final oldColor2 = text_color.replaceAll("Color(0xff", "#");
    final newColor2 = oldColor2.replaceAll(")", "");
    var imageServer1;
    if (image != null) {
      imageServer1 = await Dio.MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split('/').last,
      );
    }
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/addCommericialSingleService.php?project_id=$id',
        data: Dio.FormData.fromMap({
          "image": imageServer1,
          "title": "$title",
          "text": "$text",
          "title_color": "$newColor1",
          "text_color": "$newColor2",
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
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addECO8 = true;
        print(addECO8);
        print(id);
      }
      notifyListeners();
      return addECO8;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}

class HttpExeptionEco implements Exception {
  final String message;

  HttpExeptionEco(this.message);

  @override
  String toString() {
    return message;
  }
}
