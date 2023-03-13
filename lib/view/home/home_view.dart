import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_mvvm/view_model/controllers/home/home_view_model.dart';

import '../../data/response/status.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _controller.userListAPi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Obx(() {
        switch (_controller.reqStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.COMPLECTED:
            return ListView.builder(
              itemCount: _controller.userList.value.data!.length,
              itemBuilder: (context, index) {
                var data = _controller.userList.value.data![index];

                return Card(
                  child: ListTile(
                    title: Text(data.firstName.toString()),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(data.avatar.toString())),
                    subtitle: Text(data.email.toString()),
                  ),
                );
              },
            );
          case Status.ERROR:
            if (_controller.error == "No Internet") {
              return InternetExceptionWidget(onPress: () {
                _controller.userListAPi();
              });
            } else {
              return Text(_controller.error.value.toString());
            }
        }
        return SizedBox();
      }),
    );
  }
}
