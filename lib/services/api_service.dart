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
      } else {
        log('HTTP request failed with status: ${response.statusCode}');
        log('Response body: ${response.body}');
        throw Exception('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Exception during API request: $e');
    }
  }
}
