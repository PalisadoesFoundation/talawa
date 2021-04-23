import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';

class FormFieldFormatting {
  static InputDecoration formFieldFormatting(
      {String hintText, String labelText, IconData prefixIcon}) {
    return InputDecoration(
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: UIData.secondaryColor),
          borderRadius: BorderRadius.circular(20.0)),
      prefixIcon: Icon(prefixIcon, color: UIData.secondaryColor),
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black),
      alignLabelWithHint: true,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
