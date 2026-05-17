import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
  }

  /// Database mutation functions.
  late DataBaseMutationFunctions _dbFunctions;

  /// Active broadcast controller for the currently-subscribed chat.
  StreamController<ChatMessage>? _activeController;

  /// Underlying GraphQL subscription handle for the active chat.
  StreamSubscription<QueryResult<Object?>>? _activeStreamSubscription;

  /// Chat ID currently subscribed to (used to dedupe re-subscribes).
  String? _activeChatId;

  /// Getter for chat messages stream.
  Stream<ChatMessage> get chatMessagesStream =>
      _activeController?.stream ?? const Stream<ChatMessage>.empty();

  /// Subscribes to real-time chat messages for a specific chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat to subscribe to
  ///
  /// **returns**:
  /// * `Stream<ChatMessage>`: Stream of incoming messages for the specified chat
  Stream<ChatMessage> subscribeToChatMessages(String chatId) {
    // Reuse the existing broadcast stream when the caller re-subscribes to the
    // same chat — avoids tearing down a healthy WebSocket subscription.
    final existing = _activeController;
    if (_activeChatId == chatId && existing != null && !existing.isClosed) {
      return existing.stream;
    }

    _stopActiveSubscription();

    final controller = StreamController<ChatMessage>.broadcast();
    _activeController = controller;
    _activeChatId = chatId;

    try {
      final stream = _dbFunctions.gqlAuthSubscription(
        ChatQueries().chatMessageCreate,
        variables: {
          "input": {
            "id": chatId,
          },
        },
      );

      _activeStreamSubscription = stream.listen(
        (result) {
          if (controller.isClosed) return;

          if (result.hasException) {
            debugPrint(
              'Subscription error for chat $chatId: ${result.exception}',
            );
            return;
          }

          final data = result.data?['chatMessageCreate'];
          if (data is Map<String, dynamic>) {
            controller.add(ChatMessage.fromJson(data));
          }
        },
        onError: (Object error, StackTrace stackTrace) {
          debugPrint('Subscription stream error for chat $chatId: $error');
        },
        cancelOnError: false,
      );
    } catch (e) {
      debugPrint('Failed to start subscription for chat $chatId: $e');
    }

    return controller.stream;
  }

  /// Tears down the currently-active subscription and broadcast controller.
  void _stopActiveSubscription() {
    _activeStreamSubscription?.cancel();
    _activeStreamSubscription = null;

    final controller = _activeController;
    _activeController = null;
    _activeChatId = null;

    if (controller != null && !controller.isClosed) {
      controller.close();
    }
  }

  /// Stops the current chat subscription.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void stopSubscription() => _stopActiveSubscription();

  /// Disposes the service and closes streams.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void dispose() => _stopActiveSubscription();
}
