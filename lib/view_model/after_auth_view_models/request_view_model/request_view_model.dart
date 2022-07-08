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
  List<Request> _requests = [];
  final Set<String> _uniqueRequestIds = {};
  late StreamSubscription _currentOrganizationStreamSubscription;
  late final List<Request> _bufferRequests;
  List<Request> get requests => _requests;
  RequestService get requestService => _requestService;
  String get emptyListMessage => _emptyListMessage;


  Future<void> fetchNewRequests() async {
    setState(ViewState.busy);
    notifyListeners();
    await _requestService.getRequests();
    setState(ViewState.idle);
  }

  Future<void> refreshEvents() async {
    setState(ViewState.busy);
    _requests.clear();
    _uniqueRequestIds.clear();
    await _requestService.getRequests();
    setState(ViewState.idle);
  }

  Future<void> initialise() async {
    setState(ViewState.busy);
    _currentOrganizationStreamSubscription = userConfig.currentOrgInfoStream
        .listen((updatedOrganization) => refreshEvents());
    await _requestService.getRequests();

   
    _bufferRequests = _requests;
    setState(ViewState.idle);
  }

 
  // void _parseRequestDateTime(Request newRequest) {
  //   final DateTime _dateTime = DateTime.fromMicrosecondsSinceEpoch(
  //     int.parse(newRequest.dateTime!),
  //   ).toLocal();
    
  //   newRequest.dateTime = DateFormat('yMd').format(_dateTime);
   
  //   _requests.insert(0, newRequest);
  // }

  // Future<void> rejectRequest({required String requestId}) async {
  //   navigationService.pushDialog(
  //     CustomAlertDialog(
  //       reverse: true,
  //       dialogSubTitle: 'Are you sure you want to reject this request?',
  //       successText: 'Delete',
  //       success: () {
  //         navigationService.pop();
  //         _requestService.rejectRequest(requestId).then(
  //           (result) async {
  //             if (result != null) {
  //               navigationService.pop();
  //               setState(ViewState.busy);
  //               print(result);
  //               _uniqueRequestIds.remove(RequestId);
  //               _requests.removeWhere((element) => element.id == requestId);
  //               await Future.delayed(const Duration(milliseconds: 500));
  //               setState(ViewState.idle);
  //             }
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }



  @override
  void dispose() {
    _requestStreamSubscription.cancel();
    _currentOrganizationStreamSubscription.cancel();
    super.dispose();
  }
}
