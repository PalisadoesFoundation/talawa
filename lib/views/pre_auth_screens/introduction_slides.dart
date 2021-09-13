import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';

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
          title: AppLocalizations.of(context)!.strictTranslate("Communities"),
          body: AppLocalizations.of(context)!.strictTranslate(
              "Discover community or Start your own community & watch it grow"),
          image: Image.asset("assets/images/community.png"),
        ),
        PageViewModel(
          title:
              AppLocalizations.of(context)!.strictTranslate("Event Calendar"),
          body: AppLocalizations.of(context)!.strictTranslate(
              "Schedule, create and view your upcoming community events on Talawa. Start your own or register for existing events."),
          image: Image.asset("assets/images/event.png"),
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.strictTranslate("Group Chat"),
          body: AppLocalizations.of(context)!.strictTranslate(
              "Talk to your own community groups. Talawa app makes it simple & secure to use."),
          image: Image.asset("assets/images/chat.png"),
        ),
      ],
      onDone: () {
        navigationService.pushScreen('/setUrl', arguments: '');
      },
      onSkip: () {
        navigationService.pushScreen('/setUrl', arguments: '');
      },
      done: Text(AppLocalizations.of(context)!.strictTranslate('Get Started'),
          style: const TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: Text(AppLocalizations.of(context)!.strictTranslate('Skip')),
    );
  }
}
