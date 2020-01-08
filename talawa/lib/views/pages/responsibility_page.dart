import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talawa/controllers/responsibility_controller.dart';
import 'package:talawa/views/widgets/common_scaffold.dart';
import 'package:talawa/model/responsibility.dart';

class ResponsibilityPage extends StatelessWidget {
  String respId;
  ResponsibilityController responsibilityController =
      new ResponsibilityController();
  @override
  Widget build(BuildContext context) {
    respId = ModalRoute.of(context).settings.arguments;
    return scaffold();
  }

  scaffold() => FutureBuilder<Responsibility>(
      future: responsibilityController.getResponsibility(respId),
      builder: (_context, snapshot) {
        return snapshot.hasData
            ? CommonScaffold(
                appTitle: snapshot.data.name,
                bodyData: bodyData(snapshot.data),
              )
            : Center(child: CircularProgressIndicator());
      });

  bodyData(Responsibility resp) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                resp.name,
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                resp.date,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                resp.time,
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
}
