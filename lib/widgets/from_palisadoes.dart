// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';

/// This class generates the text "From Palisadoes" in a custom way.
class FromPalisadoes extends StatelessWidget {
  const FromPalisadoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Customizing the word "from".
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // This method is called for localized text.
              AppLocalizations.of(context)!.strictTranslate('from'),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal,
        ),
        // Customizing the word "Palisadoes".
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PALISADOES',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
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
