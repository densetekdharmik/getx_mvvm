import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/model/login/user_model.dart';
import 'package:getx_mvvm/repos/login_repo/login_repo.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controllers/user_prefrence/user_pref_view_model.dart';

import '../../../res/routes/routes_name.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepo();

  UserPrefs userPrefs = UserPrefs();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginAPI(BuildContext context) {
    loading.value = true;

    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _api.loginAPI(data).then((value) {
      if (value['error'] == 'user not found') {
        Utils.snackBarSuccess(context, value['error'].toString());
        loading.value = false;
      } else {
        UserModel userModel =
            UserModel(token: value['token'].toString(), isLoggedIn: true);
        userPrefs.saveUser(userModel).then((value) {
          Get.offAllNamed(RouteName.homeScreen);
        }).onError((error, stackTrace) {});
        Utils.snackBarSuccess(context, "Login Success");
        loading.value = false;
      }
    }).onError((error, stackTrace) {
      Utils.snackBarError(context, error.toString());
      loading.value = false;
    });
  }
}
