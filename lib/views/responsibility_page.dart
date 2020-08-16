import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/responsibility_controller.dart';
import 'package:talawa/views/widgets/common_scaffold.dart';
import 'package:talawa/model/responsibility.dart';
import 'package:intl/intl.dart';
import 'package:talawa/views/widgets/forms/edit_responsibility_form.dart';

class ResponsibilityPage extends StatelessWidget {
  int respId;
  ResponsibilityController responsibilityController =
      new ResponsibilityController();
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    respId = ModalRoute.of(context).settings.arguments;
    return scaffold();
  }

  scaffold() => Consumer<ResponsibilityController>(
    builder: (context, controller, child){
      return FutureBuilder<Responsibility>(
      future: responsibilityController.getResponsibility(context, respId),
      builder: (_context, snapshot) {
        return snapshot.hasData
            ? CommonScaffold(
                action: PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text("Edit"),
                    ),
                  ],
                  onSelected: (result) {
                    if (result == 1) {}
                    {
                      editUserForm();
                    }
                  },
                ),
                appTitle: snapshot.data.title,
                bodyData: bodyData(snapshot.data),
              )
            : Center(child: CircularProgressIndicator());
      });
    },
  );

  bodyData(Responsibility resp) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                resp.title,
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                DateFormat("MMMM d, y").format(resp.datetime),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                DateFormat("h:m aaa").format(resp.datetime),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                resp.description,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ));
  }

  editUserForm() {
    showDialog(
        context: _context,
        builder: (BuildContext context) {
          return EditResponsibilityForm(respId: respId);
        });
  }
}
