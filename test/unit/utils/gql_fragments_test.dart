import 'package:flutter_test/flutter_test.dart';
import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/utils/gql_fragments.dart';

void main() {
  group('GraphQL Fragments Validity', () {
    test('UserFields fragment should be valid GraphQL', () {
      final doc = gql(userFieldsFragment);
      expect(doc, isA<DocumentNode>());
      expect(doc.definitions.first, isA<FragmentDefinitionNode>());
      expect((doc.definitions.first as FragmentDefinitionNode).name.value,
          'UserFields');
    });

    test('OrganizationFields fragment should be valid GraphQL', () {
      final doc = gql(organizationFieldsFragment);
      expect(doc, isA<DocumentNode>());
      expect(doc.definitions.first, isA<FragmentDefinitionNode>());
      expect((doc.definitions.first as FragmentDefinitionNode).name.value,
          'OrganizationFields');
    });

    test('AuthorFields fragment should be valid GraphQL', () {
      final doc = gql(authorFragment);
      expect(doc, isA<DocumentNode>());
      expect(doc.definitions.first, isA<FragmentDefinitionNode>());
      expect((doc.definitions.first as FragmentDefinitionNode).name.value,
          'AuthorFields');
    });

    test('PostFields fragment should be valid GraphQL', () {
      // PostFields depends on AuthorFields, so we might need to verify the structure differently
      // or just ensure strict parsing works.
      // Note: gql() parses the string, but doesn't validate schema references without a schema.
      // It mainly checks syntax.
      final doc = gql(postFragment);
      expect(doc, isA<DocumentNode>());
      expect(doc.definitions.first, isA<FragmentDefinitionNode>());
      expect((doc.definitions.first as FragmentDefinitionNode).name.value,
          'PostFields');
    });

    test('PluginFields fragment should be valid GraphQL', () {
      final doc = gql(pluginFieldsFragment);
      expect(doc, isA<DocumentNode>());
      expect(doc.definitions.first, isA<FragmentDefinitionNode>());
      expect((doc.definitions.first as FragmentDefinitionNode).name.value,
          'PluginFields');
    });
  });
}
