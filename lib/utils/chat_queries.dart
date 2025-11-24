// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

///This class creates the queries dealing with chats.

class ChatQueries {
  //Returns a query to fetch direct chat using userId
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

  //Returns query to fetch direct chat messages using chatId
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

  //Gets messages sent to direct chat subscription
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

  //Send message to direct chat.
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
