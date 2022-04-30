
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mengo/api/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

ProfileInfo profileInfoFromJson(String str) =>
    ProfileInfo.fromJson(json.decode(str));

String profileInfoToJson(ProfileInfo data) => json.encode(data.toJson());

class ProfileInfo {
  ProfileInfo({
    required this.status,
    required this.data,
  });

  int status;
  ProfileData data;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
    status: json["status"],
    data: ProfileData.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": data.toJson(),
  };
}

class ProfileData {
  ProfileData({
    required this.name,
    required this.email,
    required this.company,
    required this.packageId,
    required this.profileImage,
    // required this.projectNumbers,

  });

  String? name;
  String? email;
  String? company;
  String? packageId;
  dynamic profileImage;
  // int? projectNumbers;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    name: json["name"],
    email: json["email"],
    company: json["company name"],
    packageId: json["package id"],
    profileImage: json["profile image"],
    // projectNumbers: json["project numbers"],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'company name': company,
    'package id': packageId,
    'profile image': profileImage,
    // 'project numbers': projectNumbers
  };
}

class ProfileProvider with ChangeNotifier {
  Future<ProfileData> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http
        .get(Uri.parse('http://mengo1.online/application/singleUser.php',
    ),headers:  {
      'authorization': 'Bearer ${prefs.getString('info')}'
    }, );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final dataList = jsonResponse['resonse'];
      print(dataList);
      final dataIn = jsonEncode(dataList);
      print(dataIn.toString());
      return profileInfoFromJson(dataIn.toString()).data;

    } else {
      throw Exception('Failed to load data');
    }
  }
}
