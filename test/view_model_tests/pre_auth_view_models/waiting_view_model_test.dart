// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/waiting_view_model.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUp(() {
    registerServices();
  });
  group("WaitingViewModel Test - ", () {
    test("Check if it's initialized correctly", () {
      final model = WaitingViewModel();
      model.initialise();
      expect(
        model.pendingRequestOrg,
        userConfig.currentUser.membershipRequests,
      );
    });
    test("Check if joinOrg() is pushing the joinOrg route", () {
      final model = WaitingViewModel();
      model.initialise();
      when(navigationService.pushScreen(Routes.joinOrg, arguments: '-1'))
          .thenAnswer((_) async {});

      model.joinOrg();

      verify(navigationService.pushScreen(Routes.joinOrg, arguments: '-1'));
    });
    test("Check if settingPageNavigation() is working properly", () async {
      final model = WaitingViewModel();
      model.initialise();

      when(
        navigationService.pushScreen(
          Routes.splashScreen,
        ),
      ).thenAnswer((_) async {});

      model.settingPageNavigation();

      verify(
        navigationService.pushScreen(
          Routes.splashScreen,
        ),
      ).call(1);
    });
  });
}
