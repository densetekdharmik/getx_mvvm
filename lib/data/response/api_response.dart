import 'package:getx_mvvm/data/response/status.dart';

class APIResponse<T> {
  Status? status;
  T? data;
  String? message;

  APIResponse(this.status, this.data, this.message);

  APIResponse.loading() : status = Status.LOADING;

  APIResponse.complected(this.data) : status = Status.COMPLECTED;

  APIResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
