// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/chat_queries.dart';

void main() {
  group("Tests for chat_queries.dart", () {
    test("Check if fetchDirectChatsByUserId works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = ChatQueries().fetchDirectChatsByUserId('Ayush');
      if (fnData.contains('''
      query {
      directChatsByUserID(id: "Ayush") {
        _id
        users{
          _id
          firstName
          email
        }
      }
    }
   ''')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if fetchDirectChatMessagesByChatId works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = ChatQueries().fetchDirectChatMessagesByChatId('Ayush');
      if (fnData.contains('''
        query {
          directChatsMessagesByChatID(id: "Ayush") {
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
    ''')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if messageSentToDirectChatsubscription works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = ChatQueries().messageSentToDirectChatsubscription;
      if (fnData.contains('''
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
  ''')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if sendMessageToDirectChat works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = ChatQueries().sendMessageToDirectChat();
      if (fnData.contains('''
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
    ''')) {
        mutation = true;
      }
      expect(mutation, true);
    });
    test("Check if sendMessageToDirectChat works correctly", () {
      var mutation = false;
      expect(mutation, false);

      final fnData = ChatQueries().sendMessageToDirectChat();
      if (fnData.contains('''
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
    ''')) {
        mutation = true;
      }
      expect(mutation, true);
    });
  });
}
