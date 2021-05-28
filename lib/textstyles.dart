import 'package:flutter/material.dart';

const appNameStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 26,
  color: Colors.black,
);

const fromStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 10,
  color: Color(0xFF737373),
);

const palisadoesStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 12,
  color: Colors.black,
);

const selectLanguageStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 20,
  color: Color(0xFF737373),
);

const greetingStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 24,
  color: Color(0xFF737373),
);

const greetingSubStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 24,
  color: Color(0xFF4285F4),
);

const languageStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: Color(0xFF737373),
);

const languageSelectStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18,
  color: Color(0xFF008A37),
);

const urlVerifyStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: Color(0xFF008A37),
);

const languageDefaultStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: Color(0xFF4285F4),
);

InputDecoration textInputDecoration = const InputDecoration(
  border: InputBorder.none,
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF008A37)),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  hintText: 'hintText',
  labelText: 'labelText',
  labelStyle: TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.539261),
    fontWeight: FontWeight.w400,
  ),
  errorMaxLines: 3,
);
const scaffoldColor = Colors.white;
