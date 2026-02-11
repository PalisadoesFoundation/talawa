import 'package:flutter/material.dart';

/// Helper function to build a test widget with a CustomPaint painter
///
/// This helper creates a standard MaterialApp scaffold with a CustomPaint
/// widget for testing custom painters in a consistent way across all tests.
///
/// Parameters:
/// - [painter]: The CustomPainter instance to test
/// - [key]: A unique key to identify the CustomPaint widget in tests
/// - [width]: The width of the canvas (default: 200)
/// - [height]: The height of the canvas (default: 200)
Widget buildPainterTestWidget({
  required CustomPainter painter,
  required Key key,
  double width = 200,
  double height = 200,
}) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            key: key,
            painter: painter,
          ),
        ),
      ),
    ),
  );
}
