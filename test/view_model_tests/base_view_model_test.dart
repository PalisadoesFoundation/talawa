// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/view_model/base_view_model.dart';

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  BaseModel getBaseModel() {
    final model = BaseModel();
    return model;
  }

  group("BaseViewModel Test- ", () {
    final callback = MockCallbackFunction();

    test("When initialized viewstate should be ViewState.idle", () {
      final model = getBaseModel();
      expect(model.state, ViewState.idle);
    });
    test("When initialized isBusy should be false ", () {
      final model = getBaseModel();
      expect(model.isBusy, false);
    });

    test(
        "When setState is called the state should reflect the state passed to the setState function ",
        () {
      final model = getBaseModel();
      model.setState(ViewState.busy);
      expect(model.state, ViewState.busy);
      model.setState(ViewState.idle);
      expect(model.state, ViewState.idle);
    });

    test("When setState is called, BaseModel should call notifyListners", () {
      final model = getBaseModel();
      model.addListener(callback);
      model.setState(ViewState.busy);
      verify(callback());
    });
  });
}
