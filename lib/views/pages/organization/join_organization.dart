import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/view_models/organization/join_organization_model.dart';
import 'package:talawa/views/base_view.dart';

import 'create_organization.dart';

class JoinOrganizationView extends StatefulWidget {
  JoinOrganizationView({Key key, this.fromProfile = false});
  final bool fromProfile;
  @override
  _JoinOrganizationViewState createState() => _JoinOrganizationViewState();
}

class _JoinOrganizationViewState extends State<JoinOrganizationView> {
  FToast fToast;
  String isPublic;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<bool> _showMyDialog() async {
      return showDialog<bool>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  print("cancel");

                  return true;
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  return true;
                },
              ),
            ],
          );
        },
      );
    }

    return BaseView<JoinOrgnizationViewModel>(
      onModelReady: (model) {
        model.initialise(context);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Join Organization',
              style: TextStyle(color: Colors.white)),
        ),
        body: model.organizationInfo.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Container(
                color: Color(0xffF3F6FF),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Welcome, \nJoin or Create your organization to get started",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.normal),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        model.searchOrgName(value);
                      },
                      controller: searchController,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(Icons.search, color: Colors.black),
                          ),
                          hintText: "Search Organization Name"),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                        child: Container(
                            color: Color(0xffF3F6FF),
                            child: searchController.text.isNotEmpty
                                ? ListView.builder(
                                    itemCount: model.filteredOrgInfo.length,
                                    itemBuilder: (context, index) {
                                      final organization =
                                          model.filteredOrgInfo[index];
                                      return Card(
                                        child: ListTile(
                                          leading: organization['image'] != null
                                              ? CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                      Provider.of<GraphQLConfiguration>(
                                                                  context)
                                                              .displayImgRoute +
                                                          organization[
                                                              'image']))
                                              : CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage(
                                                      "assets/images/team.png")),
                                          title: organization['isPublic']
                                                      .toString() !=
                                                  'false'
                                              ? Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        organization['name']
                                                            .toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Icon(Icons.lock_open,
                                                        color: Colors.green,
                                                        size: 16)
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        organization['name']
                                                            .toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Icon(Icons.lock,
                                                        color: Colors.red,
                                                        size: 16)
                                                  ],
                                                ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  organization['description']
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              Text(
                                                  'Created by: ' +
                                                      organization['creator']
                                                              ['firstName']
                                                          .toString() +
                                                      ' ' +
                                                      organization['creator']
                                                              ['lastName']
                                                          .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                          trailing: new RaisedButton(
                                              onPressed: () async {
                                                model.setItemIndex(
                                                    organization['_id']
                                                        .toString());
                                                if (organization['isPublic']
                                                        .toString() ==
                                                    'false') {
                                                  model.setIsPublic("false");
                                                } else {
                                                  model.setIsPublic("true");
                                                }
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible:
                                                      false, // user must tap button!
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Confirmation'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Text(
                                                                'This is a demo alert dialog.'),
                                                            Text(
                                                                'Would you like to approve of this message?'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('Cancel'),
                                                          onPressed: () {
                                                            print("cancel");
                                                            Navigator.pop(
                                                                context, false);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text('Yes'),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context, true);
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ).then((value) {
                                                  if (value) {
                                                    if (model.isPublic ==
                                                        "true") {
                                                      model.joinPublicOrg(
                                                          context);
                                                    } else if (model.isPublic ==
                                                        "false") {
                                                      model.joinPrivateOrg(
                                                          context);
                                                    }
                                                  }
                                                });
                                              },
                                              color: UIData.primaryColor,
                                              child: new Text("JOIN"),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        12.0),
                                              )),
                                          isThreeLine: true,
                                        ),
                                      );
                                    })
                                : ListView.builder(
                                    itemCount: model.organizationInfo.length,
                                    itemBuilder: (context, index) {
                                      final organization =
                                          model.organizationInfo[index];
                                      return Card(
                                        child: ListTile(
                                          leading: organization['image'] != null
                                              ? CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                      Provider.of<GraphQLConfiguration>(
                                                                  context)
                                                              .displayImgRoute +
                                                          organization[
                                                              'image']))
                                              : CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage(
                                                      "assets/images/team.png")),
                                          title: organization['isPublic']
                                                      .toString() !=
                                                  'false'
                                              ? Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        organization['name']
                                                            .toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Icon(Icons.lock_open,
                                                        color: Colors.green,
                                                        size: 16)
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        organization['name']
                                                            .toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Icon(Icons.lock,
                                                        color: Colors.red,
                                                        size: 16)
                                                  ],
                                                ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  organization['description']
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              Text(
                                                  'Created by: ' +
                                                      organization['creator']
                                                              ['firstName']
                                                          .toString() +
                                                      ' ' +
                                                      organization['creator']
                                                              ['lastName']
                                                          .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ],
                                          ),
                                          trailing: new RaisedButton(
                                              onPressed: () async {
                                                model.setItemIndex(
                                                    organization['_id']
                                                        .toString());
                                                if (organization['isPublic']
                                                        .toString() ==
                                                    'false') {
                                                  model.setIsPublic("false");
                                                } else {
                                                  model.setIsPublic("true");
                                                }
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible:
                                                      false, // user must tap button!
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Confirmation'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Text(
                                                                'This is a demo alert dialog.'),
                                                            Text(
                                                                'Would you like to approve of this message?'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('Cancel'),
                                                          onPressed: () {
                                                            print("cancel");
                                                            Navigator.pop(
                                                                context, false);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text('Yes'),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context, true);
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ).then((value) {
                                                  if (value) {
                                                    if (model.isPublic ==
                                                        "true") {
                                                      model.joinPublicOrg(
                                                          context);
                                                    } else if (model.isPublic ==
                                                        "false") {
                                                      model.joinPrivateOrg(
                                                          context);
                                                    }
                                                  }
                                                });
                                              },
                                              color: UIData.primaryColor,
                                              child: new Text("JOIN"),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        12.0),
                                              )),
                                          isThreeLine: true,
                                        ),
                                      );
                                    })))
                  ],
                )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: UIData.secondaryColor,
          foregroundColor: Colors.white,
          elevation: 5.0,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => new CreateOrganization(
                      isFromProfile: widget.fromProfile,
                    )));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void confirmOrgDialog(BuildContext context) {
    //this is the pop up shown when the confirmation is required
  }
}
