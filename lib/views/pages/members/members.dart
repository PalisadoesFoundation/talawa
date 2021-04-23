//flutter imported package
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//pages are called here
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/members/member_details.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:talawa/views/widgets/loading.dart';

class Organizations extends StatefulWidget {
  const Organizations({Key key}) : super(key: key);

  @override
  _OrganizationsState createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations> {
  String currentOrgID;
  Map alphaMembersMap;
  List membersList = [];
  int isSelected = 0;
  List admins = [];
  String creatorId;
  Preferences preferences = Preferences();

  //providing initial states to the variables
  @override
  initState() {
    super.initState();
    getMembers();
  }

  Map alphaSplitList(List list) {
    final Map<String, List> alphaMap = {};

    list.forEach((element) {
      if (alphaMap[element['firstName'][0].toUpperCase()] == null) {
        alphaMap[element['firstName'][0].toString().toUpperCase()] = [];
        alphaMap[element['firstName'][0].toUpperCase()].add(element);
      } else {
        alphaMap[element['firstName'][0].toUpperCase()].add(element);
      }
    });

    return alphaMap;
  }

  //function to get the members of an organization
  // ignore: missing_return
  Future<List> getMembers() async {
    final String currentOrgID = await preferences.getCurrentOrgId();
    print(currentOrgID);
    if (currentOrgID != null) {
      final ApiFunctions apiFunctions = ApiFunctions();
      final result =
          await apiFunctions.gqlquery(Queries().fetchOrgById(currentOrgID));
      print(result);
      List membersList = result == null ? [] : result['organizations'] as List;
      if ((result['organizations'] as List).isNotEmpty) {
        admins = result['organizations'][0]['admins'] as List;
        creatorId = result['organizations'][0]['creator']['_id'].toString();
        print(admins);
      }
      if (membersList.isNotEmpty) {
        membersList = membersList[0]['members'] as List;
        membersList.sort((a, b) =>
            (a['firstName'].toString()).compareTo(b['firstName'].toString()));
        setState(() {
          alphaMembersMap = alphaSplitList(membersList);
        });
      }
    } else {
      setState(() {
        alphaMembersMap = {};
      });
    }
  }

  //returns a random color based on the user id (1 of 18)
  Color idToColor(String id) {
    final String userId = id.replaceAll(RegExp('[a-z]'), '');
    int colorInt = int.parse(userId.substring(userId.length - 10));
    colorInt = colorInt % 18;
    return Color.alphaBlend(
      Colors.black45,
      Colors.primaries[colorInt],
    );
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key: const Key('ORGANIZATION_APP_BAR'),
          title: const Text(
            'Members',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: alphaMembersMap == null
            ? const Center(
                child: Loading(),
              )
            : alphaMembersMap.isEmpty
                ? RefreshIndicator(
                    onRefresh: () async {
                      getMembers();
                    },
                    child: Center(
                        child: Column(children: <Widget>[
                      const SizedBox(
                        height: 250,
                      ),
                      const Text(
                        "No member to Show",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          getMembers();
                        },
                        child: const Text("Refresh"),
                      )
                    ])))
                : RefreshIndicator(
                    onRefresh: () async {
                      getMembers();
                    },
                    child: CustomScrollView(
                      slivers: List.generate(
                        alphaMembersMap.length,
                        (index) {
                          return alphabetDividerList(context,
                              alphaMembersMap.keys.toList()[index].toString());
                        },
                      ),
                    )));
  }

  //widget which divides the list according to letters
  Widget alphabetDividerList(BuildContext context, String alphabet) {
    return SliverStickyHeader(
      header: Container(
        color: Colors.white,
        height: 60.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: CircleAvatar(
            backgroundColor: UIData.secondaryColor,
            child: Text(
              alphabet,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return memberCard(index, alphaMembersMap[alphabet] as List);
          },
          childCount: (alphaMembersMap[alphabet] as List).length,
        ),
      ),
    );
  }

  //a custom card made for showing member details
  Widget memberCard(int index, List membersList) {
    final Color color = idToColor(membersList[index]['_id'].toString());
    return GestureDetector(
        onTap: () {
          pushNewScreen(context,
              screen: MemberDetail(
                member: membersList[index] as Map,
                color: color,
                admins: admins,
                creatorId: creatorId,
              ));
        },
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Row(
            children: [
              membersList[index]['image'] == null
                  ? defaultUserImage(membersList[index] as Map)
                  : userImage(membersList[index] as Map),
              Flexible(
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(20),
                    height: 80,
                    color: Colors.white,
                    child: Text(
                      '${membersList[index]['firstName']} ${membersList[index]['lastName']}',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    )),
              )
            ],
          ),
        ));
  }

  //widget to get the user images
  Widget userImage(Map member) {
    return Container(
      height: 80,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                  member['image'].toString()),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey.withOpacity(0.1),
            child: Image.network(
              Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                  member['image'].toString(),
            ),
          ),
        ),
      ),
    );
  }

  //widget to get the default user image
  Widget defaultUserImage(Map member) {
    return Container(
        padding: const EdgeInsets.all(0),
        width: 100,
        height: 80,
        color: idToColor(member['_id'].toString()),
        child: const Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white70,
                ))));
  }

  //the widget is user for pop up menu
  Widget popUpMenue(Map member) {
    return PopupMenuButton<int>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
            value: 1,
            child: ListTile(
              leading: Icon(Icons.playlist_add_check),
              title: Text('View Assigned Tasks'),
            )),
        const PopupMenuItem<int>(
            value: 2,
            child: ListTile(
              leading: Icon(Icons.playlist_add_check),
              title: Text('View Registered Events'),
            )),
      ],
    );
  }
}
