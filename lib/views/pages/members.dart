import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/controllers/organisation_controller.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/apiFuctions.dart';
import 'package:talawa/utils/uidata.dart';



class Organizations extends StatefulWidget {
  Organizations({Key key}) : super(key: key);

  @override
  _OrganizationsState createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations> {
  List organizationsList = [];
  int isSelected = 0;
  


  initState() {
    super.initState();
    getEvents();
  }


  Future<List> getEvents() async {
    ApiFunctions apiFunctions = ApiFunctions();
    Map result = await apiFunctions.gqlquery(Queries().fetchOrganizations);
    setState(() {
      organizationsList = result == null ? []:result['organizations'];
    });
  }


  Widget build(BuildContext context) {
  final OrgController org = Provider.of<OrgController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Members',
        style: TextStyle(color: Colors.white),),
      ),
      body: organizationsList.isEmpty ? Center(child: CircularProgressIndicator()) : 
      ListView.builder(
        itemCount: organizationsList.length,
        itemBuilder: (context, index) {
          return 
          Card(child: ListTile(
            // activeColor: UIData.secondaryColor,
            // controlAffinity: ListTileControlAffinity.trailing,
            title: Text(organizationsList[index]['members'][0]['firstName'].toString() + ' ' + organizationsList[index]['members'][0]['lastName'].toString()),
            subtitle: Text(organizationsList[index]['members'][0]['email'].toString()),
            leading: CircleAvatar(
                  child: Icon(Icons.person,
                  size: 40,
                  color: Colors.white54,
                  ),
                  backgroundColor: UIData.secondaryColor,
                ),
            // groupValue: isSelected,
            // value: index,
            //  onChanged: (val){
            //    org.currentOrganisation(organizationsList[val]['_id']);
            //    setState(() {
            //      isSelected = val;
                 
            //    });
                
            //  }
            trailing: Icon(Icons.menu),
             ))
          ;
        },
      ),
    );
  }
}