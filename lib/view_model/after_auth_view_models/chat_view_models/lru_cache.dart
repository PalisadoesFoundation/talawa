import 'package:talawa/models/chats/chat_list_tile_data_model.dart';

/* 
    LRU implementation for updating the list.
    (avergae constant time list manipulation using Doubly Linked List Data Structure)
      Inserting Item: O(1) Time complexity.
      Updating Item: O(1) Time complexity.
      Deleting Item: O(1) Time complexity.
*/
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

  // Use for inserting the new messages from the backend
  void addNewIncomingChat(ChatListNode chatNode) {
    if (cache.containsKey(chatNode.chat!.sender!.id)) {
      // When the new message is already in the list, update the content and move it to the first.
      cache[chatNode.chat!.sender!.id!]!.chat = chatNode.chat;
      moveToHead(cache[chatNode.chat!.sender!.id!]!);
    } else {
      // Inser the new message at the top.
      cache[chatNode.chat!.sender!.id!] = chatNode;
      addChat(chatNode);
    }
  }

  // Helper function to moveListTile to the head.
  void moveToHead(ChatListNode chatNode) {
    removeChat(chatNode);
    addChat(chatNode);
  }

  //Helper function to removeListTile.
  void removeChat(ChatListNode chatNode) {
    final _prev = chatNode.prev;
    final _next = chatNode.next;

    _prev!.next = _next;
    _next!.prev = _prev;
    if (length > 0) length -= 1;
  }

  //Helper function to addListTile.
  void addChat(ChatListNode chatNode) {
    chatNode.prev = head;
    chatNode.next = head.next;

    head.next!.prev = chatNode;
    head.next = chatNode;
    length += 1;
  }
}
