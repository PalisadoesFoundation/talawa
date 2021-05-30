import 'package:flutter/material.dart';

import '../../../textstyles.dart';

class PinnedPostCarousel extends StatelessWidget {
  const PinnedPostCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 220,
            color:
                Theme.of(context).colorScheme.primaryVariant.withOpacity(0.5)),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          color: Theme.of(context).colorScheme.primaryVariant,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.article,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Text(
                      "See all Pinned news",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        )
      ],
    );
  }
}
