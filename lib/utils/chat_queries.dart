/// This class creates the queries dealing with chats.
class ChatQueries {
  /// Fetches all direct chats associated with a specific user ID.
  ///
  /// **params**:
  /// * `userId`: The unique identifier of the user whose direct chats to fetch
  ///
  /// **returns**:
  /// * `String`: The GraphQL query string for fetching direct chats by user ID
  String fetchDirectChatsByUserId(String userId) {
    return '''
      query {
      directChatsByUserID(id: "$userId") {
        _id
        users{
          _id
          firstName
          email
        }
      }
    }
   ''';
  }

  /// Fetches direct chat messages for a specific chat using chat ID.
  ///
  /// **params**:
  /// * `chatId`: The unique identifier of the chat to fetch messages for
  ///
  /// **returns**:
  /// * `String`: The GraphQL query string for fetching direct chat messages by chat ID
  String fetchDirectChatMessagesByChatId(String chatId) {
    return '''
        query getChat(\$input: QueryChatInput!) {
          chat(input: \$input) {
            id
            name
            description
            createdAt
            updatedAt
            messages(first: 50) {
              edges {
                node {
                  id
                  body
                  creator {
                    id
                    name
                  }
                  createdAt
                  updatedAt
                }
                cursor
              }
              pageInfo {
                endCursor
                hasNextPage
                hasPreviousPage
                startCursor
              }
            }
          }
        }
    ''';
  }

  /// Gets the GraphQL subscription for messages sent to direct chat.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL subscription string for listening to direct chat messages
  String get messageSentToDirectChatsubscription => '''
      subscription{
        messageSentToDirectChat{
          _id
          messageContent
          sender {
              _id
              firstName
              image
            }
            receiver {
              _id
              firstName
              image
            }
        }
      }
  ''';

  /// Sends a message to a direct chat.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: The GraphQL mutation string for sending a message to direct chat
  String sendMessageToDirectChat() {
    return '''
      mutation sendMessageToDirectChat(
        \$chatId: ID!
        \$messageContent: String!
        ){
        sendMessageToDirectChat(
          chatId: \$chatId
          messageContent: \$messageContent
        ) {
          messageContent
            sender{
              firstName
            }
            receiver{
              firstName
            }
          }
        }
    ''';
  }
}
