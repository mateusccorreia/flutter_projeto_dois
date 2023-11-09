import 'package:flutter/cupertino.dart';
import 'package:flutter_projeto_dois/model/user_model.dart';
import 'package:flutter_projeto_dois/services/api_service.dart';

class UserStore extends ChangeNotifier {
  late List<UserModel>? _userModel = [];
  // var _state = AppState.loading;
  var loading = false;
  var loaded = false;
  var error = '';

  @override
  void initState() {
    // super.initState();
    _getData();
    loading = _userModel == null;
  }

  void _getData() async {
    loading = true;
    error = '';
    notifyListeners();

    try {
      _userModel = (await ApiService().getUsers())!;
      // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
      loading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
