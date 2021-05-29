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
          color: const Color(0xFFe5e5e5),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          color: const Color(0xFFf2f3f5),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.article,
                        color: Color(0xFF34AD64),
                      ),
                    ),
                    const Text(
                      "See all Pinned news",
                      style: languageStyle,
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
