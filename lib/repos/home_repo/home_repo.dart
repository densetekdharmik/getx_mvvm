import '../../data/network/network_api_services.dart';
import '../../model/home/user_list_model.dart';
import '../../res/app_urls/app_urls.dart';

class HomeRepo {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> fetchUsers() async {
    dynamic response = await _apiServices.getApi(AppUrls.userListApi);
    return UserListModel.fromJson(response);
  }
}
