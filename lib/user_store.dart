import 'package:flutter/cupertino.dart';
import 'package:flutter_projeto_dois/model/user_model.dart';
import 'package:flutter_projeto_dois/services/api_service.dart';

class UserStore extends ChangeNotifier {
  late List<UserModel>? userModel = [];
  // var state = UserState.loading;
  var loading = false;
  var loaded = false;
  Object? error;

  void getData() async {
    print('Chamando getData');
    loading = true;
    loaded = false;
    error = null;
    notifyListeners();

    try {
      userModel = (await ApiService().getUsers())!;
      loading = false;
      loaded = true;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      loaded = false;
      notifyListeners();
    }
  }
}

// enum UserState {
//   loading,
//   loaded,
//   error,
// }
