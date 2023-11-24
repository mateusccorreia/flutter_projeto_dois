import 'package:flutter/cupertino.dart';
import 'package:flutter_projeto_dois/model/user_model.dart';
import 'package:flutter_projeto_dois/services/api_service.dart';

class UserStore extends ChangeNotifier {
  late List<UserModel>? userModel = [];
  DataState dataState = DataState.loading;

  void getData() async {
    dataState = DataState.loading;
    notifyListeners();
    try {
      userModel = (await ApiService().getUsers())!;
      dataState = DataState.loaded;
      notifyListeners();
    } catch (e) {
      dataState = DataState.error;
      notifyListeners();
    }
  }
}

enum DataState {
  loading,
  loaded,
  error,
}
