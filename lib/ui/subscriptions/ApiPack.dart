
import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/api/dio.dart';

class packApi with ChangeNotifier {
  bool choose = false;
  late String? token;
  late String? name;
  late String? email;
  late String? phone;
  late int id;
  late String? image;

  Future<bool> PackUser(String id) async {
    GetStorage getStorage = GetStorage();
    Map data;
    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/',
        data: data = {
          "name": "setPackage",
          "param": {"package_id": "$id"}
        },
        options: Dio.Options(
          headers: {
            'authorization': 'Bearer ${getStorage.read('info')['token']}',
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
      );
      print(getStorage.read('info')['token']);
      print(response.data);
      if (response.data['status'] == 400) {
        choose = false;
        throw HttpExeptionPackApi('error');
      }
      if (response.data['resonse']['status'] == 200) {
        choose = true;
      }
      notifyListeners();
      return choose;
    } catch (error) {
      throw (error);
    }
  }
}

class HttpExeptionPackApi implements Exception {
  final String message;

  HttpExeptionPackApi(this.message);

  @override
  String toString() {
    return message;
  }
}
