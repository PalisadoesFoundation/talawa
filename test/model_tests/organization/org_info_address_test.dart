// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/organization/org_info_address.dart';

void main() {
  group('Test OrgInfoAddress model', () {
    final Map<String, dynamic> addressJson = {
      "city": "Delhi",
      "countryCode": "IN",
      "dependentLocality": "Some Dependent Locality",
      "line1": "123 Random Street",
      "line2": "Apartment 456",
      "postalCode": "110001",
      "sortingCode": "ABC-123",
      "state": "Delhi",
    };
    test('Test fromJson function', () {
      final Address result = Address.fromJson(addressJson);
      expect(result.city, 'Delhi');
      expect(result.countryCode, 'IN');
      expect(result.dependentLocality, 'Some Dependent Locality');
      expect(result.line1, '123 Random Street');
      expect(result.line2, 'Apartment 456');
      expect(result.postalCode, '110001');
      expect(result.sortingCode, 'ABC-123');
      expect(result.state, 'Delhi');
    });
  });
}
