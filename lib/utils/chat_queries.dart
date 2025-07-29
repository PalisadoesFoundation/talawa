/// This class creates the queries dealing with chats.
class ChatQueries {
  /// Creates a new chat between users.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL mutation string for creating a chat
  String createChat() {
    return '''
      mutation createChat(\$input: MutationCreateChatInput!) {
        createChat(input: \$input) {
          id
          name
          description
          createdAt
          updatedAt
        }
      }
    ''';
  }

  /// Creates a membership for a user in a chat.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL mutation string for creating chat membership
  String createChatMembership() {
    return '''
      mutation createChatMembership(\$input: MutationCreateChatMembershipInput!) {
        createChatMembership(input: \$input) {
          id
          createdAt
          updatedAt
          creator {
            id
            name
          }
        }
      }
    ''';
  }

  /// Fetches all chats a user is a member of.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL query string for fetching chats by user ID
  String chatsByUser() {
    return '''
      query chatsByUser {
        chatsByUser {
          id
          name
          description
          createdAt
          updatedAt
          members(last: 2) {
            edges {
              node {
                id
                name
              }
            }
          }
        }
      }
    ''';
  }

  /// Fetches chat details and messages for a specific chat using chat ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL query string for fetching chat details and messages
  String fetchChatMessagesByChatId() {
    return '''
      query chat(\$input: QueryChatInput!, \$first: Int, \$last: Int, \$after: String, \$before: String) {
        chat(input: \$input) {
          id
          name
          description
          createdAt
          updatedAt
          messages(first: \$first, last: \$last, after: \$after, before: \$before) {
            pageInfo {
              hasNextPage
              hasPreviousPage
              startCursor
              endCursor
            }
            edges {
              cursor
              node {
                id
                body
                creator {
                  id
                  name
                }
                createdAt
              }
            }
          }
          members(last: 2) {
            edges {
              node {
                id
                name
              }
            }
          }
        }
      }
    ''';
  }

  /// Creates a new message in a chat.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL mutation string for creating a chat message
  String createChatMessage() {
    return '''
      mutation createChatMessage(\$input: MutationCreateChatMessageInput!) {
        createChatMessage(input: \$input) {
          id
          body
          creator {
            id
            name
          }
          createdAt
          updatedAt
        }
      }
    ''';
  }

  /// Gets the GraphQL subscription for chat message creation events.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL subscription string for listening to chat message creation
  String get chatMessageCreate => '''
      subscription chatMessageCreate(\$input: SubscriptionChatMessageCreateInput!) {
        chatMessageCreate(input: \$input) {
          id
          body
          createdAt
          updatedAt
          creator {
            id
            name
          }
        }
      }
  ''';
}
