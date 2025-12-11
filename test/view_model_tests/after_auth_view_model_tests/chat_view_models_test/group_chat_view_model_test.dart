import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/chat_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    testSetupLocator();
  });

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('GroupChatViewModel Tests', () {
    late GroupChatViewModel model;
    late ChatService mockChatService;
    late UserConfig mockUserConfig;

    setUp(() {
      model = GroupChatViewModel();
      mockChatService = locator<ChatService>();
      mockUserConfig = locator<UserConfig>();
    });

    group('Initialization Tests', () {
      test('should initialize with correct default values', () {
        expect(model.listKey, isA<GlobalKey<AnimatedListState>>());
        expect(model.chatState, ChatState.initial);
        expect(model.name, isNull);
        expect(model.groupChats, isEmpty);
        expect(model.chatMessagesByUser, isEmpty);
      });

      test('should set chatState to loading during initialization', () async {
        // Mock empty stream
        final StreamController<Chat> chatController = StreamController<Chat>();
        when(mockChatService.chatListStream)
            .thenAnswer((_) => chatController.stream);
        when(mockChatService.getChatsByUser())
            .thenAnswer((_) async => <Chat>[]);

        // Start initialization
        final initFuture = model.initialise();

        // Verify loading state is set immediately
        expect(model.chatState, ChatState.loading);

        // Complete initialization
        await initFuture;
        chatController.close();
      });

      test('should listen to chat stream and filter group chats', () async {
        final StreamController<Chat> chatController = StreamController<Chat>();
        when(mockChatService.chatListStream)
            .thenAnswer((_) => chatController.stream);
        when(mockChatService.getChatsByUser())
            .thenAnswer((_) async => <Chat>[]);

        // Create test chats
        final directChat = Chat(
          id: 'direct1',
          name: 'Direct Chat',
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
          ],
        );

        final groupChat = Chat(
          id: 'group1',
          name: 'Group Chat',
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
          ],
        );

        await model.initialise();

        // Add chats to stream
        chatController.add(directChat);
        chatController.add(groupChat);

        await Future.delayed(const Duration(milliseconds: 100));

        // Should only contain group chat (3+ members)
        expect(model.groupChats.length, 1);
        expect(model.groupChats[0].id, 'group1');

        chatController.close();
      });

      test('should complete initialization and set state to complete',
          () async {
        final StreamController<Chat> chatController = StreamController<Chat>();
        when(mockChatService.chatListStream)
            .thenAnswer((_) => chatController.stream);
        when(mockChatService.getChatsByUser())
            .thenAnswer((_) async => <Chat>[]);

        await model.initialise();

        expect(model.chatState, ChatState.complete);
        chatController.close();
      });

      test('should handle null chat ID gracefully', () async {
        final StreamController<Chat> chatController = StreamController<Chat>();
        when(mockChatService.chatListStream)
            .thenAnswer((_) => chatController.stream);
        when(mockChatService.getChatsByUser())
            .thenAnswer((_) async => <Chat>[]);

        await model.initialise();

        // Add chat with null ID
        final chatWithNullId = Chat(
          id: null,
          name: 'Chat Without ID',
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
          ],
        );

        chatController.add(chatWithNullId);
        await Future.delayed(const Duration(milliseconds: 100));

        // Should not add chat with null ID
        expect(model.groupChats, isEmpty);

        chatController.close();
      });

      test('should not add duplicate group chats', () async {
        final StreamController<Chat> chatController = StreamController<Chat>();
        when(mockChatService.chatListStream)
            .thenAnswer((_) => chatController.stream);
        when(mockChatService.getChatsByUser())
            .thenAnswer((_) async => <Chat>[]);

        final groupChat = Chat(
          id: 'group1',
          name: 'Group Chat',
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
          ],
        );

        await model.initialise();

        // Add same chat multiple times
        chatController.add(groupChat);
        chatController.add(groupChat);
        await Future.delayed(const Duration(milliseconds: 100));

        // Should only contain one instance
        expect(model.groupChats.length, 1);

        chatController.close();
      });
    });

    group('Chat Messages Tests', () {
      test('should initialize chat messages for a group', () async {
        const chatId = 'group1';
        final mockChat = Chat(
          id: chatId,
          messages: [
            ChatMessage(
              id: 'msg1',
              body: 'Hello',
              creator: ChatUser(id: 'user1', firstName: 'User1'),
              chatId: chatId,
              createdAt: DateTime.now().toIso8601String(),
            ),
          ],
        );

        when(mockChatService.getChatDetails(chatId, isInitialLoad: true))
            .thenAnswer((_) async => mockChat);

        final StreamController<ChatMessage> messageController =
            StreamController<ChatMessage>();
        when(mockChatService.subscribeToChatMessages(chatId))
            .thenAnswer((_) => messageController.stream);

        await model.getChatMessages(chatId);

        expect(model.chatMessagesByUser[chatId], isNotNull);
        expect(model.chatMessagesByUser[chatId]!.length, 1);
        expect(model.chatMessagesByUser[chatId]![0].body, 'Hello');
        expect(model.chatState, ChatState.complete);

        messageController.close();
      });

      test('should handle new messages from subscription', () async {
        const chatId = 'group1';
        when(mockChatService.getChatDetails(chatId, isInitialLoad: true))
            .thenAnswer((_) async => Chat(id: chatId, messages: []));

        final StreamController<ChatMessage> messageController =
            StreamController<ChatMessage>();
        when(mockChatService.subscribeToChatMessages(chatId))
            .thenAnswer((_) => messageController.stream);

        await model.getChatMessages(chatId);

        final newMessage = ChatMessage(
          id: 'msg2',
          body: 'New message',
          creator: ChatUser(id: 'user2', firstName: 'User2'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        );

        messageController.add(newMessage);
        await Future.delayed(const Duration(milliseconds: 100));

        expect(model.chatMessagesByUser[chatId]!.length, 1);
        expect(model.chatMessagesByUser[chatId]![0].body, 'New message');

        messageController.close();
      });

      test('should prevent duplicate messages from subscription', () async {
        const chatId = 'group1';
        final existingMessage = ChatMessage(
          id: 'msg1',
          body: 'Existing message',
          creator: ChatUser(id: 'user1', firstName: 'User1'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        );

        when(mockChatService.getChatDetails(chatId, isInitialLoad: true))
            .thenAnswer(
          (_) async => Chat(id: chatId, messages: [existingMessage]),
        );

        final StreamController<ChatMessage> messageController =
            StreamController<ChatMessage>();
        when(mockChatService.subscribeToChatMessages(chatId))
            .thenAnswer((_) => messageController.stream);

        await model.getChatMessages(chatId);

        // Try to add the same message via subscription
        messageController.add(existingMessage);
        await Future.delayed(const Duration(milliseconds: 100));

        // Should still have only one message
        expect(model.chatMessagesByUser[chatId]!.length, 1);

        messageController.close();
      });
    });

    group('Pagination Tests', () {
      test('should return early if chat is not initialized', () async {
        const chatId = 'group1';

        await model.loadMoreMessages(chatId);

        // Should not interact with service
        verifyNever(
          mockChatService.getChatDetails('any', isInitialLoad: false),
        );
      });

      test('should return early if chat has no messages', () async {
        const chatId = 'group1';
        model.chatMessagesByUser[chatId] = [];

        await model.loadMoreMessages(chatId);

        // Should not interact with service
        verifyNever(
          mockChatService.getChatDetails('any', isInitialLoad: false),
        );
      });

      test('should prevent multiple simultaneous pagination requests',
          () async {
        const chatId = 'group1';
        model.chatMessagesByUser[chatId] = [
          ChatMessage(
            id: 'msg1',
            body: 'Message',
            creator: ChatUser(id: 'user1', firstName: 'User1'),
            chatId: chatId,
            createdAt: DateTime.now().toIso8601String(),
          ),
        ];

        when(mockChatService.hasMoreMessages(chatId)).thenReturn(true);
        when(mockChatService.loadMoreMessages(chatId)).thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return <ChatMessage>[];
        });

        // Start multiple pagination requests
        final future1 = model.loadMoreMessages(chatId);
        final future2 = model.loadMoreMessages(chatId);

        await Future.wait([future1, future2]);

        // Should only call service once
        verify(mockChatService.loadMoreMessages(chatId)).called(1);
      });

      test('should load more messages successfully', () async {
        const chatId = 'group1';
        final existingMessage = ChatMessage(
          id: 'msg2',
          body: 'Newer message',
          creator: ChatUser(id: 'user1', firstName: 'User1'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        );

        model.chatMessagesByUser[chatId] = [existingMessage];

        final olderMessage = ChatMessage(
          id: 'msg1',
          body: 'Older message',
          creator: ChatUser(id: 'user2', firstName: 'User2'),
          chatId: chatId,
          createdAt: DateTime.now()
              .subtract(const Duration(hours: 1))
              .toIso8601String(),
        );

        when(mockChatService.hasMoreMessages(chatId)).thenReturn(true);
        when(mockChatService.loadMoreMessages(chatId))
            .thenAnswer((_) async => [olderMessage]);

        await model.loadMoreMessages(chatId);

        expect(model.chatMessagesByUser[chatId]!.length, 2);
        expect(model.chatMessagesByUser[chatId]![0].body, 'Older message');
        expect(model.chatMessagesByUser[chatId]![1].body, 'Newer message');
      });

      test('should handle errors during pagination', () async {
        const chatId = 'group1';
        model.chatMessagesByUser[chatId] = [
          ChatMessage(
            id: 'msg1',
            body: 'Message',
            creator: ChatUser(id: 'user1', firstName: 'User1'),
            chatId: chatId,
            createdAt: DateTime.now().toIso8601String(),
          ),
        ];

        when(mockChatService.hasMoreMessages(chatId)).thenReturn(true);
        when(mockChatService.loadMoreMessages(chatId))
            .thenThrow(Exception('Network error'));

        await model.loadMoreMessages(chatId);

        expect(model.isLoadingMoreMessages(chatId), false);
      });

      test('should check if has more messages', () {
        const chatId = 'group1';
        when(mockChatService.hasMoreMessages(chatId)).thenReturn(true);

        final result = model.hasMoreMessages(chatId);

        expect(result, true);
        verify(mockChatService.hasMoreMessages(chatId)).called(1);
      });

      test('should return loading state correctly', () {
        const chatId = 'group1';

        expect(model.isLoadingMoreMessages(chatId), false);

        // Simulate loading state
        model.chatMessagesByUser[chatId] = [
          ChatMessage(
            id: 'msg1',
            body: 'Message',
            creator: ChatUser(id: 'user1', firstName: 'User1'),
            chatId: chatId,
            createdAt: DateTime.now().toIso8601String(),
          ),
        ];
      });
    });

    group('Send Message Tests', () {
      test('should send message successfully', () async {
        const chatId = 'group1';
        const messageText = 'Hello everyone!';

        final sentMessage = ChatMessage(
          id: 'msg1',
          body: messageText,
          creator: ChatUser(id: 'user1', firstName: 'User1'),
          chatId: chatId,
          createdAt: DateTime.now().toIso8601String(),
        );

        when(mockChatService.sendMessage(chatId: chatId, body: messageText))
            .thenAnswer((_) async => sentMessage);

        await model.sendMessageToGroupChat(chatId, messageText);

        verify(mockChatService.sendMessage(chatId: chatId, body: messageText))
            .called(1);
        expect(model.chatState, ChatState.complete);
      });

      test('should handle send message failure', () async {
        const chatId = 'group1';
        const messageText = 'Hello everyone!';

        when(mockChatService.sendMessage(chatId: chatId, body: messageText))
            .thenAnswer((_) async => null);

        await model.sendMessageToGroupChat(chatId, messageText);

        verify(mockChatService.sendMessage(chatId: chatId, body: messageText))
            .called(1);
        expect(model.chatState, ChatState.complete);
      });

      test('should handle send message error', () async {
        const chatId = 'group1';
        const messageText = 'Hello everyone!';

        when(mockChatService.sendMessage(chatId: chatId, body: messageText))
            .thenThrow(Exception('Network error'));

        await model.sendMessageToGroupChat(chatId, messageText);

        expect(model.chatState, ChatState.complete);
      });
    });

    group('Group Chat Management Tests', () {
      test('should create group chat successfully', () async {
        const groupName = 'Test Group';
        const description = 'Test Description';
        final memberIds = ['user2', 'user3'];
        const currentUserId = 'user1';

        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User1'));

        final createdChat = Chat(
          id: 'group1',
          name: groupName,
          description: description,
        );

        when(
          mockChatService.createChat(
            name: groupName,
            description: description,
          ),
        ).thenAnswer((_) async => createdChat);
        when(
          mockChatService.createChatMembership(
            chatId: 'group1',
            userId: currentUserId,
          ),
        ).thenAnswer((_) async => true);
        when(
          mockChatService.createChatMembership(
            chatId: 'group1',
            userId: 'user2',
          ),
        ).thenAnswer((_) async => true);
        when(
          mockChatService.createChatMembership(
            chatId: 'group1',
            userId: 'user3',
          ),
        ).thenAnswer((_) async => true);
        when(mockChatService.getChatsByUser())
            .thenAnswer((_) async => <Chat>[]);

        final result = await model.createGroupChat(
          groupName: groupName,
          description: description,
          memberIds: memberIds,
        );

        expect(result, isNotNull);
        expect(result!.id, 'group1');
        expect(result.name, groupName);
        verify(
          mockChatService.createChat(
            name: groupName,
            description: description,
          ),
        ).called(1);
        verify(
          mockChatService.createChatMembership(
            chatId: 'group1',
            userId: currentUserId,
          ),
        ).called(1);
        verify(
          mockChatService.createChatMembership(
            chatId: 'group1',
            userId: 'user2',
          ),
        ).called(1);
        verify(
          mockChatService.createChatMembership(
            chatId: 'group1',
            userId: 'user3',
          ),
        ).called(1);
      });

      test('should handle group chat creation failure', () async {
        const groupName = 'Test Group';
        final memberIds = ['user2', 'user3'];

        when(mockChatService.createChat(name: groupName, description: null))
            .thenAnswer((_) async => null);

        final result = await model.createGroupChat(
          groupName: groupName,
          memberIds: memberIds,
        );

        expect(result, isNull);
        expect(model.chatState, ChatState.complete);
      });

      test('should handle group chat creation error', () async {
        const groupName = 'Test Group';
        final memberIds = ['user2', 'user3'];

        when(mockChatService.createChat(name: groupName, description: null))
            .thenThrow(Exception('Network error'));

        final result = await model.createGroupChat(
          groupName: groupName,
          memberIds: memberIds,
        );

        expect(result, isNull);
        expect(model.chatState, ChatState.complete);
      });

      test('should handle creator addition failure during group creation',
          () async {
        const chatId = 'group1';
        const groupName = 'Test Group';
        const memberIds = ['user2', 'user3'];

        final mockChat = Chat(
          id: chatId,
          name: groupName,
          members: [],
        );

        // Mock successful chat creation but failed creator addition
        when(mockChatService.createChat(name: groupName, description: null))
            .thenAnswer((_) async => mockChat);

        when(
          mockChatService.createChatMembership(
            chatId: chatId,
            userId: 'current_user_id',
          ),
        ).thenAnswer((_) async => false); // Creator addition fails

        when(mockUserConfig.currentUser).thenReturn(
          User(id: 'current_user_id', name: 'Current'),
        );

        final result = await model.createGroupChat(
          groupName: groupName,
          memberIds: memberIds,
        );

        // Should still return the chat even if creator addition fails (debugPrint is logged)
        expect(result, isNotNull);
        expect(result?.id, chatId);
        expect(model.chatState, ChatState.complete);
        verify(
          mockChatService.createChatMembership(
            chatId: chatId,
            userId: 'current_user_id',
          ),
        ).called(1);
      });

      test('should handle member addition failure during group creation',
          () async {
        const chatId = 'group1';
        const groupName = 'Test Group';
        const memberIds = ['user2', 'user3'];

        final mockChat = Chat(
          id: chatId,
          name: groupName,
          members: [],
        );

        when(mockChatService.createChat(name: groupName, description: null))
            .thenAnswer((_) async => mockChat);

        when(mockUserConfig.currentUser).thenReturn(
          User(id: 'current_user_id', name: 'Current'),
        );

        // Mock successful creator addition but failed member addition
        when(
          mockChatService.createChatMembership(
            chatId: chatId,
            userId: 'current_user_id',
          ),
        ).thenAnswer((_) async => true);

        when(
          mockChatService.createChatMembership(
            chatId: chatId,
            userId: 'user2',
          ),
        ).thenAnswer((_) async => false); // Member addition fails

        final result = await model.createGroupChat(
          groupName: groupName,
          memberIds: memberIds,
        );

        // Should still return the chat even if some member additions fail
        expect(result, isNotNull);
        expect(result?.id, chatId);
        expect(model.chatState, ChatState.complete);
        verify(
          mockChatService.createChatMembership(
            chatId: chatId,
            userId: 'user2',
          ),
        ).called(1);
      });

      test('should handle delete group chat error', () async {
        const chatId = 'group1';

        when(mockChatService.deleteChat(chatId))
            .thenThrow(Exception('Network error'));

        final result = await model.deleteGroupChat(chatId);

        expect(result, false);
        expect(model.chatState, ChatState.complete);
        verify(mockChatService.deleteChat(chatId)).called(1);
      });

      test('should delete group chat successfully', () async {
        const chatId = 'group1';
        final groupChat = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: Chat(id: chatId, name: 'Test Group'),
        );

        model.groupChats.add(groupChat);

        when(mockChatService.deleteChat(chatId)).thenAnswer((_) async => true);

        final result = await model.deleteGroupChat(chatId);

        expect(result, true);
        expect(model.groupChats, isEmpty);
        verify(mockChatService.deleteChat(chatId)).called(1);
      });

      test('should handle delete group chat failure', () async {
        const chatId = 'group1';

        when(mockChatService.deleteChat(chatId)).thenAnswer((_) async => false);

        final result = await model.deleteGroupChat(chatId);

        expect(result, false);
        expect(model.chatState, ChatState.complete);
      });

      test('should update group details successfully', () async {
        const chatId = 'group1';
        const newName = 'Updated Group';
        const newDescription = 'Updated Description';

        final originalChat = Chat(id: chatId, name: 'Old Group');

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: originalChat,
        );
        model.groupChats.add(chatTile);

        when(
          mockChatService.updateChat(
            chatId: chatId,
            newName: newName,
            newDescription: newDescription,
          ),
        ).thenAnswer((_) async => true);

        final result = await model.updateGroupDetails(
          chatId: chatId,
          newName: newName,
          newDescription: newDescription,
        );

        expect(result, true);
        verify(
          mockChatService.updateChat(
            chatId: chatId,
            newName: newName,
            newDescription: newDescription,
          ),
        ).called(1);
      });

      test('should handle invalid group name during update', () async {
        const chatId = 'group1';
        const invalidName = ''; // Empty name is invalid

        final result = await model.updateGroupDetails(
          chatId: chatId,
          newName: invalidName,
        );

        expect(result, false);
        verifyNever(
          mockChatService.updateChat(
            chatId: 'any',
            newName: 'any',
            newDescription: 'any',
          ),
        );
      });
    });

    group('Member Management Tests', () {
      test('should add group member successfully', () async {
        const chatId = 'group1';
        const userId = 'user2';

        final originalChat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [ChatUser(id: 'user1', firstName: 'User1')],
        );

        final updatedChat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
          ],
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: originalChat,
        );
        model.groupChats.add(chatTile);

        when(mockChatService.addChatMember(chatId: chatId, userId: userId))
            .thenAnswer((_) async => true);
        when(mockChatService.getChatDetails(chatId, isInitialLoad: false))
            .thenAnswer((_) async => updatedChat);

        final result = await model.addGroupMember(
          chatId: chatId,
          userId: userId,
        );

        expect(result, true);
        expect(model.groupChats[0].chat!.members!.length, 2);
        verify(mockChatService.addChatMember(chatId: chatId, userId: userId))
            .called(1);
      });

      test('should handle add member failure', () async {
        const chatId = 'group1';
        const userId = 'user2';

        final originalChat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [ChatUser(id: 'user1', firstName: 'User1')],
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: originalChat,
        );
        model.groupChats.add(chatTile);

        when(mockChatService.addChatMember(chatId: chatId, userId: userId))
            .thenAnswer((_) async => false);

        final result = await model.addGroupMember(
          chatId: chatId,
          userId: userId,
        );

        expect(result, false);
        expect(model.chatState, ChatState.complete);
      });

      test('should handle chat not found during member addition', () async {
        const chatId = 'nonexistent';
        const userId = 'user2';

        final result = await model.addGroupMember(
          chatId: chatId,
          userId: userId,
        );

        expect(result, false);
        verifyNever(
          mockChatService.addChatMember(
            chatId: 'any',
            userId: 'any',
          ),
        );
      });

      test('should remove group member successfully', () async {
        const chatId = 'group1';
        const memberId = 'user2';
        const currentUserId = 'user1';

        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User1'));

        final originalChat = Chat(
          id: chatId,
          name: 'Test Group',
          creator: ChatUser(id: currentUserId, firstName: 'User1'),
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
            ChatUser(id: 'user4', firstName: 'User4'),
          ],
        );

        final updatedChat = Chat(
          id: chatId,
          name: 'Test Group',
          creator: ChatUser(id: currentUserId, firstName: 'User1'),
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user3', firstName: 'User3'),
            ChatUser(id: 'user4', firstName: 'User4'),
          ],
        );

        when(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: memberId,
          ),
        ).thenAnswer((_) async => true);
        when(mockChatService.getChatDetails(chatId, isInitialLoad: false))
            .thenAnswer((_) async => updatedChat);

        final result = await model.removeGroupMember(
          chatId: chatId,
          memberId: memberId,
          chat: originalChat,
        );

        expect(result, true);
        verify(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: memberId,
          ),
        ).called(1);
      });

      test('should handle remove member failure', () async {
        const chatId = 'group1';
        const memberId = 'user2';
        const currentUserId = 'user1';

        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User1'));

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          creator: ChatUser(id: currentUserId, firstName: 'User1'),
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
          ],
        );

        when(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: memberId,
          ),
        ).thenAnswer((_) async => false);

        final result = await model.removeGroupMember(
          chatId: chatId,
          memberId: memberId,
          chat: chat,
        );

        expect(result, false);
        expect(model.chatState, ChatState.complete);
      });

      test('should leave group chat successfully', () async {
        const chatId = 'group1';
        const currentUserId = 'user2';

        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User2'));

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          creator: ChatUser(id: 'user1', firstName: 'User1'),
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
            ChatUser(id: 'user4', firstName: 'User4'),
          ],
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: chat,
        );
        model.groupChats.add(chatTile);

        when(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: currentUserId,
          ),
        ).thenAnswer((_) async => true);

        final result = await model.leaveGroupChat(chatId, chat);

        expect(result, true);
        expect(model.groupChats, isEmpty);
        verify(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: currentUserId,
          ),
        ).called(1);
      });

      test('should handle add member error', () async {
        const chatId = 'group1';
        const userId = 'user2';

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [ChatUser(id: 'user1', firstName: 'User1')],
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: chat,
        );
        model.groupChats.add(chatTile);

        when(mockChatService.addChatMember(chatId: chatId, userId: userId))
            .thenThrow(Exception('Network error'));

        final result =
            await model.addGroupMember(chatId: chatId, userId: userId);

        expect(result, false);
        expect(model.chatState, ChatState.complete);
        verify(mockChatService.addChatMember(chatId: chatId, userId: userId))
            .called(1);
      });

      test('should handle remove member error', () async {
        const chatId = 'group1';
        const memberId = 'user2';
        const currentUserId = 'user1';

        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User1'));

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          creator: ChatUser(id: currentUserId, firstName: 'User1'),
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
            ChatUser(id: 'user4', firstName: 'User4'),
          ],
        );

        when(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: memberId,
          ),
        ).thenThrow(Exception('Network error'));

        final result = await model.removeGroupMember(
          chatId: chatId,
          chat: chat,
          memberId: memberId,
        );

        expect(result, false);
        expect(model.chatState, ChatState.complete);
        verify(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: memberId,
          ),
        ).called(1);
      });

      test('should handle leave group chat error', () async {
        const chatId = 'group1';
        const currentUserId = 'user2';

        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User2'));

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          creator: ChatUser(
            id: 'user1',
            firstName: 'User1',
          ), // user1 is admin, user2 is not
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
            ChatUser(
              id: 'user4',
              firstName: 'User4',
            ), // Need at least 4 members to allow leaving
          ],
        );

        when(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: currentUserId,
          ),
        ).thenThrow(Exception('Network error'));

        final result = await model.leaveGroupChat(chatId, chat);

        expect(result, false);
        expect(model.chatState, ChatState.complete);
        verify(
          mockChatService.removeChatMember(
            chatId: chatId,
            memberId: currentUserId,
          ),
        ).called(1);
      });

      test('should handle update group details error', () async {
        const chatId = 'group1';
        const newName = 'New Name';
        const newDescription = 'New Description';

        when(
          mockChatService.updateChat(
            chatId: chatId,
            newName: newName,
            newDescription: newDescription,
          ),
        ).thenThrow(Exception('Network error'));

        final result = await model.updateGroupDetails(
          chatId: chatId,
          newName: newName,
          newDescription: newDescription,
        );

        expect(result, false);
        expect(model.chatState, ChatState.complete);
        verify(
          mockChatService.updateChat(
            chatId: chatId,
            newName: newName,
            newDescription: newDescription,
          ),
        ).called(1);
      });

      test('should handle send message error', () async {
        const chatId = 'group1';
        const message = 'Test message';

        when(
          mockChatService.sendMessage(
            chatId: chatId,
            body: message,
          ),
        ).thenThrow(Exception('Network error'));

        await model.sendMessageToGroupChat(chatId, message);

        expect(model.chatState, ChatState.complete);
        verify(
          mockChatService.sendMessage(
            chatId: chatId,
            body: message,
          ),
        ).called(1);
      });
    });

    group('Utility Methods Tests', () {
      test('should check if current user is admin', () {
        const currentUserId = 'user1';
        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User1'));

        final chat = Chat(
          id: 'group1',
          name: 'Test Group',
          creator: ChatUser(id: currentUserId, firstName: 'User1'),
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
          ],
        );

        final result = model.isCurrentUserAdmin(chat);

        expect(result, true);
      });

      test('should check if current user is admin by ID', () {
        const chatId = 'group1';
        const currentUserId = 'user1';

        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User1'));

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          creator: ChatUser(id: currentUserId, firstName: 'User1'),
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
          ],
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: chat,
        );
        model.groupChats.add(chatTile);

        final result = model.isCurrentUserAdminById(chatId);

        expect(result, true);
      });

      test('should return false for admin check with non-existent chat', () {
        const chatId = 'nonexistent';

        final result = model.isCurrentUserAdminById(chatId);

        expect(result, false);
      });

      test('should get member count', () {
        const chatId = 'group1';

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
          ],
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: chat,
        );
        model.groupChats.add(chatTile);

        final result = model.getMemberCount(chatId);

        expect(result, 3);
      });

      test('should return 0 for member count with non-existent chat', () {
        const chatId = 'nonexistent';

        final result = model.getMemberCount(chatId);

        expect(result, 0);
      });

      test('should get group display name', () {
        const chatId = 'group1';
        const groupName = 'Test Group Chat';

        final chat = Chat(
          id: chatId,
          name: groupName,
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: chat,
        );
        model.groupChats.add(chatTile);

        final result = model.getGroupDisplayName(chatId);

        expect(result, 'Test Group Chat');
      });

      test('should return default name for chat without name', () {
        const chatId = 'group1';

        final chat = Chat(
          id: chatId,
          name: null,
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: chat,
        );
        model.groupChats.add(chatTile);

        final result = model.getGroupDisplayName(chatId);

        expect(result, 'Group Chat');
      });

      test('should get available members for adding to group', () {
        const chatId = 'group1';

        final orgMembers = [
          User(id: 'user1', name: 'User1'),
          User(id: 'user2', name: 'User2'),
          User(id: 'user3', name: 'User3'),
          User(id: 'user4', name: 'User4'),
        ];

        final chatMembers = [
          ChatUser(id: 'user1', firstName: 'User1'),
          ChatUser(id: 'user2', firstName: 'User2'),
        ];

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          members: chatMembers,
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: chat,
        );
        model.groupChats.add(chatTile);

        when(mockUserConfig.currentOrg).thenReturn(
          OrgInfo(
            id: 'org1',
            name: 'Test Org',
            members: orgMembers,
          ),
        );

        final result = model.getAvailableMembers(chatId);

        expect(result.length, 2);
        expect(result.any((user) => user.id == 'user3'), true);
        expect(result.any((user) => user.id == 'user4'), true);
      });

      test('should validate member removal', () {
        const chatId = 'group1';
        const memberId = 'user2';
        const currentUserId = 'user1';

        when(mockUserConfig.currentUser)
            .thenReturn(User(id: currentUserId, name: 'User1'));

        final chat = Chat(
          id: chatId,
          name: 'Test Group',
          creator: ChatUser(id: currentUserId, firstName: 'User1'),
          members: [
            ChatUser(id: 'user1', firstName: 'User1'),
            ChatUser(id: 'user2', firstName: 'User2'),
            ChatUser(id: 'user3', firstName: 'User3'),
            ChatUser(id: 'user4', firstName: 'User4'),
          ],
        );

        final chatTile = ChatListTileDataModel(
          id: chatId,
          users: [],
          chat: chat,
        );
        model.groupChats.add(chatTile);

        final result = model.validateMemberRemoval(
          chatId: chatId,
          memberId: memberId,
        );

        expect(result['isValid'], true);
      });

      test('should return error for validation with non-existent chat', () {
        const chatId = 'nonexistent';
        const memberId = 'user2';

        final result = model.validateMemberRemoval(
          chatId: chatId,
          memberId: memberId,
        );

        expect(result['isValid'], false);
        expect(result['error'], 'Chat not found');
      });

      test('should fetch group members successfully', () async {
        const chatId = 'group1';

        final mockResult = {
          'members': {
            'edges': [
              {
                'node': {
                  'id': 'user1',
                  'firstName': 'User1',
                  'lastName': 'Last1',
                },
              },
              {
                'node': {
                  'id': 'user2',
                  'firstName': 'User2',
                  'lastName': 'Last2',
                },
              },
            ],
          },
        };

        when(mockChatService.fetchChatMembers(chatId: chatId, last: 32))
            .thenAnswer((_) async => mockResult);

        final result = await model.fetchGroupMembers(chatId: chatId);

        expect(result, isNotNull);
        expect(result!.length, 2);
        expect((result[0] as Map<String, dynamic>)['id'], 'user1');
        expect((result[1] as Map<String, dynamic>)['id'], 'user2');
        verify(mockChatService.fetchChatMembers(chatId: chatId, last: 32))
            .called(1);
      });

      test('should handle fetch group members failure', () async {
        const chatId = 'group1';

        when(mockChatService.fetchChatMembers(chatId: chatId, last: 32))
            .thenAnswer((_) async => null);

        final result = await model.fetchGroupMembers(chatId: chatId);

        expect(result, isNull);
        expect(model.chatState, ChatState.complete);
      });

      test('should handle fetch group members error', () async {
        const chatId = 'group1';

        when(mockChatService.fetchChatMembers(chatId: chatId, last: 32))
            .thenThrow(Exception('Network error'));

        final result = await model.fetchGroupMembers(chatId: chatId);

        expect(result, isNull);
        expect(model.chatState, ChatState.complete);
      });
    });

    group('Refresh Tests', () {
      test('should refresh group chats', () {
        final groupChat = ChatListTileDataModel(
          id: 'group1',
          users: [],
          chat: Chat(id: 'group1', name: 'Test Group'),
        );
        model.groupChats.add(groupChat);

        when(mockChatService.getChatsByUser())
            .thenAnswer((_) async => <Chat>[]);

        model.refreshChats();

        expect(model.groupChats, isEmpty);
        expect(model.chatState, ChatState.complete);
        verify(mockChatService.getChatsByUser()).called(1);
      });
    });

    group('Dispose Tests', () {
      test('should dispose properly', () {
        model.dispose();

        // Test passes if no exceptions are thrown
        expect(true, isTrue);
      });
    });
  });
}
