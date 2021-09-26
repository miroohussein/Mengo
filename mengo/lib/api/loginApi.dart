import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mengo/models/loginModel.dart';


Future<LoginModel> login(String email,String password) async {
  final response = await http.post(
    Uri.parse('https://mengo1.online/application/'),

    body: jsonEncode(<String, String>{
      'email': email,
      'password':password,
    }));
    var data =response.body;
    print(data);
  if (response.statusCode == 201) {

    return LoginModel.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to create album.');
  }
}
//   Future<void> login(String email, dynamic password) async{
//     if (passController.text.isNotEmpty&& emailController.text.isNotEmpty){
//       var response = await http.post(Uri.parse("http://mengo1.online/application/"),
//           body:({
//         'email': emailController.text,
//         'password': passController.text,
//
//     }));
//       if(response.statusCode==200){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
//       }
//     else
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar( content:Text("invalid Credintial.")));}
//
//     else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("black field not allowed")));
//
//   }
//     print(emailController);
// }

