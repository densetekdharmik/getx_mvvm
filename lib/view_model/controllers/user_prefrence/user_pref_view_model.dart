import 'package:get/get.dart';
import 'package:getx_mvvm/model/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', responseModel.token.toString());
    _prefs.setBool('isLoggedIn', responseModel.isLoggedIn!);

    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    bool? isLoggedIn = _prefs.getBool('isLoggedIn');

    return UserModel(token: token, isLoggedIn: isLoggedIn);
  }

  Future<bool> removeUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();

    return true;
  }
}
