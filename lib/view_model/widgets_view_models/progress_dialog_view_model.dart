import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/base_view_model.dart';

class ProgressDialogViewModel extends BaseModel {
  late ConnectivityResult connectivityResult;
  bool connectivityPresent = false;

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
