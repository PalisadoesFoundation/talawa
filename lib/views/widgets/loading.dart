import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talawa/utils/ui_scaling.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);
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
    _timer = Timer(const Duration(seconds: 10), () {
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
        ? const CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/error.svg',
                width: SizeConfig.screenWidth / 1.3,
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 3.75),
              const Text(
                'No data or something went wrong',
                style: TextStyle(color: Colors.red),
              ),
            ],
          );
  }
}
