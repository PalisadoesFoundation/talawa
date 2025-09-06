// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/waiting_view_model.dart';

import '../../helpers/test_helpers.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUp(() {
    registerServices();
  });
  group("WaitingViewModel Test - ", () {
    test("Check if it's initialized correctly", () {
      final model = WaitingViewModel();
      final context = MockBuildContext();
      model.initialise(context);

      expect(model.currentUser, userConfig.currentUser);
      expect(
        model.pendingRequestOrg,
        userConfig.currentUser.membershipRequests,
      );
      expect(
        model.greeting,
        [
          {
            'text': "Please wait",
            'textStyle': Theme.of(context).textTheme.headlineSmall,
          },
          {
            'text': " ${model.currentUser.firstName} ",
            'textStyle':
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
          },
          {
            'text': "for organisation(s) to accept your invitation.",
            'textStyle': Theme.of(context).textTheme.headlineSmall,
          },
        ],
      );
    });
    test("Check if joinOrg() is pushing the joinOrg route", () {
      final model = WaitingViewModel();
      final context = MockBuildContext();
      model.initialise(context);
      when(navigationService.pushScreen(Routes.joinOrg, arguments: '-1'))
          .thenAnswer((_) async {});

      model.joinOrg();

      verify(navigationService.pushScreen(Routes.joinOrg, arguments: '-1'));
    });
    test("Check if logout() is working properly", () async {
      final model = WaitingViewModel();
      final context = MockBuildContext();
      model.initialise(context);

      when(
        navigationService.removeAllAndPush(
          Routes.languageSelectionRoute,
          Routes.splashScreen,
          arguments: '0',
        ),
      ).thenAnswer((_) async {});

      final user = Hive.box<User>('currentUser');
      final url = Hive.box('url');

      await user.put('test', model.currentUser);
      await url.put('test', 'fakeUrl');

      model.logout();

      verify(
        navigationService.removeAllAndPush(
          Routes.languageSelectionRoute,
          Routes.splashScreen,
          arguments: '0',
        ),
      );

      Future.delayed(Duration.zero).then((_) {
        expect(user.get('test'), null);
        expect(url.get('test'), null);
      });
    });
  });
}
