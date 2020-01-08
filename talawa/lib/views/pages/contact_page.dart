import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talawa/views/widgets/common_scaffold.dart';
import 'package:talawa/views/widgets/user_bubble.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return scaffold();
  }

  scaffold() => CommonScaffold(
        appTitle: 'Contact',
        bodyData: bodyData(),
      );

  bodyData() {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 0,
              color: Colors.white,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: UserBubble(
                          user: 'S',
                        )),
                    Expanded(
                        flex: 8,
                        child: Text(
                          'Seville Grant',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              color: Colors.white,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 8,
                        child: Text(
                          'Contact Number:',
                          style: TextStyle(fontSize: 20),
                        )),
                    Expanded(
                        flex: 8,
                        child: Text(
                          '+18765671320',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0,
              color: Colors.white,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Email:',
                          style: TextStyle(fontSize: 20),
                        )),
                    Expanded(
                        flex: 8,
                        child: Text(
                          'sgrant@gmail.com',
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
