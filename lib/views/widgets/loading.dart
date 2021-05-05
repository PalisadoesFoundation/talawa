import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talawa/utils/ui_scaling.dart';

class Loading extends StatefulWidget {
  const Loading({Key key, this.isNetworkError,this.emptyContentMsg ,this.refreshFunction})
      : super(key: key);
  final bool isNetworkError;
  final String emptyContentMsg;
  final Future Function() refreshFunction;
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
    _timer = Timer(const Duration(seconds: 5), () {
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

  refreshLoading() async{
    setState(() {
        loading = true;
      });
    await widget.refreshFunction();
    setState(() {
        loading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return loading && widget.isNetworkError == null
        ? const CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/error.svg',
                width: SizeConfig.screenWidth / 1.3,
              ),
              SizedBox(
                  height: SizeConfig.safeBlockVertical * 3.75),
              widget.isNetworkError != null
                    ? widget.isNetworkError
                        ? showErrorText("Something went wrong")
                        : showEmptyContentText(widget.emptyContentMsg)
                    : showErrorText('No data or something went wrong'),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 10,
              ),
              Container(
                height: 50,
                width: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(-1.0, -4.0),
                      end: Alignment(1.0, 4.0),
                      colors: [
                        Color(0xFFd9d9d9),
                        Color(0xFFffffff),
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFd9d9d9),
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Color(0xFFffffff),
                        offset: Offset(-5.0, -5.0),
                        blurRadius: 10.0,
                        spreadRadius: 1.0),
                ]),
                child: TextButton(
                  onPressed: refreshLoading, 
                  child: Text(
                    loading 
                    ?'Refreshing...'
                    :'Refresh'
                  ),
                ),
              )
            ],
          );
  }
}

Widget showErrorText(String msg){
  return Text(
    msg,
    style: const TextStyle(color: Colors.red),
  );
}

Widget showEmptyContentText(String msg){
  return Text(
    msg,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.grey),
  );
}