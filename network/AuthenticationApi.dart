import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'UserEntity.dart';

Future<UserEntity?> login(String email, String password) async {
  UserEntity? responseEntity;
  try {
    final response = await httpClient.post(Uri.parse(ApiConstants.authLogin),
        headers: {"Content-Type": ApiConstants.contentType},
        body: json.encode({'Email': email, 'Password': password}));
    switch (response.statusCode) {
      case 200:
        {
          Map<String, dynamic> data = jsonDecode(response.body.toString());
          responseEntity = UserEntity.fromJson(data);
        }
        break;
      case 400:
        {
          Map<String, dynamic> data = jsonDecode(response.body.toString());
          responseEntity = UserEntity.fromJson(data);
        }
        break;
      case 401:
        {
          Map<String, dynamic> data = jsonDecode(response.body.toString());
          responseEntity = UserEntity.fromJson(data);
        }
        break;
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
  return responseEntity;
}

Future<UserEntity> signWithEmailAndPassword({
  required String email,
  required String password,
}) async {
  try {
    var userCredential = await AuthenticationApi().login(email, password);
    if (userCredential?.code?.toString() == "OK") {
      AuthenticationApi()
          .setToken(userCredential?.data?.accessToken?.tokenString.toString());
      AuthenticationApi().setUserDetails(userCredential);
    }
    return userCredential;
  } on Exception catch (e) {
    rethrow;
  }
}
