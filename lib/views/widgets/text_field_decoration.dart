
import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';

class FormFieldFormatting {
  static formFieldFormatting(
      {String hintText, String labelText, IconData prefixIcon}) {
    return InputDecoration(
      border: OutlineInputBorder(
          borderSide:
          BorderSide(color: UIData.secondaryColor),
          borderRadius: BorderRadius.circular(20.0)),
      prefixIcon: Icon(prefixIcon,
          color: UIData.secondaryColor),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.black),
      alignLabelWithHint: true,
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
    );
  }
}