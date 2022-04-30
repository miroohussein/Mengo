import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = "";
  dio.options.headers['accept'] = 'Application/Json';
  // dio.options.connectTimeout = 20000;
  // dio.interceptors.add(MyInterceptor());
  return dio;
}
