import 'package:talawa/demo_server_data/direct_chat_demo_data.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/lru_cache.dart';
import 'package:talawa/view_model/base_view_model.dart';

class DirectChatViewModel extends BaseModel {
  LRUChatListCache? _chats;
  ChatListNode? _chatIterator;

  //Getters
  LRUChatListCache? get chats => _chats;
  ChatListNode? get chatIterator => _chatIterator;

  void initialise() {
    _chats = LRUChatListCache();
    const List<Map<String, dynamic>> _chatListTileJson = directChatDemoData;

    _chatListTileJson.forEach((chat) {
      final _chatListTile = ChatListTileDataModel.fromJson(chat);
      final _chatNode =
          ChatListNode(chat: _chatListTile, key: _chatListTile.sender!.id);
      if (_chats != null) _chats!.addNewIncomingChat(_chatNode);
    });
    reInitialiseIterator();
    notifyListeners();
  }

  /* To use with pre-built Animatedlist (takes "List" as an input),
  "ChatIterator imitates the behaviour of serial iteration of Arraylist"*/
  void reInitialiseIterator() {
    if (_chats != null) _chatIterator = _chats!.head;
  }

  // Imitates "index++"" for the LRUCacheList
  bool incrementIterator() {
    if (_chats != null && _chatIterator!.next != _chats!.tail) {
      _chatIterator = _chatIterator!.next;
      return true;
    }
    return false;
  }
}
