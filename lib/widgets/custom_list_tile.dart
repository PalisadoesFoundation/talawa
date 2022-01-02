import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/custom_avatar.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {required Key key,
      required this.index,
      required this.type,
      this.showIcon = false,
      this.orgInfo,
      this.onTapOrgInfo,
      this.userInfo,
      this.onTapUserInfo,
      this.onTapOption,
      this.option})
      : super(key: key);
  final int index;
  final TileType type;
  final OrgInfo? orgInfo;
  final User? userInfo;
  final Options? option;
  final Function? onTapOption;
  final Function()? onTapUserInfo;
  final Function(OrgInfo)? onTapOrgInfo;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => type == TileType.org
          ? onTapOrgInfo!(orgInfo!)
          : type == TileType.user
              ? onTapUserInfo!()
              : onTapOption!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: type == TileType.option
                    ? option!.icon
                    : CustomAvatar(
                        isImageNull: type == TileType.org
                            ? orgInfo!.image == null
                            : userInfo!.image == null,
                        imageUrl: type == TileType.org
                            ? orgInfo!.image
                            : userInfo!.image,
                        firstAlphabet: type == TileType.org
                            ? orgInfo!.name!.substring(0, 1)
                            : userInfo!.firstName!.substring(0, 1),
                        fontSize: 18,
                      )),
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type == TileType.org
                          ? orgInfo!.name!
                          : type == TileType.user
                              ? '${userInfo!.firstName!} ${userInfo!.lastName!}'
                              : option!.title,
                      style: type == TileType.org
                          ? Theme.of(context).textTheme.headline5
                          : type == TileType.user
                              ? Theme.of(context).textTheme.headline6
                              : option!.trailingIconButton == null
                                  ? Theme.of(context).textTheme.bodyText2
                                  : Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontSize: 18),
                    ),
                    type != TileType.user
                        ? Text(
                            type == TileType.org
                                ? '${AppLocalizations.of(context)!.strictTranslate("Creator")}: ${orgInfo!.creatorInfo!.firstName!} ${orgInfo!.creatorInfo!.lastName!}'
                                : option!.subtitle,
                            style: type == TileType.org
                                ? Theme.of(context).textTheme.headline6
                                : option!.trailingIconButton == null
                                    ? Theme.of(context).textTheme.caption
                                    : Theme.of(context).textTheme.headline6,
                          )
                        : const SizedBox(),
                  ],
                )),
            Expanded(
              flex: 2,
              child: type != TileType.user
                  ? type == TileType.org
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: SizeConfig.blockSizeHorizontal! * 15,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(orgInfo!.isPublic!
                                        ? AppLocalizations.of(context)!
                                            .strictTranslate('Public')
                                        : AppLocalizations.of(context)!
                                            .strictTranslate('Private')),
                                  ),
                                ),
                                Icon(
                                  orgInfo!.isPublic!
                                      ? Icons.lock_open
                                      : Icons.lock,
                                  color: orgInfo!.isPublic!
                                      ? const Color(0xFF34AD64)
                                      : const Color(0xffFABC57),
                                ),
                              ],
                            ),
                            showIcon
                                ? const Icon(
                                    Icons.arrow_drop_down,
                                    size: 25,
                                  )
                                : const SizedBox(),
                          ],
                        )
                      : option!.trailingIconButton ?? const SizedBox()
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
