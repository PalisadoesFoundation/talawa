//flutter packages are imported here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Pages are imported here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/views/pages/organization/create_organization/create_organization_view.dart';
import 'package:talawa/views/pages/organization/join_organization_widgets/org_body.dart';

class JoinOrganization extends StatefulWidget {
  const JoinOrganization({this.msg, this.fromProfile = false});
  final bool fromProfile;
  final String msg;
  @override
  _JoinOrganizationState createState() => _JoinOrganizationState();
}

class _JoinOrganizationState extends State<JoinOrganization> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  FToast fToast;
  bool disposed = false;
  String searchText;
  String filter = "Show All";

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    Provider.of<OrgController>(
      context,
      listen: false,
    ).fetchOrg(disposed: disposed);
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(GraphQLConfiguration().authClient()),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            body: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: <Widget>[
                        !widget.fromProfile
                            ? const SizedBox()
                            : IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                        !widget.fromProfile
                            ? const SizedBox(width: 16)
                            : const SizedBox(width: 10),
                        Expanded(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(
                              AppLocalizations.of(context)
                                  .translate('Join Organization'),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            subtitle: Text(
                              AppLocalizations.of(context).translate(
                                  'Welcome, Join organization to get started'),
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ),
                        _popUp(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          searchText = val;
                        });
                      },
                      controller: searchController,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        fillColor: Colors.grey[100],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Color(0xffE9EDE5),
                            width: 0.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Color(0xffE9EDE5),
                            width: 0.0,
                          ),
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(Icons.search, color: Colors.black),
                        ),
                        hintText: AppLocalizations.of(context)
                            .translate("Search Organization Name"),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 16,
                      ),
                      color: Colors.white,
                      child: OrganizationBody(
                        fromProfile: widget.fromProfile,
                        fToast: fToast,
                        scaffoldKey: scaffoldKey,
                        filter: filter,
                        query: searchText,
                      ),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: UIData.secondaryColor,
              foregroundColor: Colors.white,
              elevation: 5.0,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateOrganization(
                      isFromProfile: widget.fromProfile,
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          ),
        ),
      ),
    );
  }

  Widget _popUp() {
    return PopupMenuButton<String>(
      color: const Color(0xffE9EDE5),
      icon: const Icon(
        Icons.filter_list,
        size: 25,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      itemBuilder: (BuildContext context) {
        return ['Public Org', 'Private Org', 'Show All'].map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                isThreeLine: false,
                leading: Icon(
                  Icons.circle,
                  color: choice == filter ? Colors.green : Colors.white,
                ),
                title: Text(
                  AppLocalizations.of(context).translate(choice),
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                  ),
                ),
                onTap: () {
                  if (choice == 'Show All') {
                    if (filter != 'Show All') {
                      setState(() {
                        filter = 'Show All';
                      });
                    }
                  } else {
                    setState(() {
                      filter = choice;
                    });
                  }
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        }).toList();
      },
    );
  }
}
