class ChatQueries {
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

  String fetchDirectChatMessagesByChatId(String chatId) {
    return '''
        query {
          directChatsMessagesByChatID(id: "$chatId") {
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
  }

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
