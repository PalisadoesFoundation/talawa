//flutter imported package
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//pages are called here
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/model/orgmemeber.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:talawa/utils/ui_scaling.dart';
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
  Map<String, List<Member>> alphaMembersMap;
  List<Member> membersList = [];
  int isSelected = 0;
  List<Admin> admins = [];
  String creatorId;

  Preferences preferences = Preferences();

  //providing initial states to the variables
  @override
  initState() {
    super.initState();
    getMembers();
  }

  Map<String, List<Member>> alphaSplitList(List<Member> list) {
    final Map<String, List<Member>> alphaMap = {};

    list.forEach((element) {
      if (alphaMap[element.firstName[0].toUpperCase()] == null) {
        alphaMap[element.firstName[0].toUpperCase()] = [];
        alphaMap[element.firstName[0].toUpperCase()].add(element);
      } else {
        alphaMap[element.firstName[0].toUpperCase()].add(element);
      }
    });

    return alphaMap;
  }

  //function to get the members of an organization
  // ignore: missing_return
  Future<List> getMembers() async {
    currentOrgID = await preferences.getCurrentOrgId();
    print(currentOrgID);

    if (currentOrgID != null) {
      final ApiFunctions apiFunctions = ApiFunctions();
      final result =
          await apiFunctions.gqlquery(Queries().fetchOrgById(currentOrgID));
      print(result);
      final OrgMembers orgMembers = result == null
          ? null
          : orgMembersFromJson(
              jsonEncode((result['organizations'] as List)[0]));
      if (orgMembers != null) {
        admins = orgMembers.admins;
        creatorId = orgMembers.creator.id;
        print(admins);
      }
      if (orgMembers != null) {
        membersList = orgMembers.members;
        membersList.sort((a, b) => (a.firstName).compareTo(b.firstName));
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
          title: Text(
            AppLocalizations.of(context).translate('Members'),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: alphaMembersMap == null || alphaMembersMap.isEmpty
            ? Center(
                child: Loading(
                  key: UniqueKey(),
                  isCurrentOrgNull: currentOrgID == null,
                  emptyContentIcon: Icons.group,
                  emptyContentMsg: AppLocalizations.of(context)
                      .translate('No memberes to show, Join an organization!'),
                  refreshFunction: getMembers,
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  try {
                    await getMembers();
                  } catch (e) {
                    CustomToast.exceptionToast(msg: e.toString());
                  }
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
        height: SizeConfig.safeBlockVertical * 7.5,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 4),
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
            return memberCard(index, alphaMembersMap[alphabet]);
          },
          childCount: (alphaMembersMap[alphabet]).length,
        ),
      ),
    );
  }

  //a custom card made for showing member details
  Widget memberCard(int index, List<Member> membersList) {
    final Color color = idToColor(membersList[index].id.toString());
    return GestureDetector(
      onTap: () {
        pushNewScreen(context,
            screen: MemberDetail(
              member: membersList[index],
              color: color,
              admins: admins,
              creatorId: creatorId,
            ));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            membersList[index].image == null
                ? defaultUserImage(membersList[index])
                : userImage(membersList[index]),
            Flexible(
              child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(20),
                  height: SizeConfig.safeBlockVertical * 10,
                  color: Colors.white,
                  child: Text(
                    '${membersList[index].firstName} ${membersList[index].lastName}',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  )),
            )
          ],
        ),
      ),
    );
  }

  //widget to get the user images
  Widget userImage(Member member) {
    return Container(
      height: SizeConfig.safeBlockVertical * 10,
      width: SizeConfig.safeBlockHorizontal * 25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                  member.image.toString()),
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
                  member.image,
            ),
          ),
        ),
      ),
    );
  }

  //widget to get the default user image
  Widget defaultUserImage(Member member) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: SizeConfig.safeBlockVertical * 10,
      width: SizeConfig.safeBlockHorizontal * 25,
      color: idToColor(member.id.toString()),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2.5),
        child: CircleAvatar(
          backgroundColor: Colors.black12,
          child: Icon(
            Icons.person,
            size: SizeConfig.safeBlockHorizontal * 7.5,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  //the widget is user for pop up menu
  Widget popUpMenue(Member member) {
    return PopupMenuButton<int>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
            value: 1,
            child: ListTile(
              leading: const Icon(Icons.playlist_add_check),
              title: Text(AppLocalizations.of(context)
                  .translate('View Assigned Tasks')),
            )),
        PopupMenuItem<int>(
          value: 2,
          child: ListTile(
            leading: const Icon(Icons.playlist_add_check),
            title: Text(AppLocalizations.of(context)
                .translate('View Registered Events')),
          ),
        ),
      ],
    );
  }
}
