import 'package:flutter/cupertino.dart';
import 'package:flutter_projeto_dois/model/user_model.dart';
import 'package:flutter_projeto_dois/services/api_service.dart';

class UserStore extends ChangeNotifier {
  late List<UserModel>? userModel = [];
  DataState dataState = DataState.loading;
  // var loading = false;
  // var loaded = false;
  Object? error;

  void getData() async {
    dataState = DataState.loading;
    // loading = true;
    // loaded = false;
    error = null;
    notifyListeners();
    try {
      userModel = (await ApiService().getUsers())!;
      dataState = DataState.loaded;
      // loading = false;
      // loaded = true;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      // loaded = false;
      notifyListeners();
    }
  }
}

enum DataState {
  loading,
  loaded,
  error,
}
