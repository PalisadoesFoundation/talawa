import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/views/widgets/common_scaffold.dart';

class ContactPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  int userId;
  bool _progressBarState = false;
  bool isEmailAvailable = false;
  final User model = new User();
  BuildContext _context;
  TextEditingController emailController = new TextEditingController();

  String validateFirstName(String value) {
    if (value.length == 0 || value == null) {
      return 'Firstname field must not be empty';
    }

    return null;
  }

  String validateLastName(String value) {
    if (value.length == 0 || value == null) {
      return 'Lastname field must not be empty';
    }

    return null;
  }

  String _validateEmail(String value) {
    RegExp regExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
        multiLine: false);
    if (!regExp.hasMatch(value)) {
      return 'E-mail Address must be a valid email address.';
    }
    if (isEmailAvailable) {
      return 'E-mail Address currently in use';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    userId = ModalRoute.of(context).settings.arguments;
    return scaffold();
  }

  scaffold() => CommonScaffold(
      bodyData: bodyData(),
      action: Provider.of<AuthController>(_context).currentUser.id == userId
          ? PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Edit"),
                ),
              ],
              onSelected: (result) {
                if (result == 1) {}
                {
                  editUserForm();
                }
              },
            )
          : null);

  bodyData() {
    return Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Consumer<UserController>(builder: (context, controller, child) {
          return FutureBuilder<User>(
              future: controller.getUser(userId),
              builder: (_context, snapshot) {
                if (snapshot.hasData) {
                  User user = snapshot.data;
                  return userDetail(user);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              });
        }));
  }

  userDetail(User user) => Column(
        children: <Widget>[
          CircleAvatar(
            child: Text(
              user.firstName.substring(0, 1),
              style: TextStyle(fontSize: 25),
            ),
            radius: 30,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            user.firstName + ' ' + user.lastName,
            style: TextStyle(fontSize: 25),
          ),
          Divider(
            height: 50,
          ),
          Text(
            user.email,
            style: TextStyle(fontSize: 20),
          ),
          Divider(
            height: 50,
          ),
        ],
      );

  editUserForm() {
    showDialog(
        context: _context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SingleChildScrollView(
                  child: Consumer<AuthController>(
                    builder: (context, controller, child) {
                      emailController.text = controller.currentUser.email;
                      return Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Edit',
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                initialValue: controller.currentUser.firstName,
                                validator: (value) {
                                  return _validateEmail(value);
                                },
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "FirstName",
                                  alignLabelWithHint: true,
                                  hintText: 'Earl',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                onSaved: (value) {
                                  model.firstName = value;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                initialValue: controller.currentUser.lastName,
                                validator: (value) {
                                  return validateLastName(value);
                                },
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Last Name",
                                  alignLabelWithHint: true,
                                  hintText: 'John',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                onSaved: (value) {
                                  model.lastName = value;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  return _validateEmail(value);
                                },
                                controller: emailController,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Email",
                                  alignLabelWithHint: true,
                                  hintText: 'test@test.com',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                onSaved: (value) {
                                  model.email = value;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 30.0),
                                width: double.infinity,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(12.0),
                                  shape: StadiumBorder(),
                                  child: _progressBarState
                                      ? const CircularProgressIndicator()
                                      : Text(
                                          "Submit",
                                        ),
                                  color: Colors.white,
                                  onPressed: () async {
                                    isEmailAvailable =
                                        await Provider.of<UserController>(
                                                context,
                                                listen: false)
                                            .validateUserEmail(
                                                emailController.text);
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      await Provider.of<UserController>(context,
                                              listen: false)
                                          .updateUser(context, model);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ));
                    },
                  )));
        });
  }
}
