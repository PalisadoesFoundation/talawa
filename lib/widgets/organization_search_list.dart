// ignore_for_file: talawa_good_doc_comments, talawa_api_doc
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';

/// This class returns the widget that shows all the matching orgs searched in the search bar.
class OrganizationSearchList extends StatefulWidget {
  const OrganizationSearchList({required this.model, super.key});

  /// model constructor for the selectOrganisation widget.
  final SelectOrganizationViewModel model;

  @override
  _OrganizationSearchListState createState() => _OrganizationSearchListState();
}

class _OrganizationSearchListState extends State<OrganizationSearchList> {
  final ValueNotifier<int> _refetchCount = ValueNotifier<int>(0);

  // Added a stream to simulate organization data for testing.
  late StreamController<List<OrgInfo>> _orgDataController;

  @override
  void initState() {
    super.initState();
    _orgDataController = StreamController<List<OrgInfo>>();
  }

  @override
  void dispose() {
    _refetchCount.dispose();
    _orgDataController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      interactive: true,
      controller: widget.model.controller,
      child: ListView.separated(
        controller: widget.model.controller,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        // Use the length of widget.model.organizations directly.
        itemCount: widget.model.organizations.length,
        itemBuilder: (BuildContext context, int index) {
          // Render CustomListTile for each organization.
          return CustomListTile(
            index: index,
            type: TileType.org,
            orgInfo: widget.model.organizations[index],
            onTapOrgInfo: widget.model.selectOrg,
            key: Key('OrgSelItem$index'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(thickness: 0.5);
        },
      ),
    );
  }
}
