import 'package:flutter/material.dart';
import 'package:getx_mvvm/view_model/controllers/user_prefrence/user_pref_view_model.dart';

import '../res/components/internet_exceptions_widget.dart';
import '../res/components/round_button.dart';
import '../view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices = SplashServices();


  @override
  void initState() {
    super.initState();


    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("GETX MVVM",style: TextStyle(
              fontSize: 50,
            ),),
          )
        ],
      )
    );
  }
}
