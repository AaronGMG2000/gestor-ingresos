class ServiceResponse {
  late int code;
  late DataResponse? data;
  late String? error;

  ServiceResponse.error(this.code, this.error) {
    data = null;
  }
  ServiceResponse.success(this.code, this.error, map) {
    data = DataResponse(map);
  }
}

class DataResponse {
  late bool success;
  late dynamic data;
  late String message;

  DataResponse(Map<String, dynamic> map) {
    success = map['success'];
    data = map['data'];
    message = map['message'];
  }
}
