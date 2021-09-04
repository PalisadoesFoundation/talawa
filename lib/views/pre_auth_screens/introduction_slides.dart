import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionSlides extends StatefulWidget {
  const IntroductionSlides({Key? key}) : super(key: key);

  @override
  _IntroductionSlidesState createState() => _IntroductionSlidesState();
}

class _IntroductionSlidesState extends State<IntroductionSlides> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title 1",
          body: "Body",
          image: Image.asset("assets/images/launcher_icon.png"),
        ),
        PageViewModel(
          title: "Title 2",
          body: "Body",
          image: Image.asset("assets/images/launcher_icon.png"),
        ),
        PageViewModel(
          title: "Title 3",
          body: "Body",
          image: Image.asset("assets/images/launcher_icon.png"),
        ),
      ],
      onDone: () {
        print("Done");
      },
      done: const Text('Get Started',
          style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text('Skip'),
    );
  }
}
