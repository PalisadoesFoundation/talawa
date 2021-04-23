import 'package:flutter/material.dart';

// Function for ignoring overflow errors.
// ignore: prefer_function_declarations_over_variables
void Function(FlutterErrorDetails) onErrorIgnoreOverflowErrors = (
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  assert(details != null);
  assert(details.exception != null);

  bool ifIsOverflowError = false;

  // Detect overflow error.
  final exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith(
            "A RenderFlex overflowed by",
          ),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError) {
    print("Over flow error");
  }

  // Throw other errors.
  else {
    FlutterError.dumpErrorToConsole(
      details,
      forceReport: forceReport,
    );
  }
};
