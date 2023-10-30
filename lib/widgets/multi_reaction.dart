import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MultiReactButton extends StatefulWidget {
  const MultiReactButton({super.key, required this.toggle});
  final VoidCallback toggle;

  @override
  State<MultiReactButton> createState() => _MultiReactionButtonState();
}

class _MultiReactionButtonState extends State<MultiReactButton> {
  @override
  Widget build(BuildContext context) {
    return ReactionButton(
      itemSize: Size.square(35),
      onReactionChanged: (value) {
        // ignore: unnecessary_statements
        widget.toggle;
      },
      selectedReaction: Reaction(
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: 35,
            child: SvgPicture.asset(
              'assets/images/🦆 icon _like_.svg',
            ),
          ),
        ),
        value: 12,
      ),
      reactions: [
        Reaction(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                'assets/icons/angel.svg',
              ),
            ),
          ),
          value: 1,
        ),
        Reaction(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                'assets/icons/happy.svg',
              ),
            ),
          ),
          value: 3,
        ),
        Reaction(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                'assets/icons/laugh.svg',
              ),
            ),
          ),
          value: 4,
        ),
        Reaction(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                'assets/icons/love.svg',
              ),
            ),
          ),
          value: 1,
        ),
        Reaction(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                'assets/icons/tear.svg',
              ),
            ),
          ),
          value: 1,
        ),
        Reaction(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              width: 35,
              child: SvgPicture.asset(
                'assets/icons/angry.svg',
              ),
            ),
          ),
          value: 2,
        ),
      ],
    );
  }
}
