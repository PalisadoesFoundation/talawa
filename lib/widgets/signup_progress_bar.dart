import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:timelines/timelines.dart';

class SignupProgressBar extends StatelessWidget {
  SignupProgressBar({required Key key, required this.currentPageIndex})
      : super(key: key);

  final int currentPageIndex;
  final List<String> progressLabel = [
    'Select\nOrganization',
    'Enter Details',
    'Final',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeConfig.screenHeight! * 0.15,
      child: Timeline.tileBuilder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (_, index) => Text(
            progressLabel[index],
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: index <= currentPageIndex
                    ? const Color(0xFF008A37)
                    : const Color(0xFF737373)),
            textAlign: TextAlign.center,
          ),
          connectorBuilder: (_, index, __) {
            return SolidLineConnector(
                space: 30,
                color: index < currentPageIndex
                    ? const Color(0xFF008A37)
                    : const Color(0xFF737373));
          },
          indicatorBuilder: (_, index) {
            return DotIndicator(
              size: 25,
              color: index <= currentPageIndex
                  ? const Color(0xFF008A37)
                  : const Color(0xFF737373),
              child: index < currentPageIndex
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 20,
                    )
                  : const SizedBox(),
            );
          },
          itemExtentBuilder: (_, __) => MediaQuery.of(context).size.width / 3,
          itemCount: 3,
        ),
      ),
    );
  }
}
