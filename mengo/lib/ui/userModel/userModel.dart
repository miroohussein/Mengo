class UserModel {
  final int name;
  final String phone;
  final String email;
  final String password;


  UserModel({required this.name, required this.email,required this.phone, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
    );
  }
}