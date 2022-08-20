import 'dart:async';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/request/request_model.dart';
import 'package:talawa/services/request_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class RequestViewModel extends BaseModel {
  final _requestService = locator<RequestService>();
  late StreamSubscription _requestStreamSubscription;

  final String _emptyListMessage = "Looks like there aren't any requests.";
  final List<Request> _requests = [];
  final Set<String> _uniqueRequestIds = {};
  late StreamSubscription _currentOrganizationStreamSubscription;
  List<Request> get requests => _requests;
  RequestService get requestService => _requestService;
  String get emptyListMessage => _emptyListMessage;

  Future<void> fetchNewRequests() async {
    setState(ViewState.busy);
    notifyListeners();
    await _requestService.getRequests();
    setState(ViewState.idle);
  }

  Future<void> refreshRequests() async {
    setState(ViewState.busy);
    _requests.clear();
    _uniqueRequestIds.clear();
    await _requestService.getRequests();
    setState(ViewState.idle);
  }

  Future<void> initialise() async {
    setState(ViewState.busy);
    _currentOrganizationStreamSubscription = userConfig.currentOrgInfoStream
        .listen((updatedOrganization) => refreshRequests());
    await _requestService.getRequests();
    _requestStreamSubscription = _requestService.requestStream.listen(
      (newRequest) => checkIfExistsAndAddNewRequest(newRequest),
    );

    setState(ViewState.idle);
  }

  Future<void> checkIfExistsAndAddNewRequest(Request newRequest) async {
    if (!_uniqueRequestIds.contains(newRequest.id)) {
      _uniqueRequestIds.add(newRequest.id!);
      _requests.insert(0, newRequest);
      notifyListeners();
    }
  }

  Future<void> acceptRequest({required String requestId}) async {
    setState(ViewState.busy);
    notifyListeners();
    await _requestService.acceptRequest(requestId);
    navigationService.pop();
    refreshRequests();
    setState(ViewState.idle);
  }

  Future<void> rejectRequest({required String requestId}) async {
    setState(ViewState.busy);
    notifyListeners();
    await _requestService.rejectRequest(requestId);
    navigationService.pop();
    refreshRequests();
    setState(ViewState.idle);
  }

  @override
  void dispose() {
    _requestStreamSubscription.cancel();
    _currentOrganizationStreamSubscription.cancel();
    super.dispose();
  }
}
