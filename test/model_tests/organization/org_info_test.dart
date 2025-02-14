// // ignore_for_file: talawa_api_doc
// // ignore_for_file: talawa_good_doc_comments

// import 'package:flutter_test/flutter_test.dart';
// import 'package:talawa/locator.dart';
// import 'package:talawa/models/organization/org_info.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUpAll(() {
//     setupLocator();
//     sizeConfig.test();
//   });

//   group('Test OrgInfo model', () {
//     final Map<String, dynamic> userJson = {
//       'user': {
//         'id': 'user_id',
//       },
//       'authenticationToken': ' ',
//       'refreshToken': ' ',
//     };
//     final Map<String, dynamic> json1 = {
//       '_id': '123',
//       'image': 'image_url',
//       'name': 'Name',
//       'description': 'Description',
//       'userRegistrationRequired': false,
//       'creator': userJson,
//       'members': [userJson],
//       'admins': [userJson],
//       'address': {
//         "city": "Delhi",
//         "countryCode": "IN",
//         "dependentLocality": "Some Dependent Locality",
//         "line1": "123 Random Street",
//         "line2": "Apartment 456",
//         "postalCode": "110001",
//         "sortingCode": "ABC-123",
//         "state": "Delhi",
//       },
//     };
//     final Map<String, dynamic> json2 = {
//       '_id': '321',
//       'image': 'image_url',
//       'name': 'Name',
//       'description': 'Description',
//       'userRegistrationRequired': false,
//       'creator': userJson,
//       'members': [userJson],
//       'admins': [userJson],
//       'address': {
//         "city": "Delhi",
//         "countryCode": "IN",
//         "dependentLocality": "Some Dependent Locality",
//         "line1": "123 Random Street",
//         "line2": "Apartment 456",
//         "postalCode": "110001",
//         "sortingCode": "ABC-123",
//         "state": "Delhi",
//       },
//     };

//     test('Test fromJson function with memberRequest false', () {
//       final OrgInfo result = OrgInfo.fromJson(json1, memberRequest: false);

//       expect(result.id, '123');
//       expect(result.image, 'image_url');
//       expect(result.name, 'Name');
//       expect(result.description, 'Description');
//       expect(result.userRegistrationRequired, false);
//       expect(result.creatorInfo!.authToken, ' ');
//       expect(result.creatorInfo!.refreshToken, ' ');
//       expect(result.creatorInfo!.id, 'user_id');
//       expect(result.members!.length, 1);
//       expect(result.members![0].authToken, ' ');
//       expect(result.members![0].refreshToken, ' ');
//       expect(result.members![0].id, 'user_id');
//       expect(result.admins!.length, 1);
//       expect(result.admins![0].authToken, ' ');
//       expect(result.admins![0].refreshToken, ' ');
//       expect(result.admins![0].id, 'user_id');
//       expect(result.address!.city, 'Delhi');
//       expect(result.address!.countryCode, "IN");
//       expect(result.address!.state, 'Delhi');
//     });

//     test('Test fromJson function with memberRequest true', () {
//       final Map<String, dynamic> json = {
//         'organization': json1,
//       };

//       final OrgInfo result = OrgInfo.fromJson(json, memberRequest: true);

//       expect(result.id, '123');
//       expect(result.image, 'image_url');
//       expect(result.name, 'Name');
//       expect(result.description, 'Description');
//       expect(result.userRegistrationRequired, false);
//       expect(result.creatorInfo!.authToken, ' ');
//       expect(result.creatorInfo!.refreshToken, ' ');
//       expect(result.creatorInfo!.id, 'user_id');
//       expect(result.members!.length, 1);
//       expect(result.members![0].authToken, ' ');
//       expect(result.members![0].refreshToken, ' ');
//       expect(result.members![0].id, 'user_id');
//       expect(result.admins!.length, 1);
//       expect(result.admins![0].authToken, ' ');
//       expect(result.admins![0].refreshToken, ' ');
//       expect(result.admins![0].id, 'user_id');
//       expect(result.address!.city, 'Delhi');
//       expect(result.address!.countryCode, "IN");
//       expect(result.address!.state, 'Delhi');
//     });

//     test('Test fromJsonToList', () {
//       final List<OrgInfo> res = OrgInfo().fromJsonToList([json1, json2]);

//       expect(res.length, 2);
//       for (int i = 0; i < 2; i++) {
//         final result = res[i];
//         if (i == 0) {
//           expect(result.id, '123');
//         } else {
//           expect(result.id, '321');
//         }
//         expect(result.image, 'image_url');
//         expect(result.name, 'Name');
//         expect(result.description, 'Description');
//         expect(result.userRegistrationRequired, false);
//         expect(result.creatorInfo!.authToken, ' ');
//         expect(result.creatorInfo!.refreshToken, ' ');
//         expect(result.creatorInfo!.id, 'user_id');
//         expect(result.members!.length, 1);
//         expect(result.members![0].authToken, ' ');
//         expect(result.members![0].refreshToken, ' ');
//         expect(result.members![0].id, 'user_id');
//         expect(result.admins!.length, 1);
//         expect(result.admins![0].authToken, ' ');
//         expect(result.admins![0].refreshToken, ' ');
//         expect(result.admins![0].id, 'user_id');
//         expect(result.address!.city, 'Delhi');
//         expect(result.address!.countryCode, "IN");
//         expect(result.address!.state, 'Delhi');
//       }
//     });

//     test('Test fromJsonToList with nested structures', () {
//       final List<dynamic> nestedJson = [
//         [json1, json2], // Nested list with org information
//         json1, // Single org information
//       ];

//       final List<OrgInfo> res = OrgInfo().fromJsonToList(nestedJson);

//       expect(
//         res.length,
//         3,
//       ); // There are two orgs in the nested list and one in the single org information

//       expect(res[0].id, '123');
//       expect(res[0].image, 'image_url');
//       expect(res[0].name, 'Name');
//       expect(res[0].description, 'Description');
//       expect(res[0].userRegistrationRequired, false);
//       expect(res[0].creatorInfo!.authToken, ' ');
//       expect(res[0].creatorInfo!.refreshToken, ' ');
//       expect(res[0].creatorInfo!.id, 'user_id');
//       expect(res[0].members!.length, 1);
//       expect(res[0].members![0].authToken, ' ');
//       expect(res[0].members![0].refreshToken, ' ');
//       expect(res[0].members![0].id, 'user_id');
//       expect(res[0].admins!.length, 1);
//       expect(res[0].admins![0].authToken, ' ');
//       expect(res[0].admins![0].refreshToken, ' ');
//       expect(res[0].admins![0].id, 'user_id');

//       expect(res[1].id, '321');
//       expect(res[1].image, 'image_url');
//       expect(res[1].name, 'Name');
//       expect(res[1].description, 'Description');
//       expect(res[1].userRegistrationRequired, false);
//       expect(res[1].creatorInfo!.authToken, ' ');
//       expect(res[1].creatorInfo!.refreshToken, ' ');
//       expect(res[1].creatorInfo!.id, 'user_id');
//       expect(res[1].members!.length, 1);
//       expect(res[1].members![0].authToken, ' ');
//       expect(res[1].members![0].refreshToken, ' ');
//       expect(res[1].members![0].id, 'user_id');
//       expect(res[1].admins!.length, 1);
//       expect(res[1].admins![0].authToken, ' ');
//       expect(res[1].admins![0].refreshToken, ' ');
//       expect(res[1].admins![0].id, 'user_id');

//       expect(res[2].id, '123');
//       expect(res[2].image, 'image_url');
//       expect(res[2].name, 'Name');
//       expect(res[2].description, 'Description');
//       expect(res[2].userRegistrationRequired, false);
//       expect(res[2].creatorInfo!.authToken, ' ');
//       expect(res[2].creatorInfo!.refreshToken, ' ');
//       expect(res[2].creatorInfo!.id, 'user_id');
//       expect(res[2].members!.length, 1);
//       expect(res[2].members![0].authToken, ' ');
//       expect(res[2].members![0].refreshToken, ' ');
//       expect(res[2].members![0].id, 'user_id');
//       expect(res[2].admins!.length, 1);
//       expect(res[2].admins![0].authToken, ' ');
//       expect(res[2].admins![0].refreshToken, ' ');
//       expect(res[2].admins![0].id, 'user_id');
//     });
//   });

//   group('Hive adapter test', () {
//     test('OrgInfoAdapter equality operator', () {
//       final adapter1 = OrgInfoAdapter();
//       final adapter2 = OrgInfoAdapter();

//       // Test equality
//       expect(
//         adapter1 == adapter2,
//         isTrue,
//         reason: 'Two instances of OrgInfoAdapter should be equal',
//       );
//       expect(
//         adapter1.hashCode == adapter2.hashCode,
//         isTrue,
//         reason: 'Hash codes should be equal',
//       );
//     });
//   });
// }
