import '../../data/network/network_api_services.dart';
import '../../res/app_urls/app_urls.dart';

class LoginRepo {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginAPI(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrls.loginUrl);
    return response;
  }
}
