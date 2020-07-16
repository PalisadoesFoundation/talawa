import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

class CreateOrganization extends StatelessWidget {

    final orgNameController = TextEditingController();
    final orgDescController = TextEditingController();
    final orgMemberDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  //         appBar: AppBar(
  //         backgroundColor: Color(0xffF3F6FF),
  //         elevation: 0.0,
  //         brightness: Brightness.light),
  //      body:Mutation(
  //             options: MutationOptions(
  //               documentNode: gql(),
  //                update: (Cache cache, QueryResult result) {
  //                   return cache;
  //                 },
  //                onCompleted: (dynamic resultData) {
  //                 print(resultData);
  //   },
  //             ),
              
  //             builder: (RunMutation runMutation, QueryResult result){

  //             return Column(
  //               children: <Widget>[
             
  //                 SizedBox(
  //                   height: 50,
  //                 ),
  //                 TextFormField(
  //                   textAlign: TextAlign.left,
  //                   style: TextStyle(color: Colors.black),
  //                   decoration: InputDecoration(
  //                     border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5.0)),
  //                     prefixIcon: Icon(Icons.person),
  //                     labelText: "Organization Name",
  //                     labelStyle: TextStyle(color: Colors.black),
  //                     alignLabelWithHint: true,
  //                     hintText: 'My Organization',
  //                     hintStyle: TextStyle(color: Colors.grey),
  //                   ),
  //                     controller: orgNameController,

  //                 ),
  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 TextFormField(
  //                   textAlign: TextAlign.left,
  //                   style: TextStyle(color: Colors.black),
  //                   decoration: InputDecoration(
  //                     border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5.0)),
  //                     prefixIcon: Icon(Icons.person),
  //                     labelText: "Organization Description",
  //                     labelStyle: TextStyle(color: Colors.white),
  //                     alignLabelWithHint: true,
  //                     hintText: 'My Description',
  //                     hintStyle: TextStyle(color: Colors.grey),
  //                   ),
  //                    controller: orgDescController,

  //                 ),
  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 TextFormField(
  //                   textAlign: TextAlign.left,
  //                   style: TextStyle(color: Colors.black),
  //                   decoration: InputDecoration(
  //                     border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(5.0)),
  //                     prefixIcon: Icon(Icons.email),
  //                     labelText: "Member Description",
  //                     labelStyle: TextStyle(color: Colors.black),
  //                     alignLabelWithHint: true,
  //                     hintText: 'Member Description',
  //                     hintStyle: TextStyle(color: Colors.grey),
  //                   ),
  //                    controller: orgMemberDescController,

  //                 ),
  //                 SizedBox(
  //                   height: 20,
  //                 ),
                
                 
  //                 Container(
  //                   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
  //                   width: double.infinity,
  //                   child: RaisedButton(
  //                     padding: EdgeInsets.all(12.0),
  //                     shape: StadiumBorder(),
  //                     child:Text(
  //                             "SIGN UP",
  //                           ),
  //                     color: Colors.white,
  //                     onPressed: ()  {  
  //                       runMutation({
  //                         "name": orgNameController.text,
  //                         "description": orgDescController.text,
  //                         "attendees": orgMemberDescController.text,
  //                       }
  //                     );

  //                     },
  //                   ),
  //                 ),
  //               ],
  //             );
            
  //   },
  //  )
  );
  }

  
}