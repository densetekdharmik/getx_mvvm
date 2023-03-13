import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';

import '../controllers/user_prefrence/user_pref_view_model.dart';

class SplashServices {
  UserPrefs userPrefs = UserPrefs();

  void isLogin() {
    userPrefs.getUser().then((value) {
      
      print("Login Status " + value.isLoggedIn.toString());
      
      if (value.isLoggedIn == false || value.isLoggedIn.toString() == 'null') {
        print("Login Status Is " + value.toString());
        Timer(
          const Duration(seconds: 3),
          () => Get.offAllNamed(RouteName.loginScreen),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Get.offAllNamed(RouteName.homeScreen),
        );
      }
    });
  }
}
