// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ProgressDialogViewModelTest -', () {
    group('initialise -', () {
      setUp(() {
        getAndRegisterConnectivity();
      });

      test(
          'When called and connectivity is present, connectivityPresent must be set to true',
          () async {
        // Simulate online state
        AppConnectivity.isOnline = true;

        final model = ProgressDialogViewModel();

        await model.initialise();

        expect(model.connectivityPresent, true);
      });

      test(
          'When called and connectivity is absent, connectivityPresent must be set to false',
          () async {
        // Simulate offline state
        AppConnectivity.isOnline = false;

        final model = ProgressDialogViewModel();

        await model.initialise();

        expect(model.connectivityPresent, false);
      });
    });
  });
}
