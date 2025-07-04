/// This file contains GraphQL queries related to pinned posts in an organization.
class PinnedPostQueries {
  /// Returns a GraphQL query string to fetch pinned posts by organization ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`:  A string containing the GraphQL query.
  String getPinnedPostsByOrgID() {
    return '''
      query GetPinnedPosts(
        \$orgId: String!,
        \$after: String,
        \$before: String,
        \$first: Int,
        \$last: Int
      ) {
        organization(input: { id: \$orgId }) {
        pinnedPosts(
          first: \$first,
          last: \$last,
          after: \$after,
          before: \$before
        ) {
          edges {
            node {
              id
              caption
              upVotesCount
              downVotesCount
              commentsCount
              createdAt
              creator {
                id
                name
                avatarURL
              }
              organization {
                id
              }
              attachments {
                id
                fileHash
                mimeType
                name
                objectName
              }
            }
          }
          pageInfo {
            startCursor
            endCursor
            hasNextPage
            hasPreviousPage
          }
        }
      }
    }
  ''';
  }
}
