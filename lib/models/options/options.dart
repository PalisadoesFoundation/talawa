import 'package:flutter/material.dart';

///This class creates a Option model.
class Options {
  Options({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailingIconButton,
  });

  Widget icon;
  String title;
  String subtitle;
  IconButton? trailingIconButton;
}
