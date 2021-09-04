import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:talawa/locator.dart';

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
          title: "Communities",
          body:
              "Discover community or\n Start your own community & watch it grow",
          image: Image.asset("assets/images/community.png"),
        ),
        PageViewModel(
          title: "Event Calendar",
          body:
              "Schedule, create and view your upcoming community events on Talawa.\nStart your own or register for existing events.",
          image: Image.asset("assets/images/event.png"),
        ),
        PageViewModel(
          title: "Group Chat",
          body:
              "Talk to your own community groups.\nTalawa app makes it simple & secure to use.",
          image: Image.asset("assets/images/chat.png"),
        ),
      ],
      onDone: () {
        navigationService.pushScreen('/setUrl', arguments: '');
      },
      done: const Text('Get Started',
          style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text('Skip'),
    );
  }
}
