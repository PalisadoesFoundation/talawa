import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool loading = true;
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return loading?CircularProgressIndicator():Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/images/error.svg',width: MediaQuery.of(context).size.width/1.3,),
        SizedBox(
          height:30
        ),
        Text('No data or something went wrong',style: TextStyle(color: Colors.red),),
      ],
    );
  }
}