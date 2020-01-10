import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/vm_login.dart';
import 'package:talawa/view_models/vm_register.dart';
import 'package:talawa/views/widgets/_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailRegistrationController =
      TextEditingController();
  final TextEditingController _passwordRegistrationController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  AuthController _authController = new AuthController();

  final PageController _pageController =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  var _media;
  bool _progressBarState = false;
  @override
  void initState() {
    super.initState();
  }

  mainScreen() => Container(
        child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(90.0),
              child: Center(child: Image(image: AssetImage(UIData.talawaLogo))),
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

  loginScreenForm() => Container(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 30.0),
              scrollDirection: Axis.vertical,
              child: new Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(90.0),
                    child: Center(
                      child: Image(
                        image: AssetImage(UIData.talawaLogo),
                      ),
                    ),
                  ),
                  new Container(
                    width: _media != null
                        ? _media.size.width
                        : MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
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
                            controller: _emailController,
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
                  new Container(
                    width: _media != null
                        ? _media.size.width
                        : MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                        _authController
                            .login(
                                context,
                                new LoginViewModel(
                                    email: _emailController.text,
                                    password: _passwordController.text))
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
                            gotoSignUp();
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
        ),
      );

  registrationScreenForm() => Container(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 30.0),
              scrollDirection: Axis.vertical,
              child: new Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(90.0),
                    child: Center(
                      child: Image(
                        image: AssetImage(UIData.talawaLogo),
                        
                      ),
                    ),
                  ),
                  new Container(
                    width: _media != null
                        ? _media.size.width
                        : MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
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
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
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
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
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
                            controller: _emailRegistrationController,
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
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
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
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
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
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
                        _authController
                            .register(
                                context,
                                new RegisterViewModel(
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text))
                            .then((response) {
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
                    height: 10.0,
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
                            gotoLogin();
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
        ),
      );

  gotoLogin() {
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 600),
      curve: Curves.bounceOut,
    );
  }

  gotoSignUp() {
    _pageController.animateToPage(
      2,
      duration: Duration(milliseconds: 600),
      curve: Curves.bounceOut,
    );
  }

  @override
  build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.2, 0.7, 0.95],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.yellow[800],
              Colors.yellow[700],
              Colors.indigo[700],
              Colors.indigo[800],
            ],
          ),
        ),
        child: new PageView(
          controller: _pageController,
          physics: new BouncingScrollPhysics(),
          children: <Widget>[
            loginScreenForm(),
            mainScreen(),
            registrationScreenForm()
          ],
        ),
      ));
}
