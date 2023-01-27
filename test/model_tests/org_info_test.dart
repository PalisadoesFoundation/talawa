import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';

void main() {
  group('Org Info Testing', () {
    test('Test org_info model', () {
      final Org_Info = OrgInfo(
          id: '123',
          image: 'image.jpg',
          name: 'Organization',
          description: 'This is an organization',
          isPublic: true,
          creatorInfo: User(id: '456'),
          members: [User(id: '789')],
          admins: [User(id: '1213')]);
      final Map<String, dynamic> orgInfioJson = {
        '_id': '123',
        'image': 'image.jpg',
        'name': 'Organization',
        'description': 'This is an organization',
        'isPublic': true,
        'creatorInfo': {
          '_id': '456',
          'username': 'creator',
        },
        'members': [
          {
            '_id': '789',
            'username': 'member1',
          },
        ],
        'admins': [
          {
            '_id': '1213',
            'username': 'admin1',
          },
        ],
      };
      final orgInfofromJson = OrgInfo.fromJson(orgInfioJson);
      expect(Org_Info.id, orgInfofromJson.id);
      expect(Org_Info.image, orgInfofromJson.image);
      expect(Org_Info.isPublic, orgInfofromJson.isPublic);
      expect(Org_Info.name, orgInfofromJson.name);
      expect(Org_Info.description, orgInfofromJson.description);
      expect(Org_Info.admins?[0].id, orgInfofromJson.admins?[0].id);
      expect(Org_Info.members?[0].id, orgInfofromJson.members?[0].id);
      expect(Org_Info.creatorInfo?.id, orgInfofromJson.creatorInfo?.id);
    });
  });
}
