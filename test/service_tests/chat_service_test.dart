import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/services/chat_core_service.dart';
import 'package:talawa/services/chat_membership_service.dart';
import 'package:talawa/services/chat_message_service.dart';
import 'package:talawa/services/chat_service.dart';

import '../helpers/test_helpers.dart';
import 'chat_service_test.mocks.dart';

@GenerateMocks([ChatCoreService, ChatMembershipService, ChatMessageService])
void main() {
  group('ChatService Delegation Tests', () {
    late MockChatCoreService mockCoreService;
    late MockChatMembershipService mockMembershipService;
    late MockChatMessageService mockMessageService;
    late ChatService chatService;

    setUp(() {
      mockCoreService = MockChatCoreService();
      mockMembershipService = MockChatMembershipService();
      mockMessageService = MockChatMessageService();

      chatService = ChatService(
        coreService: mockCoreService,
        membershipService: mockMembershipService,
        messageService: mockMessageService,
      );
    });

    group('Core Service Delegation', () {
      test('createChat delegates to core service with valid input', () async {
        // Arrange
        const testName = 'Test Chat';
        const testDescription = 'Test Description';
        final expectedChat = Chat(id: 'chat1', name: testName);

        when(
          mockCoreService.createChat(
            name: anyNamed('name'),
            description: anyNamed('description'),
          ),
        ).thenAnswer((_) async => expectedChat);

        // Act
        final result = await chatService.createChat(
          name: testName,
          description: testDescription,
        );

        // Assert
        verify(
          mockCoreService.createChat(
            name: testName,
            description: testDescription,
          ),
        ).called(1);
        expect(result, equals(expectedChat));
      });

      test('createChat trims name and handles empty name', () async {
        // Act - empty name
        final result1 = await chatService.createChat(name: '');

        // Assert - should not call core service
        verifyNever(mockCoreService.createChat(name: anyNamed('name')));
        expect(result1, isNull);

        // Act - whitespace only
        final result2 = await chatService.createChat(name: '   ');

        // Assert - should not call core service
        verifyNever(mockCoreService.createChat(name: anyNamed('name')));
        expect(result2, isNull);

        // Act - valid name with whitespace
        const trimmedName = 'Valid Chat';
        when(
          mockCoreService.createChat(
            name: anyNamed('name'),
            description: anyNamed('description'),
          ),
        ).thenAnswer((_) async => Chat(id: 'chat1', name: trimmedName));

        final result3 = await chatService.createChat(name: '  Valid Chat  ');

        // Assert - should call with trimmed name
        verify(
          mockCoreService.createChat(
            name: trimmedName,
            description: null,
          ),
        ).called(1);
        expect(result3, isNotNull);
      });

      test('getChatsByUser delegates to core service', () async {
        // Arrange
        final expectedChats = [
          Chat(id: 'chat1', name: 'Chat 1'),
          Chat(id: 'chat2', name: 'Chat 2'),
        ];

        when(mockCoreService.getChatsByUser())
            .thenAnswer((_) async => expectedChats);

        // Act
        final result = await chatService.getChatsByUser();

        // Assert
        verify(mockCoreService.getChatsByUser()).called(1);
        expect(result, equals(expectedChats));
      });

      test('deleteChat delegates to core service', () async {
        // Arrange
        const testChatId = 'chat123';
        when(mockCoreService.deleteChat(any)).thenAnswer((_) async => true);

        // Act
        final result = await chatService.deleteChat(testChatId);

        // Assert
        verify(mockCoreService.deleteChat(testChatId)).called(1);
        expect(result, isTrue);
      });

      test('updateChat delegates to core service with all parameters',
          () async {
        // Arrange
        const testChatId = 'chat123';
        const newName = 'New Name';
        const newDescription = 'New Description';

        when(
          mockCoreService.updateChat(
            chatId: anyNamed('chatId'),
            newName: anyNamed('newName'),
            newDescription: anyNamed('newDescription'),
          ),
        ).thenAnswer((_) async => true);

        // Act
        final result = await chatService.updateChat(
          chatId: testChatId,
          newName: newName,
          newDescription: newDescription,
        );

        // Assert
        verify(
          mockCoreService.updateChat(
            chatId: testChatId,
            newName: newName,
            newDescription: newDescription,
          ),
        ).called(1);
        expect(result, isTrue);
      });

      test('chatListStream delegates to core service', () {
        // Arrange
        final testStream = Stream<Chat>.fromIterable([
          Chat(id: 'chat1', name: 'Chat 1'),
        ]);
        when(mockCoreService.chatListStream).thenAnswer((_) => testStream);

        // Act
        final result = chatService.chatListStream;

        // Assert
        verify(mockCoreService.chatListStream).called(1);
        expect(result, equals(testStream));
      });
    });

    group('Membership Service Delegation', () {
      test('createChatMembership delegates to membership service', () async {
        // Arrange
        const testChatId = 'chat123';
        const testUserId = 'user456';

        when(
          mockMembershipService.createChatMembership(
            chatId: anyNamed('chatId'),
            userId: anyNamed('userId'),
          ),
        ).thenAnswer((_) async => true);

        // Act
        final result = await chatService.createChatMembership(
          chatId: testChatId,
          userId: testUserId,
        );

        // Assert
        verify(
          mockMembershipService.createChatMembership(
            chatId: testChatId,
            userId: testUserId,
          ),
        ).called(1);
        expect(result, isTrue);
      });

      test('addChatMember delegates to membership service', () async {
        // Arrange
        const testChatId = 'chat123';
        const testUserId = 'user456';

        when(
          mockMembershipService.addChatMember(
            chatId: anyNamed('chatId'),
            userId: anyNamed('userId'),
          ),
        ).thenAnswer((_) async => true);

        // Act
        final result = await chatService.addChatMember(
          chatId: testChatId,
          userId: testUserId,
        );

        // Assert
        verify(
          mockMembershipService.addChatMember(
            chatId: testChatId,
            userId: testUserId,
          ),
        ).called(1);
        expect(result, isTrue);
      });

      test('removeChatMember delegates to membership service', () async {
        // Arrange
        const testChatId = 'chat123';
        const testMemberId = 'member456';

        when(
          mockMembershipService.removeChatMember(
            chatId: anyNamed('chatId'),
            memberId: anyNamed('memberId'),
          ),
        ).thenAnswer((_) async => true);

        // Act
        final result = await chatService.removeChatMember(
          chatId: testChatId,
          memberId: testMemberId,
        );

        // Assert
        verify(
          mockMembershipService.removeChatMember(
            chatId: testChatId,
            memberId: testMemberId,
          ),
        ).called(1);
        expect(result, isTrue);
      });

      test('fetchChatMembers delegates to membership service with pagination',
          () async {
        // Arrange
        const testChatId = 'chat123';
        const first = 10;
        const after = 'cursor123';
        final expectedResult = {'members': [], 'hasNextPage': false};

        when(
          mockMembershipService.fetchChatMembers(
            chatId: anyNamed('chatId'),
            first: anyNamed('first'),
            last: anyNamed('last'),
            after: anyNamed('after'),
            before: anyNamed('before'),
          ),
        ).thenAnswer((_) async => expectedResult);

        // Act
        final result = await chatService.fetchChatMembers(
          chatId: testChatId,
          first: first,
          after: after,
        );

        // Assert
        verify(
          mockMembershipService.fetchChatMembers(
            chatId: testChatId,
            first: first,
            last: null,
            after: after,
            before: null,
          ),
        ).called(1);
        expect(result, equals(expectedResult));
      });
    });

    group('Message Service Delegation', () {
      test('getChatDetails delegates to message service', () async {
        // Arrange
        const testChatId = 'chat123';
        final expectedChat = Chat(id: testChatId, name: 'Test Chat');

        when(
          mockMessageService.getChatDetails(
            any,
            isInitialLoad: anyNamed('isInitialLoad'),
          ),
        ).thenAnswer((_) async => expectedChat);

        // Act
        final result = await chatService.getChatDetails(testChatId);

        // Assert
        verify(
          mockMessageService.getChatDetails(
            testChatId,
            isInitialLoad: true,
          ),
        ).called(1);
        expect(result, equals(expectedChat));
      });

      test('loadMoreMessages delegates to message service', () async {
        // Arrange
        const testChatId = 'chat123';
        final expectedMessages = [
          ChatMessage(
            id: 'msg1',
            body: 'Test message',
            creator: ChatUser(id: 'user1', firstName: 'User'),
            chatId: testChatId,
            createdAt: DateTime.now().toIso8601String(),
          ),
        ];

        when(mockMessageService.loadMoreMessages(any))
            .thenAnswer((_) async => expectedMessages);

        // Act
        final result = await chatService.loadMoreMessages(testChatId);

        // Assert
        verify(mockMessageService.loadMoreMessages(testChatId)).called(1);
        expect(result, equals(expectedMessages));
      });

      test('hasMoreMessages delegates to message service', () {
        // Arrange
        const testChatId = 'chat123';
        when(mockMessageService.hasMoreMessages(any)).thenReturn(true);

        // Act
        final result = chatService.hasMoreMessages(testChatId);

        // Assert
        verify(mockMessageService.hasMoreMessages(testChatId)).called(1);
        expect(result, isTrue);
      });

      test('sendMessage delegates to message service', () async {
        // Arrange
        const testChatId = 'chat123';
        const testBody = 'Test message body';
        final expectedMessage = ChatMessage(
          id: 'msg1',
          body: testBody,
          creator: ChatUser(id: 'user1', firstName: 'User'),
          chatId: testChatId,
          createdAt: DateTime.now().toIso8601String(),
        );

        when(
          mockMessageService.sendMessage(
            chatId: anyNamed('chatId'),
            body: anyNamed('body'),
          ),
        ).thenAnswer((_) async => expectedMessage);

        // Act
        final result = await chatService.sendMessage(
          chatId: testChatId,
          body: testBody,
        );

        // Assert
        verify(
          mockMessageService.sendMessage(
            chatId: testChatId,
            body: testBody,
          ),
        ).called(1);
        expect(result, equals(expectedMessage));
      });

      test('subscribeToChatMessages delegates to message service', () {
        // Arrange
        const testChatId = 'chat123';
        final testStream = Stream<ChatMessage>.fromIterable([
          ChatMessage(
            id: 'msg1',
            body: 'Test',
            creator: ChatUser(id: 'user1', firstName: 'User'),
            chatId: testChatId,
            createdAt: DateTime.now().toIso8601String(),
          ),
        ]);

        when(mockMessageService.subscribeToChatMessages(any))
            .thenAnswer((_) => testStream);

        // Act
        final result = chatService.subscribeToChatMessages(testChatId);

        // Assert
        verify(mockMessageService.subscribeToChatMessages(testChatId))
            .called(1);
        expect(result, equals(testStream));
      });

      test('chatMessagesStream delegates to message service', () {
        // Arrange
        final testStream = Stream<ChatMessage>.fromIterable([
          ChatMessage(
            id: 'msg1',
            body: 'Test',
            creator: ChatUser(id: 'user1', firstName: 'User'),
            chatId: 'chat1',
            createdAt: DateTime.now().toIso8601String(),
          ),
        ]);

        when(mockMessageService.chatMessagesStream)
            .thenAnswer((_) => testStream);

        // Act
        final result = chatService.chatMessagesStream;

        // Assert
        verify(mockMessageService.chatMessagesStream).called(1);
        expect(result, equals(testStream));
      });

      test('stopSubscription delegates to message service', () {
        // Act
        chatService.stopSubscription();

        // Assert
        verify(mockMessageService.stopSubscription()).called(1);
      });
    });

    group('Service Lifecycle', () {
      test('dispose delegates to all services', () {
        // Act
        chatService.dispose();

        // Assert
        verify(mockCoreService.dispose()).called(1);
        verify(mockMessageService.dispose()).called(1);
        // Note: ChatMembershipService doesn't have dispose method
      });
    });

    group('Error Handling', () {
      test('handles core service failures gracefully', () async {
        // Arrange
        when(
          mockCoreService.createChat(
            name: anyNamed('name'),
            description: anyNamed('description'),
          ),
        ).thenThrow(Exception('Network error'));

        // Act & Assert
        expect(
          () async => await chatService.createChat(name: 'Test'),
          throwsA(isA<Exception>()),
        );
      });

      test('handles membership service failures gracefully', () async {
        // Arrange
        when(
          mockMembershipService.addChatMember(
            chatId: anyNamed('chatId'),
            userId: anyNamed('userId'),
          ),
        ).thenThrow(Exception('Permission denied'));

        // Act & Assert
        expect(
          () async => await chatService.addChatMember(
            chatId: 'chat1',
            userId: 'user1',
          ),
          throwsA(isA<Exception>()),
        );
      });

      test('handles message service failures gracefully', () async {
        // Arrange
        when(
          mockMessageService.sendMessage(
            chatId: anyNamed('chatId'),
            body: anyNamed('body'),
          ),
        ).thenThrow(Exception('Message too long'));

        // Act & Assert
        expect(
          () async => await chatService.sendMessage(
            chatId: 'chat1',
            body: 'Test message',
          ),
          throwsA(isA<Exception>()),
        );
      });
    });
  });

  group('ChatService Default Behavior', () {
    setUp(() {
      registerServices();
    });

    tearDown(() {
      unregisterServices();
    });
    test('ChatService works without injected dependencies', () {
      // Test that the service can be created with default implementations
      final defaultChatService = ChatService();

      expect(defaultChatService, isA<ChatService>());
      expect(defaultChatService.chatListStream, isA<Stream<Chat>>());
      expect(defaultChatService.chatMessagesStream, isA<Stream<ChatMessage>>());
    });

    test('createChat validation works with default service', () async {
      final defaultChatService = ChatService();

      // Test empty name validation
      final result1 = await defaultChatService.createChat(name: '');
      expect(result1, isNull);

      // Test whitespace name validation
      final result2 = await defaultChatService.createChat(name: '   ');
      expect(result2, isNull);

      // These should not crash even without mocks
      expect(() => defaultChatService.dispose(), returnsNormally);
      expect(() => defaultChatService.stopSubscription(), returnsNormally);
    });
  });
}
