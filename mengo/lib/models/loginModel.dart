class LoginModel {

 late String name;
 late String email;


  LoginModel(
      {
        required this.name,
        required this.email,
    });

  LoginModel.fromJson(Map<String, dynamic> json) {

    name = json['name'];
    email = json['email'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['email'] = this.email;

    return data;
  }
}