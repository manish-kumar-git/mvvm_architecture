import 'package:mvvm/Data/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.complete() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}
