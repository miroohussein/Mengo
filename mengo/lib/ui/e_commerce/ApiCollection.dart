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
  bool addC1=false;
  bool addC2=false;
  bool addC3=false;
  bool addC4=false;
  bool addC5=false;
  bool addC6=false;
  late String? token;
  late String? name;
  late String? email;
  late String? phone;
  late int id;
  late String? image;

  Future<bool> sendCO1(
      String navBarColor,
      String siteName,
      File image3,
      File image4,
      File image5,
      File image6,
      File image7,
      File image8,
      File image9,
      File image0,
      String category1,
      String category2,
      String category3,
      String aboutTitleColor,
      String siteDescription,
      String categoriesTitlesColor,
      String footerTitlesColor,
      String footerText,
      String footerAddressColor,
      String footerEmailColor,
      String footerAddress,
      String footerEmail,
      ) async {
    GetStorage getStorage = GetStorage();

    var imageServer3;
    var imageServer4;
    var imageServer5;
    var imageServer6;
    var imageServer7;
    var imageServer8;
    var imageServer9;
    var imageServer0;

    if (image3 != null) {
      imageServer3 = await Dio.MultipartFile.fromFileSync(
        image3.path,
        filename: image3.path.split('/').last,
      );
    }
    if (image4 != null) {
      imageServer4 = await Dio.MultipartFile.fromFileSync(
        image4.path,
        filename: image4.path.split('/').last,
      );
    }
    if (image5 != null) {
      imageServer5 = await Dio.MultipartFile.fromFileSync(
        image5.path,
        filename: image5.path.split('/').last,
      );
    }
    if (image6 != null) {
      imageServer6 = await Dio.MultipartFile.fromFileSync(
        image6.path,
        filename: image6.path.split('/').last,
      );
    }
    if (image7 != null) {
      imageServer7 = await Dio.MultipartFile.fromFileSync(
        image7.path,
        filename: image7.path.split('/').last,
      );
    }
    if (image8 != null) {
      imageServer8 = await Dio.MultipartFile.fromFileSync(
        image8.path,
        filename: image8.path.split('/').last,
      );
    }
    if (image9 != null) {
      imageServer9 = await Dio.MultipartFile.fromFileSync(
        image9.path,
        filename: image9.path.split('/').last,
      );
    }
    if (image0 != null) {
      imageServer0 = await Dio.MultipartFile.fromFileSync(
        image0.path,
        filename: image8.path.split('/').last,
      );
    }

    try {
      Dio.Response response = await dio().post(
        'http://mengo1.online/application/updateCommericialStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "navbar_color": "$navBarColor",
          "site_name": "$siteName",
          "category_one":"$category1",
        "category_two":"$category2",
        "category_three":"$category3",
          "category_one_image": imageServer3,
          "category_two_image": imageServer4,
          "category_three_image": imageServer5,
          "offers_image":imageServer6,
          "sales_image":imageServer7,
          "home_image1":imageServer8,
          "home_image2":imageServer9,
          "about_image":imageServer0,
          "site_description":"$siteDescription",
          "categories_titles_color":"$categoriesTitlesColor",
          "footer_titles_color":"$footerTitlesColor",
          "footer_text":"$footerText",
          "footer_address_color":"$footerAddressColor",
          "footer_email_color":"$footerEmailColor",
          "footer_address":"$footerAddress",
          "footer_email":"$footerEmail",
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
        addC1 = false;
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addC1 = true;
        print(addC1);
      }
      notifyListeners();
      return addC1;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
  Future<bool> sendCO2(
      String name,
      String price,
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
        'http://mengo1.online/application/updateCommericialStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "image": imageServer1,
          "name": "$name",
          "price": "$price",
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
        addC1 = false;
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addC1 = true;
        print(addC1);
      }
      notifyListeners();
      return addC1;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
  Future<bool> sendCO3(
      String name,
      String price,
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
        'http://mengo1.online/application/updateCommericialStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "image": imageServer1,
          "name": "$name",
          "price": "$price",
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
        addC3 = false;
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addC3 = true;
        print(addC3);
      }
      notifyListeners();
      return addC3;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
  Future<bool> sendCO4(
      String name,
      String price,
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
        'http://mengo1.online/application/updateCommericialStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "image": imageServer1,
          "name": "$name",
          "price": "$price",
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
        addC4 = false;
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addC4 = true;
        print(addC4);
      }
      notifyListeners();
      return addC4;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
  Future<bool> sendCO5(
      String name,
      String price,
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
        'http://mengo1.online/application/updateCommericialStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "image": imageServer1,
          "name": "$name",
          "price": "$price",
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
        addC5 = false;
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addC5 = true;
        print(addC5);
      }
      notifyListeners();
      return addC5;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
  Future<bool> sendCO6(
      String name,
      String price,
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
        'http://mengo1.online/application/updateCommericialStart.php?project_id=id',
        data: Dio.FormData.fromMap({
          "image": imageServer1,
          "name": "$name",
          "price": "$price",
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
        addC6 = false;
        throw HttpExeptionEco('error');
      }
      if (response.data['response']['status'] == '200') {
        addC6 = true;
        print(addC6);
      }
      notifyListeners();
      return addC6;
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
        throw HttpExeptionEco('error');
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
        throw HttpExeptionEco('error');
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

  Future<bool> sendECO3(String title_color, String text_color, String text, String more_button_color, String more_button_text_color) async {
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
        throw HttpExeptionEco('error');
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
        throw HttpExeptionEco('error');
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

  Future<bool> sendECO5(String title_color, String text_color, String text1, String text2, File image1, File image2) async {
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
        throw HttpExeptionEco('error');
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
        throw HttpExeptionEco('error');
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
        throw HttpExeptionEco('error');
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
        throw HttpExeptionEco('error');
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

class HttpExeptionEco implements Exception {
  final String message;

  HttpExeptionEco(this.message);

  @override
  String toString() {
    return message;
  }
}
