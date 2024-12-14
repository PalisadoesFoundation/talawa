import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';

/// This class is used to display email of previous user if they select remember me while loggig out.
///
/// On clicking on the email, yhe user will automatically logged in using the credential stored in local storage securely.
class DirectlyLogin extends StatelessWidget {
  const DirectlyLogin({
    super.key,
    required this.model,
  });

  /// This field consist user model for login.
  final LoginViewModel model;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Text.rich(
        TextSpan(
          text:
              '${AppLocalizations.of(context)!.translate("Login directly with")}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
              ),
          children: <InlineSpan>[
            TextSpan(
              text: model.prevUserEmail.toString(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: const Color(0xFF4285F4),
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("check");
                },
            ),
          ],
        ),
      ),
    );
  }
}
