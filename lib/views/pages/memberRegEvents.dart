import 'package:flutter/material.dart';

class RegisterdEvents extends StatefulWidget {
  RegisterdEvents({Key key}) : super(key: key);

  @override
  _RegisterdEventsState createState() => _RegisterdEventsState();
}

class _RegisterdEventsState extends State<RegisterdEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registered Events',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('Event ' + index.toString()),
            );
          }),
    );
  }
}
