import 'package:flutter/material.dart';
import 'package:talawa/color_pallete.dart';
import 'package:talawa/services/size_config.dart';

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
          color: Theme.of(context).colorScheme.primaryVariant.withOpacity(0.5),
          child: const CustomCarouselScroller(
            key: Key('Carousel'),
          ),
        ),
        Container(
          height: 50,
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          color: Theme.of(context).colorScheme.primaryVariant,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.article,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Text(
                  "See all Pinned news",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
            ],
          ),
        )
      ],
    );
  }
}

class CustomCarouselScroller extends StatefulWidget {
  const CustomCarouselScroller({Key? key}) : super(key: key);

  @override
  _CustomCarouselScrollerState createState() => _CustomCarouselScrollerState();
}

class _CustomCarouselScrollerState extends State<CustomCarouselScroller> {
  final PageController controller = PageController(initialPage: 0);
  int pindex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 15.0,
                backgroundColor: Color(0xFF737373),
              ),
              title: Text("User Name"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description.length > 90
                    ? "${description.substring(0, 90)}..."
                    : description,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: const Color(0xFF737373)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Divider(
                          thickness: 3.0,
                          color: pindex == i ? talawaYellow : Colors.grey,
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
      PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            pindex = index;
          });
        },
        children: const <Widget>[
          Center(
            child: Text('First Page'),
          ),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          ),
          Center(
            child: Text('Fourth Page'),
          )
        ],
      ),
    ]);
  }
}

const String description =
    "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";
