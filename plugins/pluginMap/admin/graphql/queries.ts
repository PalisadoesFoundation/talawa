import { gql } from '@apollo/client';

export const GET_PLUGIN_MAP_REQUESTS = gql`
  query GetPluginMapRequests($input: GetPluginMapRequestsInput) {
    plugin_map_getPluginMapRequests(input: $input) {
      requests {
        id
        pollNumber
        userId
        userRole
        organizationId
        extensionPoint
        createdAt
      }
      totalCount
      hasMore
    }
  }
`;

export const LOG_PLUGIN_MAP_REQUEST = gql`
  mutation LogPluginMapRequest($input: PluginMapRequestInput!) {
    plugin_map_logPluginMapRequest(input: $input) {
      id
      pollNumber
      userId
      userRole
      organizationId
      extensionPoint
      createdAt
    }
  }
`;
