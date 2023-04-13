// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

/// This widget returns a tile containing the name of the member.
/// Along with the name, there is a circle avatar which either contains
/// the image uploaded by the user or the first character of his/her name in
/// uppercase.
class MemberNameTile extends StatelessWidget {
  const MemberNameTile({
    Key? key,
    required this.userName,
    this.userImage,
    required this.onDelete,
  }) : super(key: key);
  final String userName;
  final Function onDelete;
  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 5),
      child: Container(
        width: SizeConfig.screenWidth! * (0.3 + userName.length / 50),
        height: SizeConfig.screenHeight! * 0.04,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.screenHeight! * 0.02),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Background is set with the image uploaded by the user.
            userImage != null
                ? CircleAvatar(
                    radius: SizeConfig.screenHeight! * 0.0201,
                    backgroundImage: NetworkImage(userImage!),
                  )
                // If the user has not uploaded his/her image, then a circle avatar is created.
                // It has the first character of the user's name in uppercase and the default background color.
                : CircleAvatar(
                    radius: SizeConfig.screenHeight! * 0.0201,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      userName.substring(0, 1).toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
            // The name of the member in text form.
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                userName,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => onDelete(),
              icon: const Icon(
                Icons.cancel_rounded,
                color: Color(0xff524F4F),
                size: 19,
              ),
            )
          ],
        ),
      ),
    );
  }
}
