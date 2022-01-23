import 'package:flutter/material.dart';

Path getPath(Size size) {
  final Path path_0 = Path();
  path_0.moveTo(size.width * 0.2376568, size.height * 0.4381250);
  path_0.cubicTo(
    size.width * 0.2321886,
    size.height * 0.4003127,
    size.width * 0.2254689,
    size.height * 0.3343750,
    size.width * 0.2254689,
    size.height * 0.3343750,
  );
  path_0.lineTo(size.width * 0.2246875, size.height * 0.3343750);
  path_0.cubicTo(
    size.width * 0.2246875,
    size.height * 0.3343750,
    size.width * 0.2179686,
    size.height * 0.4003127,
    size.width * 0.2125000,
    size.height * 0.4381250,
  );
  path_0.lineTo(size.width * 0.1951561, size.height * 0.5553136);
  path_0.lineTo(size.width * 0.2546886, size.height * 0.5553136);
  path_0.lineTo(size.width * 0.2376568, size.height * 0.4381250);
  path_0.close();
  path_0.moveTo(size.width * 0.9625000, 0);
  path_0.lineTo(size.width * 0.5250000, 0);
  path_0.lineTo(size.width * 0.5250000, size.height);
  path_0.lineTo(size.width * 0.9625000, size.height);
  path_0.cubicTo(
    size.width * 0.9832818,
    size.height,
    size.width,
    size.height * 0.9665636,
    size.width,
    size.height * 0.9250000,
  );
  path_0.lineTo(size.width, size.height * 0.07500000);
  path_0.cubicTo(
    size.width,
    size.height * 0.03343750,
    size.width * 0.9832818,
    0,
    size.width * 0.9625000,
    0,
  );
  path_0.close();
  return path_0;
}
