import 'package:flutter/cupertino.dart';
import 'package:talawa/views/widgets/flutter_pw_validator/Resource/Strings.dart';

//This class helps to recognize user selected condition and check them
class ConditionsHelper {
  Map<String, bool> _selectedCondition;

  //Recognize user selected condition from widget constructor to put them on map with their value
  void setSelectedCondition(
      int minLength, uppercaseCharCount, numericCharCount, specialCharCount) {
    _selectedCondition = {
      if (minLength > 0) Strings.AT_LEAST: false,
      if (uppercaseCharCount > 0) Strings.UPPERCASE_LETTER: false,
      if (numericCharCount > 0) Strings.NUMERIC_CHARACTER: false,
      if (specialCharCount > 0) Strings.SPECIAL_CHARACTER: false
    };
  }

  //Checks condition new value and passed validator, sets that in map and return new value;
  dynamic checkCondition(int userRequestedValue, Function validator,
      TextEditingController controller, String key, dynamic oldValue) {
    dynamic newValue;

    //if the userRequested Value is grater than 0 that means user select them and we have to check new value;
    if (userRequestedValue > 0) {
      newValue = validator(controller.text, userRequestedValue);
    } else
      newValue = null;

    if (newValue == null)
      return null;
    else if (newValue != oldValue) {
      _selectedCondition[key] = newValue;
      return newValue;
    } else
      return oldValue;
  }

  update(String key,dynamic newValue){
    _selectedCondition[key] = newValue;
  }

  Map<String, bool> getter() => _selectedCondition;
}
