import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  final Function reload;
  Loading({Key key,this.reload}) : super(key: key);
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool loading = true;
  Timer _timer;
  void loadingFunc() {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    _timer = Timer(Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadingFunc();
    print(1);
  }

  @override
  void didUpdateWidget(Loading oldWidget) {
    super.didUpdateWidget(oldWidget);
    loadingFunc();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/error.svg',
                width: MediaQuery.of(context).size.width / 1.3,
              ),
              SizedBox(height: 30),
              Text(
                'No data or something went wrong',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 30),
              TextButton.icon(
                label: Text('Re-Try'), onPressed: widget.reload, icon: Icon(Icons.autorenew),
              )
            ],
          );
  }
}
