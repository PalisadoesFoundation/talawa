import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:talawa/routing_constants.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/controllers/url_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/loghelper.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:talawa/views/lang_selector.dart';

import 'package:talawa/views/widgets/url_page_widgets.dart';
import '../../../locator.dart';

class UrlPage extends StatefulWidget {
  @override
  _UrlPageState createState() => _UrlPageState();
}

bool first = true;

class _UrlPageState extends State<UrlPage>
    with TickerProviderStateMixin<UrlPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final NavigationService _navigationService = locator<NavigationService>();
  final _formKey = GlobalKey<FormState>();
  final urlController = TextEditingController();
  bool isUrlCalled = false;

  final Preferences _pref = Preferences();
  String orgUrl, orgImgUrl, urlInput;
  String saveMsg = "Set URL";

  UrlPageAnimation _urlPageAnimation;

  /// Listen to the url entry by user
  void listenToUrl() {
    if (saveMsg == "URL SAVED!" && urlController.text != urlInput) {
      setState(() {
        saveMsg = "Set URL";
      });
    }
    urlInput = urlController.text;
  }

  Future setApiUrl(String dropdownValue) async {
    setState(() {
      orgUrl = "${dropdownValue.toLowerCase()}://${urlController.text}/";
      orgImgUrl =
          "${dropdownValue.toLowerCase()}://${urlController.text}/talawa/";
    });
    await _pref.saveOrgUrl(orgUrl);
    await _pref.saveOrgImgUrl(orgImgUrl);
  }

  void _setURL() {
    setState(() {
      saveMsg = "URL SAVED!";
    });
  }

  @override
  void initState() {
    super.initState();
    urlController.addListener(listenToUrl);
    _urlPageAnimation = UrlPageAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    _urlPageAnimation.startAnimation();
    SizeConfig().init(context);

    _buildTalawa() => Container(
          padding:
              EdgeInsets.fromLTRB(SizeConfig.safeBlockHorizontal * 5, 0, 0, 0),
          width: deviceWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeTransition(
                    opacity: _urlPageAnimation.helloAnimation,
                    child: Container(
                      child: const Text(
                        "TALAWA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FadeTransition(
                opacity: _urlPageAnimation.helloAnimation,
                child: Container(
                  child: const Text(
                    ".",
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

    //Builds Login Button if isLogin is true and Create Account Button if false
    Widget _buildLoginCreateAccountButton({@required bool isLogin}) {
      return LoginCreateAccountButton(
        isLogin: isLogin,
        loginAnimation: _urlPageAnimation.loginAnimation,
        onPressed: saveMsg != "URL SAVED!"
            ? null
            : () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _navigationService.navigateTo(isLogin
                      ? routes.LoginPageRoute
                      : routes.RegisterPageRoute);
                }
              },
      );
    }

    //Builds URL Setter Row
    Widget _buildUrlSetter() {
      return FadeTransition(
        opacity: _urlPageAnimation.createAnimation,
        child: Container(
          width: deviceWidth,
          margin: EdgeInsets.only(
            left: SizeConfig.safeBlockHorizontal * 5,
            right: SizeConfig.safeBlockHorizontal * 7.5,
            top: SizeConfig.safeBlockVertical * 1.25,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Consumer<UrlController>(
                    builder: (context, urlController, _) =>
                        DropdownButton<String>(
                      value: urlController.getDropDownValue,
                      icon: const Icon(Icons.arrow_downward,
                          color: Colors.orange),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: UIData.primaryColor),
                      underline:
                          Container(height: 2, color: UIData.primaryColor),
                      onChanged: (String newValue) {
                        urlController.setDropDownValue(newValue);
                        setState(() {
                          saveMsg = 'Set URL';
                        });
                      },
                      items: <String>['HTTP', 'HTTPS']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: SizeConfig.safeBlockHorizontal * 2.5),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.url,
                        validator: (value) =>
                            Validator.validateURL(urlController.text, context),
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.orange),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          prefixIcon:
                              const Icon(Icons.web, color: Colors.white),
                          labelText: AppLocalizations.of(context)
                              .translate("Type Org URL Here"),
                          labelStyle: const TextStyle(color: Colors.white),
                          alignLabelWithHint: true,
                          hintText: 'talawa-graphql-api.herokuapp.com/graphql',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        controller: urlController,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 0.75),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<UrlController>(
                    builder: (context, urlControl, _) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          setState(() {
                            isUrlCalled = true;
                          });

                          try {
                            await urlControl.checkAndSetUrl(
                                text: urlController.text);
                            setApiUrl(urlControl.getDropDownValue);
                            _setURL();
                          } catch (e) {
                            LogHelper().log(
                                LogLevel.ERROR,
                                widget.toStringShort(),
                                "checkAndSetUrl",
                                "Incorrect Oraganization",
                                exception: e as Exception);

                            CustomToast.exceptionToast(
                              msg: AppLocalizations.of(context)
                                  .translate('Incorrect Organization Entered'),
                            );
                            LogHelper().exportLogs();
                          }

                          setState(() {
                            isUrlCalled = false;
                          });
                        }
                      },
                      child: isUrlCalled
                          ? SizedBox(
                              height: SizeConfig.safeBlockVertical * 1.75,
                              width: SizeConfig.safeBlockHorizontal * 3.5,
                              child: const CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            )
                          : Text(
                              AppLocalizations.of(context).translate(saveMsg),
                            ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          LanguageSelectorPage(),
                      fullscreenDialog: true,
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final tween = Tween(
                          begin: const Offset(0.0, 1.0),
                          end: Offset.zero,
                        );

                        final curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.ease,
                        );

                        return SlideTransition(
                          position: tween.animate(curvedAnimation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const Text('Select Language'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(UIData.cloud1), fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FadeTransition(
                  opacity: _urlPageAnimation.animation,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: const Center(
                        child: Image(image: AssetImage(UIData.talawaLogo))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      0, 0, 0, SizeConfig.safeBlockVertical * 6.25),
                  child: Column(
                    children: <Widget>[
                      _buildTalawa(),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2),
                      _buildUrlSetter(),
                      SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                      _buildLoginCreateAccountButton(isLogin: false),
                      SizedBox(height: SizeConfig.safeBlockVertical * 0.75),
                      _buildLoginCreateAccountButton(isLogin: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    _urlPageAnimation.disposeAnimation();
    super.dispose();
  }
}
