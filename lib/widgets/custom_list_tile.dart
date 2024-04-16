import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

/// Returns a widget for rendering Customized tiles.
///
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

  /// Index int of tiles.
  final int index;

  /// Tiletype object to specify tle type.
  final TileType type;

  /// Object containing all the necessary info regarding the org.
  final OrgInfo? orgInfo;

  /// Object containing all the necessary info regarding the user.
  final User? userInfo;

  /// Object containing all the necessary info regarding the options.
  final Options? option;

  /// Object containing all the necessary info regarding the onTapOption.
  final Function()? onTapOption;

  /// Function to handle the tap on user info.
  final Function()? onTapUserInfo;

  /// Function to handle the tap on org info.
  final Function(OrgInfo)? onTapOrgInfo;

  /// Flag to determine whether thge Icons should be shown.
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // checking whether the tapped tile is of user or org.
      onTap: () => type == TileType.org
          ? onTapOrgInfo!(orgInfo!)
          : type == TileType.user
              ? onTapUserInfo!()
              : onTapOption!(),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          height: 70,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: type == TileType.org
                      ? RichText(
                          key: const Key('OrgNamewithOrgAddress'),
                          text: TextSpan(
                            text: orgInfo!.name!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 19,
                                  color: Colors.black,
                                ),
                            children: <TextSpan>[
                              if (orgInfo!.address != null) ...[
                                const TextSpan(text: ' '),
                                TextSpan(
                                  text:
                                      '(${orgInfo!.address!.city}, ${orgInfo!.address!.countryCode})',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                          255,
                                          112,
                                          112,
                                          112,
                                        ),
                                      ),
                                ),
                              ],
                            ],
                          ),
                        )
                      : Text(
                          type == TileType.user
                              ? '${userInfo!.firstName!} ${userInfo!.lastName!}'
                              : option!.title,
                          style: type == TileType.user
                              ? Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 18,
                                    color: Colors.black,
                                  )
                              : option!.trailingIconButton == null
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        color: Colors.black,
                                      )
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
                            !orgInfo!.userRegistrationRequired!
                                ? Icons.lock_open
                                : Icons.lock,
                            color: !orgInfo!.userRegistrationRequired!
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
