// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// ProgressDialogViewModel class helps to serve the data and
/// to react to user's input for Progress Dialog Widget.
class ProgressDialogViewModel extends BaseModel {
  late ConnectivityResult connectivityResult;
  bool connectivityPresent = false;

  // initialiser
  Future<void> initialise() async {
    setState(ViewState.busy);
    connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      connectivityPresent = false;
      Future.delayed(const Duration(seconds: 2))
          .then((value) => navigationService.pop());
    } else {
      connectivityPresent = true;
    }
    setState(ViewState.idle);
  }
}
