




build method - CustomListTile class - custom\_list\_tile library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_list\_tile.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_list_tile/)
3. [CustomListTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_list_tile/CustomListTile-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  Function()? onTap;

  switch (type) {
    case TileType.org:
      onTap = () => onTapOrgInfo!(orgInfo!);
      break;
    case TileType.user:
      onTap = onTapUserInfo;
      break;
    case TileType.attendee:
      onTap = onTapAttendeeInfo;
      break;
    default:
      onTap = onTapOption;
      break;
  }

  return InkWell(
    // checking whether the tapped tile is of user or org.
    onTap: onTap,
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
                          text: orgInfo!.name,
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
                            : type == TileType.attendee
                                ? '${attendeeInfo!.firstName!} ${attendeeInfo!.lastName!}'
                                : option!.title,
                        style:
                            type == TileType.user || type == TileType.attendee
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
              child: type != TileType.user && type != TileType.attendee
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
```

 


1. [talawa](../../index.html)
2. [custom\_list\_tile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_list_tile/)
3. [CustomListTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_list_tile/CustomListTile-class.html)
4. build method

##### CustomListTile class





talawa
1.0.0+1






