import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/loghelper.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/validator.dart';
import 'package:http/http.dart' as http;
import 'package:talawa/views/pages/login_signup/login_page.dart';
import 'package:talawa/views/pages/login_signup/register_page.dart';

class UrlPage extends StatefulWidget {
  @override
  _UrlPageState createState() => _UrlPageState();
}

bool first = true;

void changeFirst() {
  first = false;
}

class _UrlPageState extends State<UrlPage>
    with TickerProviderStateMixin<UrlPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  MediaQueryData _media;
  final _formKey = GlobalKey<FormState>();
  final urlController = TextEditingController();
  String dropdownValue = 'HTTP';
  final Preferences _pref = Preferences();
  String orgUrl, orgImgUrl;
  String saveMsg = "Set URL";
  String urlInput;
  FToast fToast;
  bool isUrlCalled = false;
  //animation Controllers
  AnimationController controller;
  AnimationController loginController;
  AnimationController helloController;
  AnimationController createController;
  // animation
  Animation<double> loginAnimation;
  Animation<double> createAnimation;
  Animation<double> animation;
  Animation<double> helloAnimation;

  listenToUrl() {
    if (saveMsg == "URL SAVED!" && urlController.text != urlInput) {
      setState(() {
        saveMsg = "Set URL";
      });
    }
    urlInput = urlController.text;
  }

  Future<void> checkAndSetUrl() async {
    setState(() {
      isUrlCalled = true;
    });

    try {
      await http.get('${dropdownValue.toLowerCase()}://${urlController.text}/');
      setApiUrl();
      _setURL();
    } catch (e) {
      LogHelper().log(LogLevel.ERROR, widget.toStringShort(), "checkAndSetUrl",
          "Incorrect Oraganization",
          exception: e as Exception);
      _exceptionToast('Incorrect Organization Entered');
      LogHelper().exportLogs();
    }

    setState(() {
      isUrlCalled = false;
    });
  }

  Future setApiUrl() async {
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

  _exceptionToast(String msg) {
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              msg,
              style: const TextStyle(fontSize: 15.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 5),
    );
  }

  void assignAnimation({@required bool firstTime}) {
    if (!firstTime) {
      animation = Tween(begin: 1.0, end: 1.0).animate(controller);

      helloAnimation = Tween(begin: 1.0, end: 1.0).animate(helloController);

      createAnimation = Tween(begin: 1.0, end: 1.0).animate(createController);

      loginAnimation = Tween(begin: 1.0, end: 1.0).animate(loginController);
    } else {
      loginAnimation = Tween(begin: 0.0, end: 1.0).animate(loginController);

      createAnimation = Tween(begin: 0.0, end: 1.0).animate(createController);

      animation = Tween(begin: 0.0, end: 1.0).animate(controller);

      helloAnimation = Tween(begin: 0.0, end: 1.0).animate(helloController);
    }
  }

  Future<void> load() async {
    await controller?.forward();
    await helloController?.forward();
    await createController?.forward();
    await loginController?.forward();
    changeFirst();
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    urlController.addListener(listenToUrl);
    // Initializing all the animationControllers
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    loginController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    helloController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    createController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    assignAnimation(firstTime: first);
    load();
    SizeConfig().init(context);
    Widget mainScreen() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FadeTransition(
            opacity: animation,
            child: Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 4,
                  bottom: SizeConfig.safeBlockVertical * 4),
              child: const Center(
                  child: Image(image: AssetImage(UIData.talawaLogo))),
            ),
          ),
          Container(
            //container with login and sign up button
            padding: EdgeInsets.fromLTRB(
                0, 0, 0, SizeConfig.safeBlockVertical * 6.25),

            child: Column(
              children: <Widget>[
                SizedBox(
                  width: _media != null
                      ? _media.size.width
                      : MediaQuery.of(context).size.shortestSide,
                  child: FadeTransition(
                    opacity: helloAnimation,
                    child: const Center(
                      child: Text(
                        "TALAWA",
                        style: TextStyle(
                          color: UIData.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: UIData.ralewayFont,
                          fontSize: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                FadeTransition(
                  opacity: createAnimation,
                  child: Container(
                    child: Container(
                      width: _media != null
                          ? _media.size.width
                          : MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 5,
                          right: SizeConfig.safeBlockHorizontal * 5,
                          top: SizeConfig.safeBlockVertical * 1.25),
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(
                                Icons.arrow_drop_down_circle_rounded,
                                color: Colors.orange),
                            iconSize: 16,
                            elevation: 16,
                            style: const TextStyle(color: UIData.primaryColor),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                saveMsg = 'Set URL';
                              });
                            },
                            underline: Container(
                              height: 1,
                              color: UIData.primaryColor,
                            ),
                            items: <String>['HTTP', 'HTTPS']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      color: UIData.primaryColor,
                                      fontFamily: UIData.ralewayFont,
                                      fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 2.5,
                          ),
                          Expanded(
                            child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.url,
                                  validator: (value) =>
                                      Validator.validateURL(urlController.text),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: UIData.primaryColor),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: UIData.primaryColor),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: UIData.primaryColor),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    labelText: "Type Org URL Here",
                                    labelStyle: const TextStyle(
                                        color: UIData.primaryColor),
                                    alignLabelWithHint: true,
                                    hintText:
                                        'talawa-graphql-api.herokuapp.com/graphql',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                  ),
                                  controller: urlController,
                                  onFieldSubmitted: (value) async {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();

                                      await checkAndSetUrl();
                                    }
                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2.5,
                ),
                FadeTransition(
                  //changed opacity animation to match login button animation
                  opacity: loginAnimation,
                  child: Container(
                    width: _media != null
                        ? _media.size.width
                        : MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 12.5,
                        right: SizeConfig.safeBlockHorizontal * 12.5,
                        top: SizeConfig.safeBlockVertical * 1.25),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: saveMsg != "URL SAVED!"
                          ? null
                          : () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              }
                            },
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 80,
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 2.5,
                          horizontal: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: UIData.primaryColor),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Text(
                          "Create an Account",
                          textAlign: TextAlign.center,
                          style: (saveMsg != "URL SAVED!")
                              ? const TextStyle(
                                  fontFamily: UIData.ralewayFont,
                                  color: UIData.primaryColor,
                                  fontSize: 18,
                                )
                              : const TextStyle(
                                  fontFamily: UIData.ralewayFont,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 0.75),
                FadeTransition(
                  opacity: loginAnimation,
                  child: Container(
                    width: _media != null
                        ? _media.size.width
                        : MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 12.5,
                        right: SizeConfig.safeBlockHorizontal * 12.5,
                        top: SizeConfig.safeBlockVertical * 1.25),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: saveMsg != "URL SAVED!"
                          ? null
                          : () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }
                            },
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 80,
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 2.5,
                          horizontal: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: (saveMsg != "URL SAVED!")
                              ? const TextStyle(
                                  fontFamily: UIData.ralewayFont,
                                  color: UIData.primaryColor,
                                  fontSize: 18,
                                )
                              : const TextStyle(
                                  fontFamily: UIData.ralewayFont,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: mainScreen(),
        ),
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    helloController.dispose();
    createController.dispose();
    loginController.dispose();
    super.dispose();
  }
}
