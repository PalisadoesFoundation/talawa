import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/services/preferences.dart';
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

class _UrlPageState extends State<UrlPage> with TickerProviderStateMixin<UrlPage> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  var _media;
  final _formKey = GlobalKey<FormState>();
  final urlController = TextEditingController();
  String dropdownValue = 'HTTP';
  Preferences _pref = Preferences();
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
  Animation loginAnimation;
  Animation createAnimation;
  Animation animation;
  Animation helloAnimation;


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
      _exceptionToast('Incorrect Organization Entered');
    }

    setState(() {
      isUrlCalled = false;
    });
  }

  Future setApiUrl() async {
    setState(() {
      orgUrl =
          "${dropdownValue.toLowerCase()}://${urlController.text}/talawa/graphql/";
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
    Widget toast = Container(
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
              style: TextStyle(fontSize: 15.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
    );
  }



    void assignAnimation(bool firstTime) {
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
      duration: Duration(milliseconds: 2000),
    );
    loginController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    helloController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    createController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }



  @override
  Widget build(BuildContext context) {
    assignAnimation(first);
    load();
    Widget mainScreen() {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FadeTransition(
            opacity: animation,
            child: Container(
              //padding: EdgeInsets.all(100.0),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(child: Image(image: AssetImage(UIData.talawaLogo))),
            ),
          ),
          new Container(
            //container with login and sign up button
            padding: EdgeInsets.fromLTRB(0, 0, 0, 50),

            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                              child: Text(
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
                        opacity: helloAnimation,
                        child: Container(
                          child: Text(
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
                ),
                SizedBox(
                  height: 15,
                ),
                FadeTransition(
                  opacity: createAnimation,
                  child: Container(
                    child: Container(
                      width: _media != null
                          ? _media.size.width
                          : MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 30.0, top: 10.0),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_downward,
                                    color: Colors.orange),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: UIData.primaryColor),
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
                                width: 10,
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
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.orange),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        prefixIcon: Icon(Icons.web,
                                            color: Colors.white),
                                        labelText: "Type Org URL Here",
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        alignLabelWithHint: true,
                                        hintText: 'calico.palisadoes.org',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                      ),
                                      controller: urlController,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
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
                                  child: isUrlCalled
                                      ? SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                              backgroundColor: Colors.white),
                                        )
                                      : Text(
                                          saveMsg,
                                        ),
                                  //color: Colors.white,
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();

                                      await checkAndSetUrl();
                                    }
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeTransition(
                  //changed opacity animation to match login button animation
                  opacity: loginAnimation,
                  child: Container(
                    //padding: EdgeInsets.all(100.0),
                    child: new Container(
                      width: _media != null
                          ? _media.size.width
                          : MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 10.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
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
                              child: new Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 20.0,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius:
                                        new BorderRadius.circular(50.0)),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: Text(
                                        "Create an Account",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
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
                SizedBox(height: 5),
                FadeTransition(
                  opacity: loginAnimation,
                  child: Container(
                    child: new Container(
                      width: _media != null
                          ? _media.size.width
                          : MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 10.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new ElevatedButton(
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
                              child: new Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 20.0,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius:
                                        new BorderRadius.circular(50.0)),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
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
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(UIData.cloud1), fit: BoxFit.cover),
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
