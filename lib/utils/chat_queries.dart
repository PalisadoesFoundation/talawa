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
}
