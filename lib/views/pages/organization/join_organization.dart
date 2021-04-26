//flutter packages are imported here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Pages are imported here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/views/pages/home_page.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'package:talawa/views/widgets/loading.dart';

import 'create_organization.dart';

class JoinOrganization extends StatefulWidget {
  const JoinOrganization({this.msg, this.fromProfile = false});
  final bool fromProfile;
  final String msg;
  @override
  _JoinOrganizationState createState() => _JoinOrganizationState();
}

class _JoinOrganizationState extends State<JoinOrganization> {
  final Queries _query = Queries();
  final Preferences _pref = Preferences();
  String token;
  static String itemIndex;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  List organizationInfo;
  List filteredOrgInfo = [];
  List joinedOrg = [];
  final AuthController _authController = AuthController();
  String isPublic;
  TextEditingController searchController = TextEditingController();
  bool _isLoaderActive = false;
  bool disposed = false;
  int loadingIndex = -1;
  FetchMore fetchMore;

  // Variables for filtering out alread joined
  // and created organizations.
  String currentUserId;
  List joinedOrganizations = [];
  List joinedOrganizationsIds = [];

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    fetchOrg();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  /// FUNCTION FOR GETTING CURRENT USER ID
  Future<void> getCurrentUserId() async {
    currentUserId = await _pref.getUserId();
  }

  /// SEARCH BAR TO SEARCH THE ORGANIZATION
  void searchOrgName(String orgName) {
    filteredOrgInfo.clear();
    if (orgName.isNotEmpty) {
      for (int i = 0; i < organizationInfo.length; i++) {
        final String name = organizationInfo[i]['name'].toString();
        if (name.toLowerCase().contains(orgName.toLowerCase())) {
          setState(() {
            filteredOrgInfo.add(organizationInfo[i]);
          });
        }
      }
    } else {
      setState(() {
        filteredOrgInfo.add(organizationInfo);
      });
    }
  }

  /// FETCH THE LIST OF ALL THE ORGANIZATIONS
  Future fetchOrg() async {
    getCurrentUserId();

    final GraphQLClient _client = graphQLConfiguration.authClient();
    final QueryResult result = await _client.query(
      QueryOptions(documentNode: gql(_query.getOrganizationsConnection)),
    );

    /// GET THE DETAILS OF THE CURRENT USER
    final QueryResult userDetailsResult = await _client.query(
      QueryOptions(
        documentNode: gql(_query.fetchUserInfo),
        variables: {'id': currentUserId},
      ),
    );

    if (result.hasException || userDetailsResult.hasException) {
      print(result.exception);
      showError(result.exception.toString());
    } else if (!result.hasException &&
        !disposed &&
        !userDetailsResult.hasException) {
      setState(() {
        organizationInfo = result.data['organizationsConnection'] as List;

        // Get the details of joined organizations.
        joinedOrganizations =
            userDetailsResult.data['users'][0]['joinedOrganizations'] as List;

        // Get the id's of joined organizations.
        joinedOrganizations.forEach((element) {
          joinedOrganizationsIds.add(element['_id']);
        });

        // Filtering out organizations that are created by current user.
        organizationInfo = organizationInfo
            .where((element) => element['admins'][0]['_id'] != currentUserId)
            .toList();

        // Filtering out organizations that are already joined by user.
        joinedOrganizationsIds.forEach((e) {
          print(e);
          organizationInfo =
              organizationInfo.where((element) => element['_id'] != e).toList();
        });
      });
    }
  }

  /// FUNCTION CALLED TP JOIN THE PRIVATE ORGANIZATION
  Future joinPrivateOrg() async {
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_query.sendMembershipRequest(itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return joinPrivateOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      print(result.data);
      _successToast("Request Sent to Organization Admin");

      if (widget.fromProfile) {
        Navigator.pop(context);
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePage(
            openPageIndex: 4,
          ),
        ));
      }
    }
  }

  /// Function which will be called if the person wants to join the public organization
  Future joinPublicOrg(String orgName) async {
    final GraphQLClient _client = graphQLConfiguration.authClient();

    print(orgName);

    final QueryResult result = await _client
        .mutate(MutationOptions(documentNode: gql(_query.getOrgId(itemIndex))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      _exceptionToast(result.exception.toString().substring(16));
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      setState(() {
        joinedOrg = result.data['joinPublicOrganization']['joinedOrganizations']
            as List;
      });

      //set the default organization to the first one in the list

      if (joinedOrg.length == 1) {
        final String currentOrgId = result.data['joinPublicOrganization']
                ['joinedOrganizations'][0]['_id']
            .toString();
        await _pref.saveCurrentOrgId(currentOrgId);
        final String currentOrgImgSrc = result.data['joinPublicOrganization']
                ['joinedOrganizations'][0]['image']
            .toString();
        await _pref.saveCurrentOrgImgSrc(currentOrgImgSrc);
        final String currentOrgName = result.data['joinPublicOrganization']
                ['joinedOrganizations'][0]['name']
            .toString();
        await _pref.saveCurrentOrgName(currentOrgName);
      } else {
        // If there are multiple number of organizations.
        for (int i = 0; i < joinedOrg.length; i++) {
          if (joinedOrg[i]['name'] == orgName) {
            final String currentOrgId = result.data['joinPublicOrganization']
                    ['joinedOrganizations'][i]['_id']
                .toString();
            await _pref.saveCurrentOrgId(currentOrgId);
            final String currentOrgImgSrc = result
                .data['joinPublicOrganization']['joinedOrganizations'][i]
                    ['image']
                .toString();
            await _pref.saveCurrentOrgImgSrc(currentOrgImgSrc);
            final String currentOrgName = result.data['joinPublicOrganization']
                    ['joinedOrganizations'][i]['name']
                .toString();
            await _pref.saveCurrentOrgName(currentOrgName);
          }
        }
      }
      _successToast("Success!");

      //Navigate user to newsfeed
      if (widget.fromProfile) {
        pushNewScreen(
          context,
          screen: const ProfilePage(),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(
              openPageIndex: 4,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(GraphQLConfiguration().authClient()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Join Organization',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Query(
          options: QueryOptions(
            documentNode: gql(_query.getOrganizationsConnection),
            variables: {
              'first': 15,
              'skip': 0,
            },
          ),
          builder: (
            QueryResult result, {
            Future<QueryResult> Function() refetch,
            FetchMore fetchMore,
          }) {
            if (result.hasException) {
              print(result.exception);
              return const Loading(isShowingError: true);
            }

            ///WIDGET TO screenBody WHEN LOADING DATA
            if (result.loading && result.data == null) {
              return Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ],
                ),
              );
            }

            final List organizations =
                result.data['organizationsConnection'] as List;

            if (organizations.isEmpty) {
              return Center(
                  child: Loading(
                key: UniqueKey(),
              ));
            }

            return screenBody(
              fetchMore: fetchMore,
              result: result,
              organizations: organizations,
            );
          },
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
    );
  }

  Widget screenBody({
    @required List organizations,
    @required QueryResult result,
    @required FetchMore fetchMore,
  }) {
    return Container(
      color: const Color(0xffF3F6FF),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Column(
        children: <Widget>[
          const Text(
            "Welcome, \nJoin or Create your organization to get started",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontStyle: FontStyle.normal),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            onChanged: (value) {
              searchOrgName(value);
            },
            controller: searchController,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.0,
                ),
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(Icons.search, color: Colors.black),
              ),
              hintText: "Search Organization Name",
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              color: const Color(0xffF3F6FF),
              child: searchController.text.isNotEmpty
                  ? _searchWidget()
                  : _organizationList(
                      fetchMore: fetchMore,
                      orgaizations: organizations,
                      result: result,
                    ),
            ),
          )
        ],
      ),
    );
  }

  void confirmOrgDialog(String orgName, int index) {
    //this is the pop up shown when the confirmation is required
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirmation"),
            content:
                const Text("Are you sure you want to join this organization?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
              TextButton(
                onPressed: () async {
                  setState(() {
                    loadingIndex = index;
                    _isLoaderActive = true;
                  });
                  Navigator.of(context).pop();
                  if (isPublic == 'true') {
                    await joinPublicOrg(orgName)
                        .whenComplete(() => setState(() {
                              loadingIndex = -1;
                              _isLoaderActive = false;
                            }));
                  } else if (isPublic == 'false') {
                    await joinPrivateOrg().whenComplete(() => setState(() {
                          loadingIndex = -1;
                          _isLoaderActive = false;
                        }));
                  }
                },
                child: const Text("Yes"),
              )
            ],
          );
        });
  }

  Widget showError(String msg) {
    return Center(
      child: Text(
        msg,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  _successToast(String msg) {
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  _exceptionToast(String msg) {
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Text(msg),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  Widget _searchWidget() {
    return ListView.builder(
        itemCount: filteredOrgInfo.length,
        itemBuilder: (context, index) {
          final organization = filteredOrgInfo[index];
          return Card(
            child: ListTile(
              leading: organization['image'] != null
                  ? CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          Provider.of<GraphQLConfiguration>(context)
                                  .displayImgRoute +
                              organization['image'].toString()),
                    )
                  : const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/team.png")),
              title: organization['isPublic'].toString() != 'false'
                  ? Row(
                      children: [
                        Flexible(
                          child: Text(
                            organization['name'].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.lock_open,
                            color: Colors.green, size: 16)
                      ],
                    )
                  : Row(
                      children: [
                        Flexible(
                          child: Text(
                            organization['name'].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.lock, color: Colors.red, size: 16)
                      ],
                    ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(organization['description'].toString(),
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  Text(
                      'Created by: ${organization['creator']['firstName']} ${organization['creator']['lastName']}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              trailing: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(UIData.primaryColor),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  )),
                ),
                onPressed: () {
                  itemIndex = organization['_id'].toString();
                  if (organization['isPublic'].toString() == 'false') {
                    setState(() {
                      isPublic = 'false';
                    });
                  } else {
                    setState(() {
                      isPublic = 'true';
                    });
                  }
                  confirmOrgDialog(organization['name'].toString(), index);
                },
                child: _isLoaderActive == true && loadingIndex == index
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 3,
                          backgroundColor: Colors.black,
                        ))
                    : const Text("JOIN"),
              ),
              isThreeLine: true,
            ),
          );
        });
  }

  Widget _organizationList({
    @required List orgaizations,
    @required QueryResult result,
    @required FetchMore fetchMore,
  }) {
    return ListView.builder(
      itemCount: orgaizations.length + 1,
      itemBuilder: (context, index) {
        // Pagination Widget
        if (index == orgaizations.length) {
          return _paginationWidget(
            fetchMore: fetchMore,
            organizations: orgaizations,
            result: result,
          );
        }

        final organization = orgaizations[index];

        return Card(
          child: ListTile(
            leading: organization['image'] != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        Provider.of<GraphQLConfiguration>(context)
                                .displayImgRoute +
                            organization['image'].toString()),
                  )
                : const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/team.png"),
                  ),
            title: organization['isPublic'].toString() != 'false'
                ? Row(
                    children: [
                      Flexible(
                        child: Text(
                          organization['name'].toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.lock_open, color: Colors.green, size: 16)
                    ],
                  )
                : Row(
                    children: [
                      Flexible(
                        child: Text(
                          organization['name'].toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.lock, color: Colors.red, size: 16)
                    ],
                  ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(organization['description'].toString(),
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                Text(
                  'Created by: ${organization['creator']['firstName']} ${organization['creator']['lastName']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(UIData.primaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )),
              ),
              onPressed: () {
                itemIndex = organization['_id'].toString();
                if (organization['isPublic'].toString() == 'false') {
                  setState(() {
                    isPublic = 'false';
                  });
                } else {
                  setState(() {
                    isPublic = 'true';
                  });
                }
                confirmOrgDialog(organization['name'].toString(), index);
              },
              child: _isLoaderActive == true && loadingIndex == index
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: Colors.black,
                      ))
                  : const Text("JOIN"),
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }

  ///Pagination will be based on the end cursor
  void fetchMoreHelper(FetchMore fetchMore, List organizations) {
    fetchMore(
      FetchMoreOptions(
        variables: {
          "first": 15,
          "skip": organizations.length,
        },
        updateQuery: (existingOrganizations, newOrganizations) => {
          'organizationsConnection': [
            ...existingOrganizations["organizationsConnection"],
            ...newOrganizations['organizationsConnection'],
          ],
        },
      ),
    );
  }

  ///Widget to ask user if they want to paginate
  Widget _paginationWidget({
    @required QueryResult result,
    @required FetchMore fetchMore,
    @required List organizations,
  }) {
    final bool isNextPageExist =
        organizations.length != organizationInfo.length;

    if (isNextPageExist) {
      if (result.loading) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: GestureDetector(
              onTap: () => fetchMoreHelper(fetchMore, organizations),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 26,
                      color: Colors.indigo[800],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Load More',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 64),
                ],
              ),
            ),
          ),
        );
      }
    } else {
      return const SizedBox(height: 64);
    }
  }
}
