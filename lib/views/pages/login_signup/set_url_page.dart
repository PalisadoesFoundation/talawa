import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
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
      CustomToast.exceptionToast(msg: 'Incorrect Organization Entered');
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FadeTransition(
            opacity: animation,
            child: Container(
              //padding: EdgeInsets.all(100.0),
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: const Center(
                  child:
                      const Image(image: const AssetImage(UIData.talawaLogo))),
            ),
          ),
          Container(
            //container with login and sign up button
            padding: EdgeInsets.fromLTRB(
                0, 0, 0, SizeConfig.safeBlockVertical * 6.25),

            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 5, 0, 0, 0),
                  width: _media != null
                      ? _media.size.width
                      : MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeTransition(
                            opacity: helloAnimation,
                            child: Container(
                              child: const Text(
                                "TALAWA",
                                style: const TextStyle(
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
                        opacity: helloAnimation,
                        child: Container(
                          child: const Text(
                            ".",
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          right: SizeConfig.safeBlockHorizontal * 7.5,
                          top: SizeConfig.safeBlockVertical * 1.25),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward,
                                    color: Colors.orange),
                                iconSize: 24,
                                elevation: 16,
                                style:
                                    const TextStyle(color: UIData.primaryColor),
                                underline: Container(
                                  height: 2,
                                  color: UIData.primaryColor,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                    saveMsg = 'Set URL';
                                  });
                                },
                                items: <String>[
                                  'HTTP',
                                  'HTTPS'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
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
                                          Validator.validateURL(
                                              urlController.text),
                                      textAlign: TextAlign.left,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.orange),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        prefixIcon: const Icon(Icons.web,
                                            color: Colors.white),
                                        labelText: "Type Org URL Here",
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                        alignLabelWithHint: true,
                                        hintText:
                                            'talawa-graphql-api.herokuapp.com/graphql',
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      controller: urlController,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 0.75,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();

                                      await checkAndSetUrl();
                                    }
                                  },
                                  child: isUrlCalled
                                      ? SizedBox(
                                          height: SizeConfig.safeBlockVertical *
                                              1.75,
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  3.5,
                                          child:
                                              const CircularProgressIndicator(
                                                  backgroundColor:
                                                      Colors.white),
                                        )
                                      : Text(
                                          saveMsg,
                                        )),
                            ],
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
                    //padding: EdgeInsets.all(100.0),
                    child: Container(
                      width: _media != null
                          ? _media.size.width
                          : MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 12.5,
                          right: SizeConfig.safeBlockHorizontal * 12.5,
                          top: SizeConfig.safeBlockVertical * 1.25),
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Expanded(
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
                                              builder: (context) =>
                                                  RegisterPage()),
                                        );
                                      }
                                    },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.safeBlockVertical * 2.5,
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal * 5,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: const Text(
                                        "Create an Account",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          //color: UIData.quitoThemeColor,
                                          color: Colors.white,
                                          fontSize: 18,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 0.75),
                FadeTransition(
                  opacity: loginAnimation,
                  child: Container(
                    child: Container(
                      width: _media != null
                          ? _media.size.width
                          : MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 12.5,
                          right: SizeConfig.safeBlockHorizontal * 12.5,
                          top: SizeConfig.safeBlockVertical * 1.25),
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Expanded(
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
                                                builder: (context) =>
                                                    LoginPage()));
                                      }
                                    },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.safeBlockVertical * 2.5,
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal * 5,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Expanded(
                                      child: Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          //color: UIData.quitoThemeColor,
                                          color: Colors.white,
                                          fontSize: 18,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(UIData.cloud1), fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: mainScreen(),
          ),
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
