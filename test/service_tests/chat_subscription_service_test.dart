import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/chat_subscription_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('ChatSubscriptionService Tests', () {
    late ChatSubscriptionService chatSubscriptionService;
    late MockDataBaseMutationFunctions mockDbFunctions;

    setUp(() {
      mockDbFunctions = getAndRegisterDatabaseMutationFunctions()
          as MockDataBaseMutationFunctions;
      chatSubscriptionService = ChatSubscriptionService();
    });

    group('subscribeToChatMessages', () {
      test('returns a stream', () async {
        const chatId = 'chat123';

        final result = chatSubscriptionService.subscribeToChatMessages(chatId);

        expect(result, isA<Stream<ChatMessage>>());
      });

      test('handles subscription with exception in result', () async {
        const chatId = 'chat123';
        final controller = StreamController<QueryResult>();

        when(
          mockDbFunctions.gqlAuthSubscription(
            any,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer((_) => controller.stream);

        // Start subscription
        final stream = chatSubscriptionService.subscribeToChatMessages(chatId);

        // Listen to the stream
        final messages = <ChatMessage>[];
        final subscription = stream.listen((message) {
          messages.add(message);
        });

        // Emit result with exception - this should trigger debugPrint and continue
        final resultWithException = QueryResult(
          options: QueryOptions(document: gql('subscription { test }')),
          data: null,
          exception: OperationException(
            graphqlErrors: [const GraphQLError(message: 'Test error')],
          ),
          source: QueryResultSource.network,
        );

        controller.add(resultWithException);

        // Wait a bit for processing
        await Future.delayed(const Duration(milliseconds: 10));

        // Should continue listening and not break
        expect(
          messages,
          isEmpty,
        ); // No messages should be added due to exception

        subscription.cancel();
        controller.close();
      });

      test('processes valid chat message data', () async {
        const chatId = 'chat123';
        final controller = StreamController<QueryResult>();

        when(
          mockDbFunctions.gqlAuthSubscription(
            any,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer((_) => controller.stream);

        // Start subscription
        final stream = chatSubscriptionService.subscribeToChatMessages(chatId);

        // Listen to the stream
        final messages = <ChatMessage>[];
        final subscription = stream.listen((message) {
          messages.add(message);
        });

        // Create valid message data
        final messageData = {
          'id': 'msg123',
          'body': 'Test message',
          'chatId': chatId,
          'creator': {
            'id': 'user123',
            'firstName': 'John',
            'lastName': 'Doe',
          },
          'createdAt': '2023-01-01T00:00:00Z',
        };

        // Emit result with valid data - this should trigger message creation and controller.add
        final resultWithData = QueryResult(
          options: QueryOptions(document: gql('subscription { test }')),
          data: {
            'chatMessageCreate': messageData,
          },
          source: QueryResultSource.network,
        );

        controller.add(resultWithData);

        // Wait a bit for processing
        await Future.delayed(const Duration(milliseconds: 10));

        // Should have processed the message
        expect(messages, hasLength(1));
        expect(messages.first.id, 'msg123');
        expect(messages.first.body, 'Test message');

        subscription.cancel();
        controller.close();
      });

      test('handles subscription cancellation mid-stream', () async {
        const chatId = 'chat123';
        final controller = StreamController<QueryResult>();

        when(
          mockDbFunctions.gqlAuthSubscription(
            any,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer((_) => controller.stream);

        // Start subscription
        chatSubscriptionService.subscribeToChatMessages(chatId);

        // Immediately stop subscription - this should complete the completer
        chatSubscriptionService.stopSubscription();

        // The subscription should break on the next iteration
        // Add some data to trigger the check
        final result = QueryResult(
          options: QueryOptions(document: gql('subscription { test }')),
          data: {'chatMessageCreate': {}},
          source: QueryResultSource.network,
        );

        controller.add(result);
        await Future.delayed(const Duration(milliseconds: 10));

        controller.close();
      });

      test('handles exception during subscription start', () async {
        const chatId = 'chat123';

        // Mock the gqlAuthSubscription to throw an exception
        when(
          mockDbFunctions.gqlAuthSubscription(
            any,
            variables: anyNamed('variables'),
          ),
        ).thenThrow(Exception('Connection failed'));

        // This should trigger the catch block with debugPrint
        final stream = chatSubscriptionService.subscribeToChatMessages(chatId);

        // The stream should still be returned even if subscription start fails
        expect(stream, isA<Stream<ChatMessage>>());

        // Wait a bit for the exception to be processed
        await Future.delayed(const Duration(milliseconds: 10));
      });

      test('handles null or invalid message data', () async {
        const chatId = 'chat123';
        final controller = StreamController<QueryResult>();

        when(
          mockDbFunctions.gqlAuthSubscription(
            any,
            variables: anyNamed('variables'),
          ),
        ).thenAnswer((_) => controller.stream); // Start subscription
        final stream = chatSubscriptionService.subscribeToChatMessages(chatId);

        // Listen to the stream
        final messages = <ChatMessage>[];
        final subscription = stream.listen((message) {
          messages.add(message);
        });

        // Emit result with null data - should not create message
        final resultWithNullData = QueryResult(
          options: QueryOptions(document: gql('subscription { test }')),
          data: null,
          source: QueryResultSource.network,
        );

        controller.add(resultWithNullData);

        // Emit result with missing chatMessageCreate - should not create message
        final resultWithMissingKey = QueryResult(
          options: QueryOptions(document: gql('subscription { test }')),
          data: {'otherKey': 'value'},
          source: QueryResultSource.network,
        );
        controller.add(resultWithMissingKey);

        // Wait a bit for processing
        await Future.delayed(const Duration(milliseconds: 10));

        // Should not have processed any messages
        expect(messages, isEmpty);

        subscription.cancel();
        controller.close();
      });
    });

    group('stopSubscription and dispose', () {
      test('stopSubscription completes the subscription completer', () {
        expect(
          () => chatSubscriptionService.stopSubscription(),
          returnsNormally,
        );
      });

      test('dispose closes all streams and stops subscription', () async {
        expect(() => chatSubscriptionService.dispose(), returnsNormally);
      });
    });

    group('stream getters', () {
      test('chatMessagesStream returns Stream<ChatMessage>', () {
        expect(
          chatSubscriptionService.chatMessagesStream,
          isA<Stream<ChatMessage>>(),
        );
      });
    });
  });
}
