import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/progress_dialog_view_model.dart';
import 'package:talawa/views/base_view.dart';

class CustomProgressDialog extends StatelessWidget {
  const CustomProgressDialog({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProgressDialogViewModel>(
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth! * 0.25,
                vertical: SizeConfig.screenHeight! * 0.35),
            decoration: BoxDecoration(
              color: Theme.of(context).textTheme.headline6!.color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: model.connectivityPresent
                ? Center(
                    child: CupertinoActivityIndicator(
                    radius: SizeConfig.screenWidth! * 0.065,
                  ))
                : Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: SizeConfig.screenWidth! * 0.4,
                        width: SizeConfig.screenWidth! * 0.4,
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/no_internet.png'),
                                fit: BoxFit.scaleDown)),
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.strictTranslate("No Internet")}!',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
          );
        });
  }
}
