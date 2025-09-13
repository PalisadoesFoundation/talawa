import 'package:flutter/foundation.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/chat_queries.dart';

/// Provides chat membership management services for the PostgreSQL-based chat system.
///
/// Services include:
/// * `createChatMembership` - adds a user to a chat
/// * `addChatMember` - alias for createChatMembership
/// * `removeChatMember` - removes a user from a chat
/// * `fetchChatMembers` - gets chat members with pagination
class ChatMembershipService {
  ChatMembershipService() {
    _dbFunctions = locator<DataBaseMutationFunctions>();
  }

  /// Database mutation functions.
  late DataBaseMutationFunctions _dbFunctions;

  /// Navigation service instance.
  final navigationService = locator<NavigationService>();

  /// Creates a chat membership (adds a user to a chat).
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `userId`: The ID of the user to add
  ///
  /// **returns**:
  /// * `Future<bool>`: True if successful, false otherwise
  Future<bool> createChatMembership({
    required String chatId,
    required String userId,
  }) async {
    final result = await _dbFunctions.gqlAuthMutation(
      ChatQueries().createChatMembership(),
      variables: {
        "input": {
          "chatId": chatId,
          "memberId": userId,
        },
      },
    );

    if (result.hasException || result.data == null) {
      debugPrint('Error creating chat membership: ${result.exception}');
      return false;
    }

    return result.data!['createChatMembership'] != null;
  }

  /// Adds a member to an existing chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `userId`: The ID of the user to add
  ///
  /// **returns**:
  /// * `Future<bool>`: True if member was added successfully, false otherwise
  Future<bool> addChatMember({
    required String chatId,
    required String userId,
  }) async {
    // This uses the existing createChatMembership method
    return createChatMembership(chatId: chatId, userId: userId);
  }

  /// Removes a member from a chat.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `memberId`: The ID of the member to remove
  ///
  /// **returns**:
  /// * `Future<bool>`: True if member was removed successfully, false otherwise
  Future<bool> removeChatMember({
    required String chatId,
    required String memberId,
  }) async {
    final result = await _dbFunctions.gqlAuthMutation(
      ChatQueries().deleteChatMembership(),
      variables: {
        "input": {
          "chatId": chatId,
          "memberId": memberId,
        },
      },
    );

    if (result.hasException || result.data == null) {
      debugPrint('Error removing chat member: ${result.exception}');
      navigationService.showTalawaErrorSnackBar(
        'Failed to remove member',
        MessageType.error,
      );
      return false;
    }

    debugPrint('Member removed successfully: $memberId from chat $chatId');
    return result.data!['deleteChatMembership'] != null;
  }

  /// Fetches members of a specific chat with pagination support.
  ///
  /// **params**:
  /// * `chatId`: The ID of the chat
  /// * `first`: Number of members to fetch from the beginning (optional)
  /// * `last`: Number of members to fetch from the end (optional)
  /// * `after`: Cursor for forward pagination (optional)
  /// * `before`: Cursor for backward pagination (optional)
  ///
  /// **returns**:
  /// * `Future<Map<String, dynamic>?>`: Chat with members and pagination info, or null if failed
  Future<Map<String, dynamic>?> fetchChatMembers({
    required String chatId,
    int? first,
    int? last,
    String? after,
    String? before,
  }) async {
    final variables = <String, dynamic>{
      "input": {"id": chatId},
    };

    // Add pagination parameters
    if (first != null) variables["first"] = first;
    if (last != null) variables["last"] = last;
    if (after != null) variables["after"] = after;
    if (before != null) variables["before"] = before;

    final result = await _dbFunctions.gqlAuthQuery(
      ChatQueries().fetchChatMembers(),
      variables: variables,
    );

    if (result.hasException || result.data == null) {
      debugPrint('Error fetching chat members: ${result.exception}');
      return null;
    }

    return result.data!['chat'] as Map<String, dynamic>?;
  }
}
