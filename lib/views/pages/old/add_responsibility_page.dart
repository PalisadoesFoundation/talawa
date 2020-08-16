import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talawa/controllers/responsibility_controller.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:talawa/views/widgets/common_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:talawa/views/widgets/forms/add_responsibility_form.dart';

class AddResponsibilityPage extends StatefulWidget {
  final int activityId;
  AddResponsibilityPage(this.activityId);
  @override
  _AddResponsibilityPageState createState() => _AddResponsibilityPageState();
}

class _AddResponsibilityPageState extends State<AddResponsibilityPage> {
  int activityId;
  static final ResponsibilityController responsibilityController =
      new ResponsibilityController();
  final controller = PageController(
    initialPage: 0,
  );
  static int userId = 0;

  static final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return scaffold();
  }

  scaffold() => CommonScaffold(
        appTitle: 'Add Responsibility',
        bodyData: AddResponsibilityForm(activityId: widget.activityId),
      );
}
