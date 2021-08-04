import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';

class DescriptionTextWidget extends StatefulWidget {
  const DescriptionTextWidget({required this.text});
  final String text;

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

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
                  .bodyText2!
                  .copyWith(fontFamily: 'open-sans'),
            )
          : Column(
              children: <Widget>[
                Text(
                  flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontFamily: 'open-sans'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
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
