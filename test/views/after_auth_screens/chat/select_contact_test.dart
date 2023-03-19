import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';

import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/select_contact.dart';

class MockSelectContactViewModel extends Mock
    implements SelectContactViewModel {}

void main() {
  group('SelectContact widget', () {
    late SelectContact widget;
    late MockSelectContactViewModel viewModel;

    setUp(() {
      locator.allowReassignment = true;
      viewModel = MockSelectContactViewModel();
      locator.registerSingleton<SelectContactViewModel>(viewModel);
      widget = const SelectContact();
    });

    testWidgets('renders app bar title correctly', (WidgetTester tester) async {
      when(viewModel.orgMembersList).thenReturn(<User>[
        User(firstName: 'John', id: '1', image: 'avatar.png'),
      ]);
      await tester.pumpWidget(MaterialApp(home: widget));

      final titleFinder = find.text('Select Contacts');
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('calls ViewModel methods on initialisation',
        (WidgetTester tester) async {
      when(viewModel.orgMembersList).thenReturn(<User>[
        User(firstName: 'John', id: '1', image: 'avatar.png'),
      ]);

      await tester.pumpWidget(MaterialApp(home: widget));

      verify(viewModel.initialise());
      verify(viewModel.getCurrentOrgUsersList());
    });

    testWidgets('renders list tiles correctly', (WidgetTester tester) async {
      when(viewModel.orgMembersList).thenReturn(<User>[
        User(firstName: 'John', id: '1', image: 'avatar.png'),
        User(firstName: 'Jane', id: '2', image: 'avatar.png'),
      ]);

      await tester.pumpWidget(MaterialApp(home: widget));

      final firstTileFinder = find.text('John');
      expect(firstTileFinder, findsOneWidget);

      final secondTileFinder = find.text('Jane');
      expect(secondTileFinder, findsOneWidget);

      final avatarFinder = find.byType(CircleAvatar);
      expect(avatarFinder, findsNWidgets(2));
    });

    tearDown(() {
      locator.reset();
    });
  });
}
