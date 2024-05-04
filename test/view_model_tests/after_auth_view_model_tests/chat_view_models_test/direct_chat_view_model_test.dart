// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/base_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  registerServices();

  group('Test DirectChatViewModel', () {
    final DirectChatViewModel directChatViewModel = DirectChatViewModel();
    final ChatService chatService = locator<ChatService>();
    final UserConfig userConfig = locator<UserConfig>();

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

    test('Test initialise', () async {
      final chats = directChatViewModel.chats;

      final future = directChatViewModel.initialise();

      expect(directChatViewModel.chatState, ChatState.loading);
      await future;
      expect(directChatViewModel.chats, chats);
      expect(directChatViewModel.chatState, ChatState.complete);
    });

    test('Test getChatMessages', () async {
      final ChatMessage chatMessage =
          ChatMessage('11', null, 'message11', null);
      final StreamController<ChatMessage> chatMessageController =
          StreamController<ChatMessage>();
      final Stream<ChatMessage> messagestream =
          chatMessageController.stream.asBroadcastStream();

      when(chatService.chatMessagesStream)
          .thenAnswer((realInvocation) => messagestream);
      when(chatService.getDirectChatMessagesByChatId('1')).thenAnswer(
        (realInvocation) async => chatMessageController.add(chatMessage),
      );

      final future = directChatViewModel.getChatMessages('1');

      expect(directChatViewModel.chatMessagesByUser, {});
      expect(directChatViewModel.chatState, ChatState.loading);

      await future;

      expect(directChatViewModel.chatMessagesByUser['1'], [chatMessage]);
      expect(directChatViewModel.chatState, ChatState.complete);
    });

    test('Test sendMessageToDirectChat', () async {
      final List<ChatMessage> chatMessages = [
        ChatMessage('11', null, 'message11', null),
        ChatMessage('22', null, 'message22', null),
      ];
      final StreamController<ChatMessage> chatMessageController =
          StreamController<ChatMessage>();
      final Stream<ChatMessage> messagestream =
          chatMessageController.stream.asBroadcastStream();

      when(chatService.chatMessagesStream)
          .thenAnswer((realInvocation) => messagestream);
      when(chatService.getDirectChatMessagesByChatId('1')).thenAnswer(
        (realInvocation) async => chatMessageController.add(chatMessages[0]),
      );
      when(chatService.sendMessageToDirectChat('1', 'content')).thenAnswer(
        (realInvocation) async => chatMessageController.add(chatMessages[1]),
      );

      await directChatViewModel.getChatMessages('1');
      final future =
          directChatViewModel.sendMessageToDirectChat('1', 'content');

      expect(directChatViewModel.chatState, ChatState.loading);

      await future;

      for (int index = 0; index < chatMessages.length; index++) {
        final message = directChatViewModel.chatMessagesByUser['1']![index];
        expect(message.id, chatMessages[index].id);
      }

      expect(directChatViewModel.chatState, ChatState.complete);
    });

    test('Test chatName', () async {
      final User currentUser = User(id: '1', firstName: 'first_user');
      final ChatUser user1 = ChatUser(id: '1', firstName: 'first_user');
      final ChatUser user2 = ChatUser(id: '2', firstName: 'second_user');
      final List<ChatUser> users = [
        user1,
        user2,
      ];
      final ChatListTileDataModel chatListTileDataModel =
          ChatListTileDataModel(users, 'chat_id');
      final StreamController<ChatListTileDataModel> controller =
          StreamController<ChatListTileDataModel>();
      final Stream<ChatListTileDataModel> stream = controller.stream;

      when(chatService.chatListStream).thenAnswer((realInvocation) {
        return stream;
      });
      when(chatService.getDirectChatsByUserId()).thenAnswer(
        (realInvocation) async => controller.add(chatListTileDataModel),
      );
      when(userConfig.currentUser).thenAnswer((realInvocation) => currentUser);

      await directChatViewModel.initialise();
      directChatViewModel.chatName('chat_id');

      expect(directChatViewModel.name, 'second_user');
    });

    test('Test dispose', () {
      directChatViewModel.dispose();
    });
  });
}
