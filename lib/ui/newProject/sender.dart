import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/api/dio.dart';

class Sender with ChangeNotifier {
  bool sendType = false;

  Future<bool> send(
      String name,
      String type,
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
        'http://mengo1.online/application/createProject.php',
        data: Dio.FormData.fromMap({
          "name": "$name",
          "type": "$type",
          "icon": imageServer1,
          "ad": "0"
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
      if (response.data['response']['status'] == "405") {
        sendType = false;
        throw HttpExeptionSender(response.data['response']['result']);
      }
      if (response.data['response']['status'] == "400") {
        sendType = false;
        throw HttpExeptionSender("${name} is not available\n change name project");
      }
      if (response.data['response']['status'] == "200") {
        sendType = true;
        print(sendType);
      }
      notifyListeners();
      return sendType;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}

class HttpExeptionSender implements Exception {
  final String message;

  HttpExeptionSender(this.message);

  @override
  String toString() {
    return message;
  }
}
