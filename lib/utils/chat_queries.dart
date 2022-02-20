class ChatQueries {
  String fetchDirectChatsByUserId(String userId) {
    return '''
      query {
        directChatsByUserID(id: "$userId") {
          messages {
            _id
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
            messageContent
          }
        }
      }
   ''';
  }

  String fetchDirectChatMessagesByChatId(String chatId) {
    return '''
        query {
          directChatsMessagesByChatID(id: $chatId) {
            messageContent
            sender {
              _id
              firstName
            }
          }
        }
    ''';
  }
}
