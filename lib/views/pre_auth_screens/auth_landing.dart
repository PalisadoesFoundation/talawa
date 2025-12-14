import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/custom_painters/language_icon.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/auth_landing_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

/// This widget serves as the authentication landing page.
///
/// It provides options for users to login or signup.
/// There is also a signup option which navigates to a screen for the user
/// to select an organization.
/// At the bottom, there is also a gesture detector for changing the language.
class AuthLanding extends StatefulWidget {
  const AuthLanding({super.key});

  @override
  _AuthLandingState createState() => _AuthLandingState();
}

class _AuthLandingState extends State<AuthLanding> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthLandingViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          key: const Key('AuthLandingScreenScaffold'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                SizeConfig.screenWidth! * 0.06,
                SizeConfig.safeBlockVertical! * 4,
                SizeConfig.screenWidth! * 0.06,
                0.0,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: SizeConfig.screenHeight! * 0.08,
                        ),
                        child: CustomPaint(
                          key: const Key('LogoPainter'),
                          size: Size(
                            SizeConfig.screenWidth! * 0.6,
                            SizeConfig.screenWidth! * 0.6,
                          ),
                          painter: AppLogo(),
                        ),
                      ),
                      CustomRichText(
                        key: const Key('AuthLandingPageText'),
                        words:

                            /// greeting message.
                            [
                          {
                            'text': 'Join ',
                            'textStyle': Theme.of(
                              navigationService.navigatorKey.currentContext!,
                            ).textTheme.titleLarge!.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                          },
                          {
                            'text': 'and ',
                            'textStyle': Theme.of(
                              navigationService.navigatorKey.currentContext!,
                            ).textTheme.headlineSmall,
                          },
                          {
                            'text': 'Collaborate ',
                            'textStyle': Theme.of(
                              navigationService.navigatorKey.currentContext!,
                            ).textTheme.titleLarge!.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                          },
                          {
                            'text': 'with your ',
                            'textStyle': Theme.of(
                              navigationService.navigatorKey.currentContext!,
                            ).textTheme.headlineSmall,
                          },
                          {
                            'text': 'Organizations',
                            'textStyle': Theme.of(
                              navigationService.navigatorKey.currentContext!,
                            ).textTheme.headlineSmall!.copyWith(
                                  fontSize: 24,
                                  color: const Color(0xFF4285F4),
                                ),
                          },
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.086,
                      ),
                      //Login button.
                      RaisedRoundedButton(
                        key: const Key('LoginButton'),
                        buttonLabel: AppLocalizations.of(context)!
                            .strictTranslate('Login'),
                        onTap: () async {
                          /// Checking url. If valid, than navigating to login route
                          await model.checkURLandNavigate('/login');
                        },
                        showArrow: true,
                        textColor: Theme.of(context).primaryColor,
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.0215,
                      ),
                      //Sign up button.
                      RaisedRoundedButton(
                        key: const Key('SignUpButton'),
                        buttonLabel: AppLocalizations.of(context)!
                            .strictTranslate('Sign Up'),
                        onTap: () => model.checkURLandNavigate(
                          '/selectOrg',
                          argument: model.orgId,
                        ),
                        showArrow: true,
                        textColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.06,
                      ),
                      //Gesture Detector which navigates to a different screen for changing the language.
                      GestureDetector(
                        key: const Key('ChangeLanguage'),
                        onTap: () {
                          navigationService
                              .pushScreen(Routes.languageSelectionRoute);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: SizeConfig.safeBlockVertical! * 2,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomPaint(
                                size: Size(
                                  SizeConfig.screenWidth! * 0.125,
                                  SizeConfig.screenWidth! * 0.125 * 0.5,
                                ),
                                painter: LanguageIcon(),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate('Change language'),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface
                                          .withAlpha((0.8 * 255).toInt()),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
