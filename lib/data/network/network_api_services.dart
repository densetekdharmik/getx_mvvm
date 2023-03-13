import 'dart:convert';
import 'dart:io';

import 'package:getx_mvvm/data/exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 15));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions("");
    } on RequestTimeout {
      throw RequestTimeout("");
    }
    return responseJson;
  }

  @override
  Future postApi(var data, String url) async {
    dynamic responseJson;

    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 15));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions("");
    } on RequestTimeout {
      throw RequestTimeout("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidUrlException;

      default:
        throw FetchDataException(response.statusCode.toString());
    }
  }
}
