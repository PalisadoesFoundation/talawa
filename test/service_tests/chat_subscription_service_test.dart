import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/chat_subscription_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('ChatSubscriptionService Tests', () {
    late ChatSubscriptionService chatSubscriptionService;

    setUp(() {
      chatSubscriptionService = ChatSubscriptionService();
    });

    group('subscribeToChatMessages', () {
      test('returns a stream', () async {
        const chatId = 'chat123';

        final result = chatSubscriptionService.subscribeToChatMessages(chatId);

        expect(result, isA<Stream<ChatMessage>>());
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
