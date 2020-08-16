import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class EventDetail extends StatefulWidget {
  Map event;
  EventDetail({Key key, @required this.event}) : super(key: key);

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    print(widget.event);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              color: UIData.primaryColor,
            ),
            ListTile(
              leading: Text(
                'Tasks',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Text('Task ' + index.toString()),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
