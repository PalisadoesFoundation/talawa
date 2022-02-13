import 'dart:async';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class DirectChatViewModel extends BaseModel {
  final ChatService _chatService = locator<ChatService>();
  late StreamSubscription _chatSubscription;

  Future<void> initialise() async {
    setState(ViewState.busy);
    await _chatService.getDirectChatsByUserId();
    setState(ViewState.idle);
  }

  Future<void> getDirectChatList() async {
    await _chatService.getDirectChatsByUserId();
  }
  
}
