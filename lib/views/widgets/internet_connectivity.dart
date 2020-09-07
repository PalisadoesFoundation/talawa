import 'package:flutter/material.dart';

class NoInternetConnection extends StatefulWidget {
  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Text(
            'No Internet Connection.',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.signal_cellular_connected_no_internet_4_bar,
            color: Colors.red,
          )
        ],
      )),
    );
  }
}
