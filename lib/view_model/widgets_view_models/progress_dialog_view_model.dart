import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

/// ProgressDialogViewModel class helps to serve the data.
///
/// to react to user's input for Progress Dialog Widget.
class ProgressDialogViewModel extends BaseModel {
  /// Result of connectivity status.
  late ConnectivityResult connectivityResult;

  /// Flag for connectivity presence.
  bool connectivityPresent = false;

  /// Initializes the state of the component by checking the online status and updating the view accordingly.
  ///
  /// This method performs the following actions:
  /// 1. Sets the view state to busy to indicate that an initialization process is underway.
  /// 2. Checks the online status of the application. 
  ///    - If the app is offline, it sets the `connectivityPresent` flag to `false`.
  ///    - If the app is online, it sets the `connectivityPresent` flag to `true`.
  /// 3. Updates the view state to idle after the online status check is complete.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
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
