import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/chat_queries.dart';

/// Provides real-time subscription services for chat messages.
///
/// Services include:
/// * `subscribeToChatMessages` - subscribes to real-time messages
/// * `stopSubscription` - stops the current subscription
class ChatSubscriptionService {
  ChatSubscriptionService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
    _chatMessagesStream = _chatMessageController.stream.asBroadcastStream();
  }

  /// Database mutation functions.
  late DataBaseMutationFunctions _dbFunctions;

  /// Stream for chat messages.
  late Stream<ChatMessage> _chatMessagesStream;

  /// Controller for chat messages stream.
  final StreamController<ChatMessage> _chatMessageController =
      StreamController<ChatMessage>();

  /// Completer to control subscription cancellation.
  Completer<void>? _subscriptionCompleter;

  /// Getter for chat messages stream.
  Stream<ChatMessage> get chatMessagesStream => _chatMessagesStream;

  /// Subscribes to real-time chat messages for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to subscribe to
  ///
  /// **returns**:
  /// * `Stream<ChatMessage>`: Stream of incoming messages for the specified chat
  Stream<ChatMessage> subscribeToChatMessages(String chatId) {
    // Start the subscription
    _startSubscription(chatId);

    // Return the existing chat messages stream
    return _chatMessagesStream;
  }

  /// Helper Method - Starts a subscription to chat messages using the gqlAuthSubscription approach.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to subscribe to
  ///
  /// **returns**:
  ///   None
  Future<void> _startSubscription(
    String chatId,
  ) async {
    // Cancel any existing subscription
    _subscriptionCompleter?.complete();
    _subscriptionCompleter = Completer<void>();

    try {
      // Use the new gqlAuthSubscription method for consistent handling
      final stream = _dbFunctions.gqlAuthSubscription(
        ChatQueries().chatMessageCreate,
        variables: {
          "input": {
            "id": chatId,
          },
        },
      );

      // Listen to the stream using for-loop approach
      await for (final result in stream) {
        // Check if subscription should be cancelled
        if (_subscriptionCompleter?.isCompleted == true) {
          break;
        }

        if (result.hasException) {
          debugPrint(
            'Subscription error for chat $chatId: ${result.exception}',
          );
          // Continue listening instead of breaking
          continue;
        }

        // Parse the received message
        if (result.data != null && result.data!['chatMessageCreate'] != null) {
          final messageData =
              result.data!['chatMessageCreate'] as Map<String, dynamic>;

          // Create and emit the message - add to the chat message controller
          final message = ChatMessage.fromJson(messageData);
          _chatMessageController.add(message);
        }
      }
    } catch (e) {
      // Error in subscription
      debugPrint('Failed to start subscription: $e');
    }
  }

  /// Stops the current chat subscription.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void stopSubscription() {
    _subscriptionCompleter?.complete();
  }

  /// Disposes the service and closes streams.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void dispose() {
    stopSubscription();
    _chatMessageController.close();
  }
}
