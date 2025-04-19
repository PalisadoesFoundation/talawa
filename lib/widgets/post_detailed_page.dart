import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';

/// This class sets up the post page.
///
/// To implement the "show less" and "show more" functions for the text,
/// we divide the text into two parts: firstHalf and secondHalf. A flag is set to
/// track whether to display either the firstHalf or both(the entire text).
class DescriptionTextWidget extends StatefulWidget {
  const DescriptionTextWidget({required this.text});

  /// actual description to be displayed.
  final String text;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  /// before clicking show more.
  late String firstHalf;

  /// After the show more.
  late String secondHalf;

  /// tags in the post.
  late String tag;

  /// setting the flag to true initially (is show more turned on).
  bool flag = true;

  @override
  void initState() {
    super.initState();
    // If the length of the text is greater than 150, we divide it into two parts: firstHalf and secondHalf.
    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, widget.text.length);
      tag = "";
    } else {
      if (widget.text.split("#").length == 2) {
        firstHalf = widget.text.split("#")[0];
        tag = widget.text.split("#")[1];
      } else if (widget.text.split("#").length == 1) {
        firstHalf = widget.text;
        tag = "";
      } else {
        firstHalf = widget.text.split("#")[0];
        tag = "";
      }
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: secondHalf.isEmpty
          ? Column(
              children: [
                Text(
                  firstHalf,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: 'open-sans',
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                tag != ""
                    ? Text(
                        "# $tag",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontFamily: 'open-sans',
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                      )
                    : Container(),
              ],
            )
          : Column(
              children: <Widget>[
                Text(
                  // If the flag is true, we only display the firstHalf.
                  // If it is false, we display the entire text.
                  flag ? "$firstHalf..." : (firstHalf + secondHalf),
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: 'open-sans',
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          //Setting the flag to false on tapping the "show more" text.
                          flag = !flag;
                        });
                      },
                      child: Text(
                        flag
                            ? AppLocalizations.of(context)!
                                .strictTranslate("show more")
                            : AppLocalizations.of(context)!
                                .strictTranslate("show less"),
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
