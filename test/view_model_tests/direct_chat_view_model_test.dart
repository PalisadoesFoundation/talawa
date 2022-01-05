import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/demo_server_data/direct_chat_demo_data.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';

void main() {
  group('DirectChatViewModelTest -', () {
    final model = DirectChatViewModel();

    test('if incrementIterator is called and chats is null', () {
      expect(model.incrementIterator(), false);
    });

    test('if reInitialiseIterator is called when chats is null', () {
      model.reInitialiseIterator();
      expect(model.reInitialiseIterator, returnsNormally);
    });

    group('initialise - ', () {
      test('If initialise is called', () {
        expect(model.chats, isNull);
        model.initialise();
        expect(model.chats, isNotNull);
        expect(model.chatIterator, model.chats!.head);
        expect(
          model.chats!.tail.prev!.chat!.unreadCount,
          ChatListTileDataModel.fromJson(directChatDemoData[1]).unreadCount,
        );
      });

      test('if reInitialiseIterator is called when chats is not null', () {
        model.initialise();
        expect(model.chatIterator, model.chats!.head);
      });

      test('if incrementIterator is called and chats is not null', () {
        model.initialise();
        final node = model.chatIterator!.next;
        expect(model.incrementIterator(), true);
        expect(model.chatIterator, node);
      });
    });
  });
}
