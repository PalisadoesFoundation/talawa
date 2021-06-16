import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/view_model/base_view_model.dart';

class MainScreenViewModel extends BaseModel {
  int currentIndex = 0;
  onTabTapped(int index) {
    currentIndex = index;
    setState(ViewState.idle);
  }
}
