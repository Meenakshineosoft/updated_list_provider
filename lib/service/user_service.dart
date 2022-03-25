import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/user.dart';


class UserService {

  final Dio _service;

  UserService(this._service);

  Future<List<User>> fetchUser() async {

    try {

      final response = await _service.get('/posts');

      print((response.data as List).map((x) => User.fromJson(x)).toList());
      return (response.data as List).map((x) => User.fromJson(x)).toList();
    }
    on DioError catch (exception) {
      String errorMessage = json.decode(exception.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }
  Future<User> fetchUserDetails(int id) async {
    try {
      final response = await _service.request(
        "/posts",
        options: Options(method: 'GET'),
        queryParameters: {'id': id},
      );
      return User.fromJson(response.data[0]);
    } on DioError catch (ex) {
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw Exception(errorMessage);
    }
  }
}

