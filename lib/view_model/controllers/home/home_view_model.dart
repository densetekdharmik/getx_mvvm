import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/model/home/user_list_model.dart';
import 'package:getx_mvvm/repos/home_repo/home_repo.dart';

class HomeController extends GetxController {
  final api = HomeRepo();

  final reqStatus = Status.LOADING.obs;

  final userList = UserListModel().obs;
  RxString error = "".obs;

  void setReqStatus(Status _value) => reqStatus.value = _value;

  void setUserList(UserListModel _value) => userList.value = _value;

  void setError(String _value) => error.value = _value;

  void userListAPi() {
    api.fetchUsers().then((value) {
      setReqStatus(Status.COMPLECTED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setReqStatus(Status.ERROR);
    });
  }
}
