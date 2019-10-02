import 'dart:async';

import 'package:flutter_quito/model/login.dart';
import 'package:flutter_quito/model/otp.dart';
import 'package:flutter_quito/services/network_service_response.dart';

abstract class IOTPService {
  Future<NetworkServiceResponse<CreateOTPResponse>> createOTP(
      String phoneNumber);
  Future<NetworkServiceResponse<OTPResponse>> fetchOTPLoginResponse(
      Login userLogin);
}
