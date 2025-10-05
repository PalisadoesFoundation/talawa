import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart' as service_locator;
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/base_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    service_locator.locator<GraphqlConfig>().test();
    service_locator.locator<SizeConfig>().test();
  });

  group('DirectChatViewModel', () {
    late DirectChatViewModel viewModel;
    late ChatService chatService;
    late UserConfig userConfig;
    late NavigationService navigationService;

    setUp(() {
      registerServices();
      chatService = service_locator.locator<ChatService>();
      userConfig = service_locator.locator<UserConfig>();
      navigationService = service_locator.locator<NavigationService>();
      viewModel = DirectChatViewModel();
    });

    tearDown(() {
      unregisterServices();
    });

    test('initial state is correct', () {
      expect(viewModel, isA<BaseModel>());
      expect(viewModel.listKey, isA<GlobalKey<AnimatedListState>>());
      expect(viewModel.chatState, ChatState.initial);
      expect(viewModel.chats, isEmpty);
      expect(viewModel.chatMessagesByUser, isEmpty);
    });

    group('initialise', () {
      test('sets up chat stream and fetches initial chats', () async {
        final chatStreamController = StreamController<Chat>();
        when(chatService.chatListStream)
            .thenAnswer((_) => chatStreamController.stream);
        when(chatService.getChatsByUser()).thenAnswer((_) async {
          return [];
        });
        final currentUser = User(id: 'currentUser');
        when(userConfig.currentUser).thenReturn(currentUser);

        await viewModel.initialise();

        expect(viewModel.chatState, ChatState.complete);

        final chat1 = Chat(
          id: 'chat1',
          members: [ChatUser(id: 'currentUser'), ChatUser(id: 'otherUser')],
        );
        chatStreamController.add(chat1);

        await Future.delayed(Duration.zero);

        expect(viewModel.chats, hasLength(1));
        expect(viewModel.chats.first.id, 'chat1');

        chatStreamController.close();
      });

      test('filters chats using ChatUtils.isDirectChat', () async {
        final chatStreamController = StreamController<Chat>();
        when(chatService.chatListStream)
            .thenAnswer((_) => chatStreamController.stream);
        when(chatService.getChatsByUser()).thenAnswer((_) async => []);

        await viewModel.initialise();

        // Add a direct chat (exactly 2 members) - should be included
        final directChat = Chat(
          id: 'directChat1',
          members: [
            ChatUser(id: 'user1'),
            ChatUser(id: 'user2'),
          ],
        );
        chatStreamController.add(directChat);
        await Future.delayed(Duration.zero);

        expect(viewModel.chats, hasLength(1));
        expect(viewModel.chats.first.id, 'directChat1');

        // Add a group chat (more than 2 members) - should be filtered out
        final groupChat = Chat(
          id: 'groupChat1',
          members: [
            ChatUser(id: 'user1'),
            ChatUser(id: 'user2'),
            ChatUser(id: 'user3'),
          ],
        );
        chatStreamController.add(groupChat);
        await Future.delayed(Duration.zero);

        // Should still only have the direct chat
        expect(viewModel.chats, hasLength(1));
        expect(viewModel.chats.first.id, 'directChat1');

        chatStreamController.close();
      });

      test('handles empty members list in chat filtering', () async {
        final chatStreamController = StreamController<Chat>();
        when(chatService.chatListStream)
            .thenAnswer((_) => chatStreamController.stream);
        when(chatService.getChatsByUser()).thenAnswer((_) async => []);

        await viewModel.initialise();

        // Add a chat with no members - should be filtered out
        final emptyChat = Chat(
          id: 'emptyChat1',
          members: [],
        );
        chatStreamController.add(emptyChat);
        await Future.delayed(Duration.zero);

        expect(viewModel.chats, hasLength(0));

        // Add a chat with null members - should be filtered out
        final nullMembersChat = Chat(
          id: 'nullMembersChat1',
          members: null,
        );
        chatStreamController.add(nullMembersChat);
        await Future.delayed(Duration.zero);

        expect(viewModel.chats, hasLength(0));

        chatStreamController.close();
      });

      test('prevents duplicate chats using unique chat IDs', () async {
        final chatStreamController = StreamController<Chat>();
        when(chatService.chatListStream)
            .thenAnswer((_) => chatStreamController.stream);
        when(chatService.getChatsByUser()).thenAnswer((_) async => []);

        await viewModel.initialise();

        // Add the same direct chat twice
        final directChat = Chat(
          id: 'directChat1',
          members: [
            ChatUser(id: 'user1'),
            ChatUser(id: 'user2'),
          ],
        );

        chatStreamController.add(directChat);
        await Future.delayed(Duration.zero);

        // Add the same chat again
        chatStreamController.add(directChat);
        await Future.delayed(Duration.zero);

        // Should only have one chat in the list
        expect(viewModel.chats, hasLength(1));
        expect(viewModel.chats.first.id, 'directChat1');

        chatStreamController.close();
      });

      test('handles chat with null ID and prints debug message', () async {
        final chatStreamController = StreamController<Chat>();
        when(chatService.chatListStream)
            .thenAnswer((_) => chatStreamController.stream);
        when(chatService.getChatsByUser()).thenAnswer((_) async => []);

        await viewModel.initialise();

        // Add a chat with null ID - should trigger debugPrint
        final chatWithNullId = Chat(
          id: null, // This will trigger the debugPrint
          name: 'Test Chat',
        );

        chatStreamController.add(chatWithNullId);
        await Future.delayed(Duration.zero);

        // The chat should not be added to the list
        expect(viewModel.chats, hasLength(0));

        chatStreamController.close();
      });

      test('inserts new chats at the beginning of the list', () async {
        final chatStreamController = StreamController<Chat>();
        when(chatService.chatListStream)
            .thenAnswer((_) => chatStreamController.stream);
        when(chatService.getChatsByUser()).thenAnswer((_) async => []);

        await viewModel.initialise();

        // Add first direct chat
        final firstChat = Chat(
          id: 'chat1',
          members: [
            ChatUser(id: 'user1'),
            ChatUser(id: 'user2'),
          ],
        );
        chatStreamController.add(firstChat);
        await Future.delayed(Duration.zero);

        // Add second direct chat
        final secondChat = Chat(
          id: 'chat2',
          members: [
            ChatUser(id: 'user3'),
            ChatUser(id: 'user4'),
          ],
        );
        chatStreamController.add(secondChat);
        await Future.delayed(Duration.zero);

        // Second chat should be at index 0 (inserted at beginning)
        expect(viewModel.chats, hasLength(2));
        expect(viewModel.chats[0].id, 'chat2');
        expect(viewModel.chats[1].id, 'chat1');

        chatStreamController.close();
      });
    });

    group('getChatMessages', () {
      test('fetches initial messages and subscribes to new ones', () async {
        const chatId = 'chat1';
        final initialMessage = ChatMessage(id: 'msg1', body: 'Hello');
        final initialChat = Chat(id: chatId, messages: [initialMessage]);
        final newMessageStream = StreamController<ChatMessage>();
        when(chatService.getChatDetails(chatId, isInitialLoad: true))
            .thenAnswer((_) async => initialChat);
        when(chatService.subscribeToChatMessages(chatId))
            .thenAnswer((_) => newMessageStream.stream);

        await viewModel.getChatMessages(chatId);

        expect(viewModel.chatMessagesByUser[chatId], hasLength(1));
        expect(viewModel.chatMessagesByUser[chatId]!.first.body, 'Hello');

        final newMessage = ChatMessage(id: 'msg2', body: 'World');
        newMessageStream.add(newMessage);

        await Future.delayed(Duration.zero);

        expect(viewModel.chatMessagesByUser[chatId], hasLength(2));
        expect(viewModel.chatMessagesByUser[chatId]!.last.body, 'World');

        newMessageStream.close();
      });
    });

    group('loadMoreMessages', () {
      test('prepends older messages to the list', () async {
        const chatId = 'chat1';
        viewModel.chatMessagesByUser[chatId] = [
          ChatMessage(id: 'msg2', body: 'Newer'),
        ];
        final olderMessages = [ChatMessage(id: 'msg1', body: 'Older')];

        when(chatService.hasMoreMessages(chatId)).thenReturn(true);
        when(chatService.loadMoreMessages(chatId))
            .thenAnswer((_) async => olderMessages);

        await viewModel.loadMoreMessages(chatId);

        expect(viewModel.chatMessagesByUser[chatId], hasLength(2));
        expect(viewModel.chatMessagesByUser[chatId]!.first.body, 'Older');
      });
    });

    group('sendMessageToDirectChat', () {
      test('calls chat service to send a message', () async {
        const chatId = 'chat1';
        const messageBody = 'Test message';
        final sentMessage = ChatMessage(id: 'newMsg', body: messageBody);
        when(
          chatService.sendMessage(
            chatId: chatId,
            body: messageBody,
          ),
        ).thenAnswer((_) async => sentMessage);

        await viewModel.sendMessageToDirectChat(chatId, messageBody);

        verify(
          chatService.sendMessage(
            chatId: chatId,
            body: messageBody,
          ),
        ).called(1);
        expect(viewModel.chatState, ChatState.complete);
      });
    });

    group('chatName', () {
      test('returns the name of the other user in a direct chat', () {
        final currentUser = User(id: 'currentUser');
        when(userConfig.currentUser).thenReturn(currentUser);

        final otherUser = ChatUser(id: 'otherUser', firstName: 'John');
        final chat = Chat(
          id: 'chat1',
          members: [ChatUser(id: 'currentUser'), otherUser],
        );
        viewModel.chats.add(ChatListTileDataModel.fromChat(chat));

        final name = viewModel.chatName('chat1');
        expect(name, 'John');
      });
    });

    group('refreshChats', () {
      test('clears existing chats and fetches again', () {
        final chat = Chat(id: 'chat1');
        viewModel.chats.add(ChatListTileDataModel.fromChat(chat));
        expect(viewModel.chats, isNotEmpty);

        when(
          navigationService.showTalawaErrorSnackBar(
            'Chats Refreshed',
            MessageType.info,
          ),
        ).thenReturn(null);
        viewModel.refreshChats();

        expect(viewModel.chats, isEmpty);
        verify(chatService.getChatsByUser()).called(1);
      });
    });

    group('dispose', () {
      test('cancels stream subscriptions', () async {
        final chatStreamController = StreamController<Chat>();
        final messageStreamController = StreamController<ChatMessage>();
        when(chatService.chatListStream)
            .thenAnswer((_) => chatStreamController.stream);
        when(chatService.subscribeToChatMessages('someId'))
            .thenAnswer((_) => messageStreamController.stream);
        when(chatService.getChatDetails('someId', isInitialLoad: true))
            .thenAnswer((_) async => null);

        await viewModel.initialise();
        await viewModel.getChatMessages('someId');

        expect(chatStreamController.hasListener, isTrue);
        expect(messageStreamController.hasListener, isTrue);

        viewModel.dispose();

        expect(chatStreamController.hasListener, isFalse);
        expect(messageStreamController.hasListener, isFalse);
      });
    });

    group('hasMoreMessages', () {
      test('returns result from chat service', () {
        const chatId = 'chat1';
        when(chatService.hasMoreMessages(chatId)).thenReturn(true);

        final result = viewModel.hasMoreMessages(chatId);

        expect(result, isTrue);
        verify(chatService.hasMoreMessages(chatId)).called(1);
      });

      test('returns false when chat service returns false', () {
        const chatId = 'chat1';
        when(chatService.hasMoreMessages(chatId)).thenReturn(false);

        final result = viewModel.hasMoreMessages(chatId);

        expect(result, isFalse);
        verify(chatService.hasMoreMessages(chatId)).called(1);
      });
    });
  });
}
