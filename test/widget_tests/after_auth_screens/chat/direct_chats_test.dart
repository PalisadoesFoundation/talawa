// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/chats/chat_list_tile_data_model.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/direct_chats.dart';

import '../../../helpers/test_helpers.dart';

Widget createDirectChats() {
  return const MaterialApp(home: Scaffold(body: DirectChats()));
}

final model = locator<DirectChatViewModel>();
Widget createChatTile() {
  return MaterialApp(
    home: Scaffold(
      body: ChatTile(
        chat: ChatListTileDataModel(
          [
            ChatUser(
              firstName: 'test',
              id: '1',
              image: 'fakeHttp',
            )
          ],
          '1',
        ),
        model: model,
      ),
    ),
  );
}

void main() {
  setUp(() {
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  group('Tests for direct chats', () {
    testWidgets('Check whether DirectChats shows up', (tester) async {
      await tester.pumpWidget(createDirectChats());
      await tester.pump();

      expect(find.byType(DirectChats), findsOneWidget);
      expect(find.byType(ChatTile), findsOneWidget);
    });
    testWidgets('Check whether ChatTile shows up', (tester) async {
      await tester.pumpWidget(createChatTile());
      await tester.pump();

      expect(find.byType(ChatTile), findsOneWidget);

      await tester.tap(find.byType(ListTile));
      verify(
        locator<NavigationService>().pushScreen(
          Routes.chatMessageScreen,
          arguments: ['1', model],
        ),
      );
    });
  });
}
