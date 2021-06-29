import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';

class FromPalisadoes extends StatelessWidget {
  const FromPalisadoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.strictTranslate('from'),
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PALISADOES',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal! * 5,
        ),
      ],
    );
  }
}
