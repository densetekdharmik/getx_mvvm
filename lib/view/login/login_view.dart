import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utils/utils.dart';

import '../../res/components/round_button.dart';
import '../../view_model/controllers/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginViewModel());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextFormField(
                    controller: loginController.emailController.value,
                    focusNode: loginController.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBarError(context, "Please Enter Email");
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginController.emailFocusNode.value,
                          loginController.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextFormField(
                    controller: loginController.passwordController.value,
                    focusNode: loginController.passwordFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBarError(context, "Please Enter Password");
                      }
                    },
                    obscureText: true,
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Obx(
                  () => RoundButton(
                    title: 'Login',
                    loading: loginController.loading.value,
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        loginController.loginAPI(context);
                      }
                    },
                    width: 200,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
