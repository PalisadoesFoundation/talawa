import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:talawa/utils/uidata.dart';

class EventDetail extends StatefulWidget {
  Map event;
  EventDetail({Key key, @required this.event}) : super(key: key);

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print(widget.event);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.event['title'],
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: FittedBox(
                child: Container(
                  height: 300,
                  width: width,
                  color: UIData.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        leading: Text(
                          widget.event['description'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          widget.event['recurrance'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          widget.event['date'],
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          widget.event['location'],
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      ListTile(
                          leading: Text(
                        widget.event['startTime'] +
                            ' to ' +
                            widget.event['endTime'],
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                    ],
                  ),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              color: UIData.secondaryColor,
              height: 60,
              child: Text(
                'Tasks',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ExpansionTile(
                    title: Text('Task ' + index.toString()),
                    children: <Widget>[
                      ListTile(
                        leading: Text('Description:'),
                      ),
                      ListTile(
                        leading: Text('Assigned To:'),
                      ),
                      ListTile(
                        leading: Text('Due Date:'),
                      )
                    ]);
              },
              childCount: 20,
            )),
          ),
        ],
      ),
    );
  }
}
