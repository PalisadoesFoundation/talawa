import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:talawa/utils/ui_scaling.dart';

ProgressDialog progressDialog;

Future<void> showProgress(BuildContext context, String message,
    {@required bool isDismissible}) async {
  progressDialog = ProgressDialog(context,
      type: ProgressDialogType.Normal, isDismissible: isDismissible);
  progressDialog.style(
      message: message,
      borderRadius: SizeConfig.safeBlockVertical * 1.25,
      progressWidget: Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockVertical),
          child: const CircularProgressIndicator(
            backgroundColor: Colors.white,
          )),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: const TextStyle(
          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600));
  await progressDialog.show();
}

updateProgress(String message) {
  progressDialog.update(message: message);
}

hideProgress() async {
  await progressDialog.hide();
}
