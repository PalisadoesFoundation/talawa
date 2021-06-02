import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/locator.dart';

class ProgressDialogViewModel extends BaseModel {
  late ConnectivityResult connectivityResult;
  bool connectivityPresent = false;
  initialise() async {
    setState(ViewState.busy);
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      connectivityPresent = false;
      Future.delayed(const Duration(seconds: 2))
          .then((value) => locator<NavigationService>().pop());
    } else {
      connectivityPresent = true;
    }
    setState(ViewState.idle);
  }
}
