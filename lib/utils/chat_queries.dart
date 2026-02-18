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
          creator {
            id
            name
          }
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
          members(last: 30) {
            edges {
              node {
                role
                user {
                  id
                  name
                }
              }
            }
          }
          creator {
            id
            name
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
          creator {
            id
            name
          }
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
          members(last: 30) {
            pageInfo {
              hasNextPage
              hasPreviousPage
              startCursor
              endCursor
            }
            edges {
              node {
                role
                user {
                  id
                  name
                }
              }
            }
          }
        }
      }
    ''';
  }

  /// Fetches members of a specific chat with pagination support.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL query string for fetching chat members with pagination
  String fetchChatMembers() {
    return '''
      query chat(\$input: QueryChatInput!, \$first: Int, \$last: Int, \$after: String, \$before: String) {
        chat(input: \$input) {
          id
          name
          creator {
            id
            name
          }
          members(first: \$first, last: \$last, after: \$after, before: \$before) {
            pageInfo {
              hasNextPage
              hasPreviousPage
              startCursor
              endCursor
            }
            edges {
              cursor
              node {
                role
                user {
                  id
                  name
                }
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

  /// Deletes a chat.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL mutation string for deleting a chat
  String deleteChat() {
    return '''
      mutation deleteChat(\$input: MutationDeleteChatInput!) {
        deleteChat(input: \$input) {
          id
        }
      }
    ''';
  }

  /// Deletes a chat membership (removes a user from a chat).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL mutation string for deleting chat membership
  String deleteChatMembership() {
    return '''
      mutation deleteChatMembership(\$input: MutationDeleteChatMembershipInput!) {
        deleteChatMembership(input: \$input) {
          id
        }
      }
    ''';
  }

  /// Updates a chat's information.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL mutation string for updating a chat
  String updateChat() {
    return '''
      mutation updateChat(\$input: MutationUpdateChatInput!) {
        updateChat(input: \$input) {
          id
          name
          description
          updatedAt
          creator {
            id
            name
          }
        }
      }
    ''';
  }
}
