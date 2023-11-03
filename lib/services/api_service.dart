import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_projeto_dois/constants.dart';
import 'package:flutter_projeto_dois/model/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return userModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
