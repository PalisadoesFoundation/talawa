//flutter packages are imported here
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Pages are imported here
import 'package:provider/provider.dart';
import 'package:talawa/enums/org_filter.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/page_view_model/join_organization_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/pages/organization/create_organization.dart';
import 'package:talawa/views/widgets/loading.dart';
import 'package:talawa/views/widgets/shared/search_input_widget.dart';

class JoinOrganization extends StatefulWidget {
  const JoinOrganization({this.msg, this.fromProfile = false});
  final bool fromProfile;
  final String msg;
  @override
  _JoinOrganizationState createState() => _JoinOrganizationState();
}

class _JoinOrganizationState extends State<JoinOrganization> {
  TextEditingController searchController = TextEditingController();
  OrganisationFilter filter = OrganisationFilter.showAll;
  bool isFilterLoading = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<JoinOrgnizationViewModel>(
      onModelReady: (model) => model.initialise(context, filter),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Join Organization',
            style: TextStyle(color: Colors.white),
          ),
          actions: [_popUp(model)],
        ),
        body: model.organizationInfo.isEmpty
            ? Center(
                child: Loading(
                key: UniqueKey(),
              ))
            : Container(
                color: const Color(0xffF3F6FF),
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 0.75,
                  horizontal: SizeConfig.safeBlockHorizontal * 4,
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Welcome, \nJoin or Create your organization to get started",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    SearchTextInputWidget(
                      controller: searchController,
                      onChanged: model.searchOrgName,
                      hintText: "Search an organization",
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2),
                    Expanded(
                      child: Container(
                        color: const Color(0xffF3F6FF),
                        child: searchController.text.isNotEmpty
                            ? buildJoinOrgListView(model.filteredOrgInfo, model)
                            : buildJoinOrgListView(
                                model.organizationInfo,
                                model,
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
    );
  }

  ListView buildJoinOrgListView(
      List<dynamic> orgList, JoinOrgnizationViewModel model) {
    return ListView.builder(
      itemCount: orgList.length,
      itemBuilder: (context, index) {
        final organization = orgList[index];
        return Card(
          child: ListTile(
            leading: organization['image'] != null
                ? CircleAvatar(
                    radius: SizeConfig.safeBlockVertical * 3.75,
                    backgroundImage: NetworkImage(
                        Provider.of<GraphQLConfiguration>(context)
                                .displayImgRoute +
                            organization['image'].toString()))
                : CircleAvatar(
                    radius: SizeConfig.safeBlockVertical * 3.75,
                    backgroundImage: const AssetImage(
                      "assets/images/team.png",
                    ),
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
                Text(
                  organization['description'].toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
                model.setItemIndex(organization['_id'].toString());
                if (organization['isPublic'].toString() == 'false') {
                  model.setIsPublic('false');
                } else {
                  model.setIsPublic('true');
                }
                model.confirmOrgDialog(
                    organization['name'].toString(), index, context);
              },
              child: model.isLoaderActive == true && model.loadingIndex == index
                  ? SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 5,
                      height: SizeConfig.safeBlockVertical * 2.5,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 3,
                        backgroundColor: Colors.black,
                      ),
                    )
                  : const Text("JOIN"),
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }

  Widget _popUp(JoinOrgnizationViewModel model) {
    return PopupMenuButton<String>(
      color: const Color(0xffE9EDE5),
      icon: !isFilterLoading
          ? const Icon(
              Icons.filter_list,
              size: 25,
            )
          : const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      itemBuilder: (BuildContext context) {
        return ['Public Org', 'Private Org', 'Show All'].map((String choice) {
          final OrganisationFilter res = choice == "Show All"
              ? OrganisationFilter.showAll
              : choice == "Private Org"
                  ? OrganisationFilter.private
                  : OrganisationFilter.public;
          return PopupMenuItem<String>(
            value: choice,
            child: Container(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                isThreeLine: false,
                leading: Icon(
                  Icons.circle,
                  color: res == filter ? Colors.green : Colors.white,
                ),
                title: Text(
                  choice,
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                  ),
                ),
                onTap: () async {
                  setState(() {
                    filter = res;
                    isFilterLoading = true;
                  });
                  Navigator.of(context).pop();
                  await model.fetchOrg(filter);
                  setState(() {
                    isFilterLoading = false;
                  });
                },
              ),
            ),
          );
        }).toList();
      },
    );
  }
}
