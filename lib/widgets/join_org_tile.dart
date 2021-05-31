import 'package:flutter/material.dart';
import 'package:talawa/models/org_info.dart';

class JoinOrgTile extends StatelessWidget {
  const JoinOrgTile(
      {required Key key,
      required this.index,
      required this.item,
      required this.onTap,
      this.showIcon = false})
      : super(key: key);
  final int index;
  final OrgInfo item;
  final Function(OrgInfo) onTap;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(item),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 25,
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name!,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      'Creator: ${item.creatorInfo!.firstName!} ${item.creatorInfo!.lastName!}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        item.isPublic! ? Icons.lock_open : Icons.lock,
                        color: item.isPublic!
                            ? const Color(0xFF34AD64)
                            : const Color(0xffFABC57),
                      ),
                      Text(item.isPublic! ? 'Public' : 'Private'),
                    ],
                  ),
                  showIcon
                      ? const Icon(
                          Icons.arrow_drop_down,
                          size: 25,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
