import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

/// Returns a widget for rendering Customized tiles.
/// A Tile shows the org info, user info, options that on tap user & org info.
class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required Key key,
    required this.index,
    required this.type,
    this.showIcon = false,
    this.orgInfo,
    this.onTapOrgInfo,
    this.userInfo,
    this.onTapUserInfo,
    this.onTapOption,
    this.option,
  }) : super(key: key);
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
      // checking wheather the tapped tile is of user or org.
      onTap: () => type == TileType.org
          ? onTapOrgInfo!(orgInfo!)
          : type == TileType.user
              ? onTapUserInfo!()
              // ignore: avoid_dynamic_calls
              : onTapOption!(),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 70,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Text(
                    type == TileType.org
                        ? orgInfo!.name!
                        : type == TileType.user
                            ? '${userInfo!.firstName!} ${userInfo!.lastName!}'
                            : option!.title,
                    style: type == TileType.org
                        ? Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18, color: Colors.black)
                        : type == TileType.user
                            ? Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 18, color: Colors.black)
                            : option!.trailingIconButton == null
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 18, color: Colors.black)
                                : Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: type != TileType.user
                    ? type == TileType.org
                        ? Icon(
                            orgInfo!.isPublic! ? Icons.lock_open : Icons.lock,
                            color: orgInfo!.isPublic!
                                ? const Color(0xFF34AD64)
                                : const Color(0xffFABC57),
                          )
                        : option!.trailingIconButton ?? const SizedBox()
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
