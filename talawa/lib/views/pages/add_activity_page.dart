import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talawa/views/widgets/_widgets.dart';
import 'package:talawa/views/widgets/common_scaffold.dart';
import 'package:talawa/views/widgets/forms/add_activity_form.dart';

class AddActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appTitle: 'Add Activity',
      bodyData: AddActivityForm(),
    );
  }
}
