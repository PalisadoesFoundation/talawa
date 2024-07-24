// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';

import '../helpers/test_helpers.dart';
import '../service_tests/third_party_service_test.dart/connectivity_service_test.dart';

void main() {
  group('ProgressDialogViewModelTest -', () {
    group('initialise -', () {
      getAndRegisterConnectivity();
      AppConnectivity.isOnline = true;

      final model = ProgressDialogViewModel();

      test(
          'When called and connectivity is present, connectivityPresent must be set to true',
          () async {
        await model.initialise();

        expect(model.connectivityPresent, true);
      });
    });
  });
}
