import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quito/controllers/auth_controller.dart';
import 'package:flutter_quito/model/user.dart';
import 'package:flutter_quito/utils/uidata.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage>
    with TickerProviderStateMixin {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameRegistrationController = TextEditingController();
  final TextEditingController _passwordRegistrationController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  AuthController _authController = new AuthController();

  final TextEditingController _idNumberController = TextEditingController();

  final PageController _pageController =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  var _media;
  bool _progressBarState = false;
  @override
  void initState() {
    super.initState();
  }

  Widget mainScreen() {
    _media = MediaQuery.of(context);
    return new Container(
      height: _media != null
          ? _media.size.height
          : MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage(UIData.splashScreen),
            fit: BoxFit.cover),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(90.0),
            child: Center(
                child: Image(
                    image: AssetImage(UIData.quitoLogo))),
          ),
          new Container(
            width: _media != null
                ? _media.size.width
                : MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 90.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.purpleAccent,
                    highlightedBorderColor: Colors.white,
                    onPressed: () => gotoSignUp(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
          new Container(
            width: _media != null
                ? _media.size.width
                : MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    onPressed: () => gotoLogin(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: UIData.quitoThemeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loginScreenForm() {
    _media = MediaQuery.of(context);
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image:
                      AssetImage(UIData.splashScreen),
                  fit: BoxFit.fill)),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30.0),
          scrollDirection: Axis.vertical,
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(90.0),
                child: Center(
                  child: Image(
                    image: AssetImage(UIData.quitoLogo),
                  ),
                ),
              ),
              new Container(
                width: _media != null
                    ? _media.size.width
                    : MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: UIData.quitoThemeColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: _userNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                          labelText: "Username",
                          alignLabelWithHint: true,
                          hintText: 'foo@bar.com',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              new Container(
                width: _media != null
                    ? _media.size.width
                    : MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: UIData.quitoThemeColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  shape: StadiumBorder(),
                  child: _progressBarState
                      ? const CircularProgressIndicator()
                      : Text(
                          "SIGN IN",
                          style: TextStyle(color: UIData.quitoThemeColor),
                        ),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _progressBarState = true;
                    });
                    _authController.login(context, new User(_userNameController.text,
                            _passwordController.text))
                        .then((result) {
                      setState(() {
                        if (_progressBarState) {
                          _progressBarState = false;
                        }
                      });
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(2,
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.decelerate);
                      },
                      child: Text(
                        "REGISTER NOW!",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget registrationScreenForm() {
    _media = MediaQuery.of(context);
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image:
                      AssetImage(UIData.splashScreen),
                  fit: BoxFit.fill)),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30.0),
          scrollDirection: Axis.vertical,
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(90.0),
                child: Center(
                  child: Image(
                    image: AssetImage(UIData.quitoLogo),
                  ),
                ),
              ),
              new Container(
                width: _media != null
                    ? _media.size.width
                    : MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: UIData.quitoThemeColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                          labelText: "First Name",
                          alignLabelWithHint: true,
                          hintText: 'John',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: _media != null
                    ? _media.size.width
                    : MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: UIData.quitoThemeColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                          labelText: "Last Name",
                          alignLabelWithHint: true,
                          hintText: 'Brown',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: _media != null
                    ? _media.size.width
                    : MediaQuery.of(context).size.width,
                margin:
                const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: UIData.quitoThemeColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        controller: _idNumberController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.perm_identity),
                          labelText: "Id Number",
                          alignLabelWithHint: true,
                          hintText: '1234567',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: _media != null
                    ? _media.size.width
                    : MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: UIData.quitoThemeColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        controller: _userNameRegistrationController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                          labelText: "Email",
                          alignLabelWithHint: true,
                          hintText: 'foo@bar.com',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: UIData.quitoThemeColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordRegistrationController,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: UIData.quitoThemeColor,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextFormField(
                        obscureText: true,
                        controller: _confirmPasswordController,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Confirm Password",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  shape: StadiumBorder(),
                  child: _progressBarState
                      ? const CircularProgressIndicator()
                      : Text(
                          "SIGN UP",
                          style: TextStyle(color: UIData.quitoThemeColor),
                        ),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _progressBarState = true;
                    });
                    // registerAsync(
                    //     context,
                    //     new RegistrationModel(
                    //       _idNumberController.text,
                    //       _firstNameController.text,
                    //       _lastNameController.text,
                    //     _userNameRegistrationController.text,
                    //       _passwordRegistrationController.text,
                    //       _confirmPasswordController.text,
                    //     )).then((result) {
                    //   setState(() {
                    //     if (_progressBarState) {
                    //       _progressBarState = false;
                    //     }
                    //   });
                    // });
                  },
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(0,
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.decelerate);
                      },
                      child: Text(
                        "SIGN IN!",
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }

  gotoLogin() {
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignUp() {
    _pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: MediaQuery.of(context).size.height,
        child: new PageView(
          controller: _pageController,
          physics: new BouncingScrollPhysics(),
          children: <Widget>[
            loginScreenForm(),
            mainScreen(),
            registrationScreenForm()
          ],
        ));
  }
}
