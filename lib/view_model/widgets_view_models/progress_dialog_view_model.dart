// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

/// ProgressDialogViewModel class helps to serve the data and
/// to react to user's input for Progress Dialog Widget.
class ProgressDialogViewModel extends BaseModel {
  late ConnectivityResult connectivityResult;
  bool connectivityPresent = false;

  // initialiser
  Future<void> initialise() async {
    setState(ViewState.busy);
    if (!AppConnectivity.isOnline) {
      connectivityPresent = false;
    } else {
      connectivityPresent = true;
    }
    setState(ViewState.idle);
  }
}
