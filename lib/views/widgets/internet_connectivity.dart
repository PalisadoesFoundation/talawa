import 'package:flutter/material.dart';

//this file is there to check the internet connectivity of the device it is being running

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
        children: const [
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
