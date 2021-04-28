import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/utils/exception_classifier.dart';
import 'package:talawa/utils/uidata.dart';

class CustomToast {
  static void sucessToast(
      {@required String msg, Color toastColor = UIData.toastSucessColor}) {
    Fluttertoast.showToast(msg: msg, backgroundColor: toastColor);
  }

  static void exceptionToast(
      {@required String msg, Color toastColor = UIData.toastErrorColor}) {
    Fluttertoast.showToast(
        msg: classifyException(msg), backgroundColor: toastColor);
  }
}
