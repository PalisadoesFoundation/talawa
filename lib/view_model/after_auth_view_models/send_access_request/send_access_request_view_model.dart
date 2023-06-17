import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/base_view_model.dart';

class SendAccessRequestViewModel extends BaseModel {
  late DataBaseMutationFunctions _dbFunctions;

  void initialise() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
  }

  Future<void> sendMemberShipRequest() async {
    try {
      //TODO: Add the variable when the backend is ready

      await _dbFunctions.gqlAuthMutation(
        Queries().sendMembershipRequest("orgId"),
      );
    } catch (e) {
      navigationService.showTalawaErrorSnackBar(
          e.toString(), MessageType.error);
    }
  }
}
