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
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            const Center(
              child: TalawaPluginProvider(
                demo: true,
                child: const Text(
                  "Hello, bro!",
                  style: TextStyle(fontSize: 42),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            const Center(
              child: TalawaPluginProvider(
                demo: true,
                child: const Text(
                  "Hello, Sir!",
                  style: TextStyle(fontSize: 42),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class TalawaPluginProvider extends StatelessWidget {
  final Widget? child;
  final bool demo;

  const TalawaPluginProvider(
      {Key? key, @required this.child, required this.demo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(visible: demo, child: child!);
  }
}
