// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';

/// This class sets up the post page.
/// To implement the "show less" and "show more" functions for the text,
/// we divide the text into two parts: firstHalf and secondHalf. A flag is set to
/// track whether to display either the firstHalf or both(the entire text).
class DescriptionTextWidget extends StatefulWidget {
  const DescriptionTextWidget({required this.text});
  final String text;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  //setting the flag to true initially
  bool flag = true;

  @override
  void initState() {
    super.initState();
    // If the length of the text is greater than 150, we divide it into two parts: firstHalf and secondHalf.
    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: 'open-sans'),
            )
          : Column(
              children: <Widget>[
                Text(
                  // If the flag is true, we only display the firstHalf.
                  // If it is false, we display the entire text.
                  flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontFamily: 'open-sans'),
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
