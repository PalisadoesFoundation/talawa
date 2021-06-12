import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar(
      {Key? key,
      required this.isImageNull,
      this.orgFirstAlphabet,
      this.imageUrl,
      this.fontSize = 40})
      : super(key: key);
  final bool isImageNull;
  final String? orgFirstAlphabet;
  final String? imageUrl;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return isImageNull
        ? CircleAvatar(
            backgroundColor:
                Theme.of(context).iconTheme.color!.withOpacity(0.2),
            child: Text(
              orgFirstAlphabet!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: fontSize),
            ),
          )
        : CircleAvatar(
            backgroundColor:
                Theme.of(context).iconTheme.color!.withOpacity(0.2),
            backgroundImage: NetworkImage(imageUrl!),
          );
  }
}
