/// Fragment for User fields.
const String userFieldsFragment = '''
fragment UserFields on User {
  id
  name
  avatarURL
  emailAddress
  description
}
''';

/// Fragment for Organization fields.
const String organizationFieldsFragment = '''
fragment OrganizationFields on Organization {
  id
  name
  addressLine1
  addressLine2
  avatarMimeType
  avatarURL
  postalCode
  countryCode
  description
  isUserRegistrationRequired
  state
}
''';

/// Fragment for Author fields.
const String authorFragment = '''
fragment AuthorFields on User {
  id
  name
  avatarURL
}
''';

/// Fragment for Post fields.
// Note: Post fields often include author
const String postFragment = '''
fragment PostFields on Post {
  id
  title
  author {
    ...AuthorFields
  }
}
''';

/// Fragment for Plugin fields.
const String pluginFieldsFragment = '''
fragment PluginFields on Plugin {
  id
  pluginId
  isActivated
  isInstalled
}
''';
