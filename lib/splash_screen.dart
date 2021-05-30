import 'package:flutter/material.dart';
import 'package:talawa/size_config.dart';
import 'package:talawa/textstyles.dart';

import 'custom_painters/talawa_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      Navigator.pushReplacementNamed(context, '/selectLang');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.screenWidth! * 0.6);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: Size(SizeConfig.screenWidth! * 0.6,
                  (SizeConfig.screenWidth! * 0.6).toDouble()),
              painter: AppLogo(),
            ),
          ),
          Positioned(
              top: SizeConfig.screenHeight! / 1.5,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TALAWA',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              )),
          Positioned(
              top: SizeConfig.screenHeight! / 1.08,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'from',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )),
          Positioned(
              top: SizeConfig.screenHeight! / 1.05,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PALISADOES',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
