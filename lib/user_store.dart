import 'package:flutter/cupertino.dart';
import 'package:flutter_projeto_dois/model/user_model.dart';
import 'package:flutter_projeto_dois/services/api_service.dart';

class UserStore extends ChangeNotifier {
  DataState dataState = Loading();

  void getData() async {
    dataState = Loading();
    notifyListeners();
    try {
      final userList = (await ApiService().getUsers())!;
      dataState = Loaded(users: userList);
      notifyListeners();
    } catch (e) {
      dataState = Error(message: e);
      notifyListeners();
    }
  }
}

sealed class DataState {}

class Loading extends DataState {}

class Loaded extends DataState {
  final List<UserModel>? users;

  Loaded({required this.users});
}

class Error extends DataState {
  final Object message;

  Error({required this.message});
}
