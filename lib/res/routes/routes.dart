import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/home/home_view.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

import '../../view/login/login_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreen(),
          transition: Transition.circularReveal,
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => LoginView(),
          transition: Transition.circularReveal,
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RouteName.homeScreen,
          page: () => HomeView(),
          transition: Transition.circularReveal,
          transitionDuration: Duration(milliseconds: 250),
        ),
      ];
}
