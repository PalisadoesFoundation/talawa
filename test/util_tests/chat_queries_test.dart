import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/chat_queries.dart';

void main() {
  group("Testing Chat Queries ", () {
    final chatQuery = ChatQueries();
    test("fetchDirectChatsByUserId should return proper query", () {
      expect(chatQuery.fetchDirectChatsByUserId("userId"), equals('''
      query {
      directChatsByUserID(id: "userId") {
        _id
        users{
          _id
          firstName
          email
        }
      }
    }
   '''));
    });

    test("fetchDirectChatMessagesByChatId should return proper query", () {
      expect(chatQuery.fetchDirectChatMessagesByChatId("chatId"), equals('''
        query {
          directChatsMessagesByChatID(id: "chatId") {
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
    '''));
    });

    test(
        "messageSentToDirectChatsubscription should return proper subscription",
        () {
      expect(chatQuery.messageSentToDirectChatsubscription, equals('''
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
  '''));
    });

    test("sendMessageToDirectChat should return proper mutation", () {
      expect(chatQuery.sendMessageToDirectChat(), equals('''
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
    '''));
    });
  });
}
