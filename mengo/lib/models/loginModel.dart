// class LoginModel {
//
//  late String? name;
//  late String? email;
//
//
//   LoginModel(
//       {
//         required this.name,
//         required this.email,
//     });
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//
//     name = json['name'];
//     email = json['email'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//
//     data['name'] = this.name;
//     data['email'] = this.email;
//
//     return data;
//   }
// }
class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token, required this.error});

  factory LoginResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<dynamic, dynamic> toJson() {
    Map<dynamic, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
