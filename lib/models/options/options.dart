import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Options {
  Options(
      {required this.icon,
      required this.title,
      required this.subtitle,
      this.trailingIconButton});

  Widget icon;
  String title;
  String subtitle;
  IconButton? trailingIconButton;
}
