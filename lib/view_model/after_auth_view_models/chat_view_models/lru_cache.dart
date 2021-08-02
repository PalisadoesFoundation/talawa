import 'package:talawa/models/chats/chat_list_tile_data_model.dart';

class ChatListNode {
  // ChatListNode();
  ChatListNode({String? key, ChatListTileDataModel? chat}) {
    if (key != null && chat != null) {
      this.key = key;
      this.chat = chat;
    }
  }
  String? key;
  ChatListTileDataModel? chat;
  ChatListNode? prev;
  ChatListNode? next;
}

class LRUChatListCache {
  LRUChatListCache() {
    cache = <String, ChatListNode>{};
    head = ChatListNode();
    tail = ChatListNode();

    head.next = tail;
    tail.prev = head;
  }

  int length = 0;
  late ChatListNode head;
  late ChatListNode tail;
  late Map<String, ChatListNode> cache;

  void addNewIncomingChat(ChatListNode chatNode) {
    if (cache.containsKey(chatNode.chat!.sender!.id)) {
      print("matched");
      cache[chatNode.chat!.sender!.id!]!.chat = chatNode.chat;
      moveToHead(cache[chatNode.chat!.sender!.id!]!);
    } else {
      cache[chatNode.chat!.sender!.id!] = chatNode;
      addChat(chatNode);
    }
  }

  void moveToHead(ChatListNode chatNode) {
    removeChat(chatNode);
    addChat(chatNode);
  }

  void removeChat(ChatListNode chatNode) {
    final _prev = chatNode.prev;
    final _next = chatNode.next;

    _prev!.next = _next;
    _next!.prev = _prev;
    if (length > 0) length -= 1;
  }

  void addChat(ChatListNode chatNode) {
    chatNode.prev = head;
    chatNode.next = head.next;

    head.next!.prev = chatNode;
    head.next = chatNode;
    length += 1;
  }
}
