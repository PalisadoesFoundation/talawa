import 'dart:async';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/request/request_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/request_queries.dart';

class RequestService {
  RequestService() {
    _requestStream = _requestStreamController.stream.asBroadcastStream();
    _currentOrg = _userConfig.currentOrg;
    _userConfig.initialiseStream();
    setOrgStreamSubscription();
  }

  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();

  late OrgInfo _currentOrg;
  late StreamSubscription _currentOrganizationStreamSubscription;
  late Stream<Request> _requestStream;

  final StreamController<Request> _requestStreamController =
      StreamController<Request>();
  Stream<Request> get requestStream => _requestStream;

  void setOrgStreamSubscription() {
    _currentOrganizationStreamSubscription =
        _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
      _currentOrg = updatedOrganization;
    });
  }

 Future<void> getRequests() async {
    await _dbFunctions.refreshAccessToken(userConfig.currentUser.refreshToken!);
    _dbFunctions.init();
    final String currentOrgID = _currentOrg.id!;
    final String mutation = RequestQueries().getRequests(currentOrgID);
    final result = await _dbFunctions.gqlAuthMutation(mutation);
    if (result == null) return;
    final List requestsJson = result.data!["membershipRequest"] as List;
    requestsJson.forEach((eventJsonData) {
      final Request request = Request.fromJson(eventJsonData as Map<String, dynamic>);
      _requestStreamController.add(request);
    });
  }



   void dispose() {
    _currentOrganizationStreamSubscription.cancel();
  }

}
