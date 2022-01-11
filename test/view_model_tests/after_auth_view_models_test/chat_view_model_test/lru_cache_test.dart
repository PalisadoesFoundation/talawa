import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_message.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/lru_cache.dart';

void main() {
  group('Checking lru cache view model', () {
    test("Testing addchat", () {
      final model = LRUChatListCache();
      final ChatListNode mockChatListNode1 =
          createMockChatListNode(1); //creating mockChatListNodes for testing
      model.addChat(mockChatListNode1);
      expect(model.head, mockChatListNode1);
      final ChatListNode mockChatListNode2 = createMockChatListNode(2);
      model.addChat(mockChatListNode2);
      expect(model.head,
          mockChatListNode2); //checking if chat added later are at top
      expect(model.head, isNot(mockChatListNode1));
      expect(model.head.next, mockChatListNode1);
    });
  });

  test("Testing removeChat", () {
    final model = LRUChatListCache();

    final ChatListNode mockChatListNode1 = createMockChatListNode(1);
    model.addChat(mockChatListNode1);
    final ChatListNode mockChatListNode2 = createMockChatListNode(2);
    model.addChat(mockChatListNode2);

    final ChatListNode mockChatListNode3 = createMockChatListNode(3);
    model.addChat(mockChatListNode3);

    model.removeChat(mockChatListNode2);

    expect(model.head, mockChatListNode3);
    expect(model.head.next, isNot(mockChatListNode2));
    expect(model.head.next, mockChatListNode1);
  });

  test('Testing moveToHead', () {
    final model = LRUChatListCache();

    final ChatListNode mockChatListNode1 = createMockChatListNode(1);
    model.addChat(mockChatListNode1);
    final ChatListNode mockChatListNode2 = createMockChatListNode(2);
    model.addChat(mockChatListNode2);
    final ChatListNode mockChatListNode3 = createMockChatListNode(3);
    model.addChat(mockChatListNode3);
    model.moveToHead(mockChatListNode2);

    expect(model.head, mockChatListNode2);
    expect(model.head, isNot(mockChatListNode3));
    expect(model.head.next, mockChatListNode3);
  });

  test("Testing addNewIncomingChat", () {
    final model = LRUChatListCache();

    final mockSender = ChatUser(name: "Mock sender", id: "Mock ID");

    final ChatListNode mockChatListNode1 = createMockChatListNode(1);
    model.addChat(mockChatListNode1);
    final ChatListNode mockChatListNode2 = createMockChatListNode(2);
    model.addChat(mockChatListNode2);
    final ChatListNode mockChatListNode3 = createMockChatListNode(3);
    model.addChat(mockChatListNode3);

    final mockUpdatedChatMessage2 = ChatMessage("mock messageID 1", mockSender,
        "This is modified mock message", DateTime.now(), true);
    final finalUpdatedmockChat1 =
        ChatListTileDataModel(mockSender, mockUpdatedChatMessage2, 5);
    final mockUpdatedChatListNode2 =
        ChatListNode(key: "mock Key 2", chat: finalUpdatedmockChat1);
    model.addNewIncomingChat(mockUpdatedChatListNode2);
    expect(model.head.chat, mockUpdatedChatListNode2.chat);
  });
}

ChatListNode createMockChatListNode(int i) {
  final mockSender = ChatUser(name: "Mock sender", id: "Mock ID");
  final mockChatMessage = ChatMessage("mock messageID $i", mockSender,
      "This is mock message $i", DateTime.now(), true);
  final finalmockChat = ChatListTileDataModel(mockSender, mockChatMessage, 5);
  final mockChatListNode =
      ChatListNode(key: "mock Key $i", chat: finalmockChat);
  return mockChatListNode;
}
