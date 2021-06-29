import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  bool get isBusy => _state == ViewState.busy;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
