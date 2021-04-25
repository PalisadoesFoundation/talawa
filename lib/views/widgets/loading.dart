import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loading extends StatefulWidget {
  const Loading({Key key, this.isShowingError}) : super(key: key);
  final bool isShowingError;
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
    return loading && widget.isShowingError == null
        ? const CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/error.svg',
                width: MediaQuery.of(context).size.width / 1.3,
              ),
              const SizedBox(height: 30),
              Text(
                widget.isShowingError != null
                    ? widget.isShowingError
                        ? "Something went wrong"
                        : "No News Feed to show"
                    : 'No data or something went wrong',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          );
  }
}
