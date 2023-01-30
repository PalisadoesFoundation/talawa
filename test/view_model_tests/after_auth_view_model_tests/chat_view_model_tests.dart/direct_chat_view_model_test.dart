import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/base_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  group('Test DirectChatViewModel', () {
    testSetupLocator();
    late DirectChatViewModel directChatViewModel;

    setUp(() {
      registerServices();
      directChatViewModel = DirectChatViewModel();
    });

    tearDown(() {
      unregisterServices();
    });

    test('Test DirectChatViewModel extends BaseModel', () {
      expect(directChatViewModel, isA<BaseModel>());
    });

    test('Test initial value of fields in DirectChatViewModel', () {
      expect(directChatViewModel.listKey, isA<GlobalKey<AnimatedListState>>());
      expect(directChatViewModel.chatState, ChatState.initial);
      expect(directChatViewModel.chats, []);
      expect(directChatViewModel.chatMessagesByUser, {});
    });

    test('Test refreshChats', () {
      directChatViewModel.refreshChats();
      expect(directChatViewModel.chats, []);
    });

    test('Test printChats', () {
      final chats = directChatViewModel.chats;
      directChatViewModel.printChats();
      expect(directChatViewModel.chats, equals(chats));
    });

    test('Test initialise', () async {
      final chats = directChatViewModel.chats;
      final future = directChatViewModel.initialise();
      expect(directChatViewModel.chatState, ChatState.loading);
      await future;
      expect(directChatViewModel.chats, chats);
      expect(directChatViewModel.chatState, ChatState.complete);
    });

    test('Test getChatMessages', () async {
      final future = directChatViewModel.getChatMessages('123');
      expect(directChatViewModel.chatMessagesByUser, {});
      expect(directChatViewModel.chatState, ChatState.loading);
      await future;
      expect(directChatViewModel.chatMessagesByUser, {});
      expect(directChatViewModel.chatState, ChatState.complete);
    });

    test('Test sendMessageToDirectChat', () async {
      final future =
          directChatViewModel.sendMessageToDirectChat('123', 'content');
      expect(directChatViewModel.chatState, ChatState.loading);
      await future;
      expect(directChatViewModel.chatMessagesByUser, {});
      expect(directChatViewModel.chatState, ChatState.complete);
    });

    test('Test chatName', () {
      final chats = directChatViewModel.chats;
      directChatViewModel.chatName('123');
      expect(directChatViewModel.chats, chats);
    });
  });
}
