// ignore_for_file: talawa_api_doc

import 'dart:convert';

import 'package:flutter/foundation.dart';

void devPrint(String str) {
  if (kDebugMode) debugPrint(str, wrapWidth: 1000);
}

void printJson(String json) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');

  final String prettyprint = encoder.convert(json);

  devPrint(prettyprint);
}
