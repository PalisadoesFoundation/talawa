import 'package:flutter/material.dart';
import 'package:talawa/enums/viewstate.dart';

//this is the base model to change the notifier
class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
