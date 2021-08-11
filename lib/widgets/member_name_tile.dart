import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

class MemberNameTile extends StatelessWidget {
  const MemberNameTile(
      {Key? key,
      required this.userName,
      this.userImage,
      required this.onDelete})
      : super(key: key);
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
            borderRadius:
                BorderRadius.circular(SizeConfig.screenHeight! * 0.02),
            color: Theme.of(context).colorScheme.secondary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            userImage != null
                ? CircleAvatar(
                    radius: SizeConfig.screenHeight! * 0.02,
                    backgroundImage: NetworkImage(userImage!),
                  )
                : CircleAvatar(
                    radius: SizeConfig.screenHeight! * 0.02,
                    backgroundColor: Theme.of(context).accentColor,
                    child: Text(
                      userName.toString().substring(0, 1).toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
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
                ))
          ],
        ),
      ),
    );
  }
}
