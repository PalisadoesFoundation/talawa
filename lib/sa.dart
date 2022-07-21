import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: YellowBird(
            Text(
              "Hello, World!",
            ),
          ),
        ),
      ),
    );
  }
}

// typedef CustomCallBack = StatefulWidget;

class YellowBird extends StatefulWidget {
  final Widget widget;

  const YellowBird(
    this.widget, {
    Key? key,
  }) : super(key: key);

  @override
  State<YellowBird> createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    return widget;
  }
}
