import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:talawa/utils/uidata.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/controllers/org_controller.dart';

class OrganisationTile extends StatefulWidget {
  const OrganisationTile({
    Key key,
    @required this.organization,
    @required this.index,
    @required this.fromProfile,
    @required this.fToast,
    @required this.scaffoldKey,
  }) : super(key: key);

  final Map organization;
  final int index;
  final bool fromProfile;
  final FToast fToast;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _OrganisationTileState createState() => _OrganisationTileState();
}

class _OrganisationTileState extends State<OrganisationTile> {
  bool _isLoaderActive = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffE9EDE5),
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: _imageWidget(),
        title: widget.organization['isPublic'].toString() != 'false'
            ? Row(
                children: [
                  Flexible(
                    child: Text(
                      widget.organization['name'].toString(),
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
                      widget.organization['name'].toString(),
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
              widget.organization['description'].toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Created by: ${widget.organization['creator']['firstName']} ${widget.organization['creator']['lastName']}',
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
              ),
            ),
          ),
          onPressed: () {
            final String orgId = widget.organization['_id'].toString();
            if (widget.organization['isPublic'].toString() == 'false') {
              confirmOrgDialog(
                widget.organization['name'].toString(),
                widget.index,
                'false',
                orgId,
              );
            } else {
              confirmOrgDialog(
                widget.organization['name'].toString(),
                widget.index,
                'true',
                orgId,
              );
            }
          },
          child: _isLoaderActive == true
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
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
  }

  void confirmOrgDialog(
    String orgName,
    int index,
    String isPublic,
    String organizationId,
  ) {
    showDialog(
      context: widget.scaffoldKey.currentContext,
      builder: (BuildContext ctx) {
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
                  _isLoaderActive = true;
                });
                Navigator.of(ctx).pop();
                if (isPublic == 'true') {
                  await Provider.of<OrgController>(
                    context,
                    listen: false,
                  ).joinPublicOrg(
                    orgName,
                    organizationId,
                    widget.fToast,
                    context,
                    fromProfile: widget.fromProfile,
                  );

                  setState(() {
                    _isLoaderActive = false;
                  });
                } else if (isPublic == 'false') {
                  await Provider.of<OrgController>(ctx, listen: false)
                      .joinPrivateOrg(
                    context,
                    widget.fToast,
                    organizationId,
                    fromProfile: widget.fromProfile,
                  );

                  setState(() {
                    _isLoaderActive = false;
                  });
                }
              },
              child: const Text("Yes"),
            )
          ],
        );
      },
    );
  }

  Widget _imageWidget() {
    return widget.organization['image'] != null
        ? CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                  widget.organization['image'].toString(),
            ),
          )
        : const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/team.png"),
          );
  }
}
