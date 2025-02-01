import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:timelines_plus/timelines_plus.dart';

/// A widget that displays a progress indicator/flow for the Sign-Up or Registration process.
///
/// The widget uses a horizontal timeline to represent the progress
/// through different stages of the Sign-Up process.
///
/// **params**:
/// * `key`: The unique identifier for the widget.
/// * `currentPageIndex`: The index of the current step in the Sign-Up process.
///
/// **returns**:
///   None
class SignupProgressIndicator extends StatelessWidget {
  SignupProgressIndicator({required Key key, required this.currentPageIndex})
      : super(key: key);

  /// The index of the current step in the Sign-Up process.
  final int currentPageIndex;

  /// The list of labels for each step in the progress indicator.
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
            AppLocalizations.of(context)!.strictTranslate(progressLabel[index]),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  /// Sets the color of the text.
                  /// If the step index is less than or equal to `currentPageIndex`,
                  /// the color is green (visited). Otherwise, show fade(not visited) color.
                  color: index <= currentPageIndex
                      ? const Color(0xFF008A37)
                      : const Color(0xFF737373),
                ),
            textAlign: TextAlign.center,
          ),
          connectorBuilder: (_, index, __) {
            return SolidLineConnector(
              space: 30,

              /// Sets the color of the connector line.
              /// If the step index is less than `currentPageIndex`,
              /// the color is green (visited). Otherwise, show fade(not visited) color.
              color: index < currentPageIndex
                  ? const Color(0xFF008A37)
                  : const Color(0xFF737373),
            );
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
