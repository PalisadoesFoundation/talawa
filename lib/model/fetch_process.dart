import 'package:flutter_quito/services/network_service_response.dart';

enum ApiType { performOTP, performLogin, getProductInfo }

class FetchProcess<T> {
  ApiType type;
  bool loading;
  NetworkServiceResponse<T> response;

  FetchProcess({this.loading, this.response, this.type});
}
