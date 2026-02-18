# Plugin Map Plugin

A developer-friendly plugin that provides an overview of extension points available in the Talawa ecosystem and logs requests from different admin and user contexts.

## Overview

The Plugin Map plugin serves as a reference tool for developers building Talawa plugins. It provides:

1. **Extension Points Overview** - A comprehensive map of all available extension points in the system
2. **Request Logging** - Simple logging system to track requests from 4 different contexts
3. **Developer Tools** - Utilities to understand plugin integration points

## Features

### Extension Points Overview

The plugin provides a structured overview of extension points categorized by:

- **Admin Global**: Global admin features (dashboard, plugins, settings, users)
- **Admin Organization**: Organization-specific admin features
- **User Global**: Global user features (profile, notifications, preferences)
- **User Organization**: Organization-specific user features

Each category includes:

- **Routes**: Page/screen extension points
- **Drawers**: Navigation and sidebar extension points
- **Injectors**: Component injection points (headers, footers, widgets)

### Request Logging System

Simple logging system that tracks requests from 4 contexts:

1. `admin_global` - Requests from global admin extensions
2. `admin_org` - Requests from organization admin extensions
3. `user_global` - Requests from global user extensions
4. `user_org` - Requests from organization user extensions

Each logged request includes:

- Auto-incrementing request number ("Request 1", "Request 2", etc.)
- Request type/context
- Source extension that sent the request
- Timestamp
- Optional metadata

## Database Schema

### pluginMapRequestsTable

| Column        | Type      | Description                                             |
| ------------- | --------- | ------------------------------------------------------- |
| id            | UUID      | Primary key                                             |
| requestNumber | Integer   | Auto-incrementing request number                        |
| requestType   | Text      | Context: admin_global, admin_org, user_global, user_org |
| requestSource | Text      | Extension that sent the request                         |
| message       | Text      | Simple message like "Request 1", "Request 2"            |
| metadata      | Text      | Optional additional data                                |
| createdAt     | Timestamp | When request was logged                                 |

## GraphQL API

### Queries

#### getExtensionPointsOverview

Returns a comprehensive overview of all extension points.

```graphql
query {
  getExtensionPointsOverview {
    extensionPoints {
      admin {
        global {
          routes {
            id
            name
            path
          }
          drawers {
            id
            name
            location
          }
          injectors {
            id
            name
            location
          }
        }
        organization {
          routes {
            id
            name
            path
          }
          drawers {
            id
            name
            location
          }
          injectors {
            id
            name
            location
          }
        }
      }
      user {
        global {
          routes {
            id
            name
            path
          }
          drawers {
            id
            name
            location
          }
          injectors {
            id
            name
            location
          }
        }
        organization {
          routes {
            id
            name
            path
          }
          drawers {
            id
            name
            location
          }
          injectors {
            id
            name
            location
          }
        }
      }
    }
    summary {
      totalExtensionPoints
      adminGlobal
      adminOrganization
      userGlobal
      userOrganization
      lastUpdated
    }
  }
}
```

#### getPluginMapRequests

Retrieves logged requests with optional filtering.

```graphql
query GetRequests($requestType: String, $limit: Int, $offset: Int) {
  getPluginMapRequests(
    requestType: $requestType
    limit: $limit
    offset: $offset
  ) {
    requests {
      id
      requestNumber
      requestType
      requestSource
      message
      metadata
      createdAt
    }
    totalCount
    hasMore
  }
}
```

### Mutations

#### logPluginMapRequest

Logs a new request from any of the 4 contexts.

```graphql
mutation LogRequest(
  $requestType: String!
  $requestSource: String!
  $metadata: String
) {
  logPluginMapRequest(
    requestType: $requestType
    requestSource: $requestSource
    metadata: $metadata
  ) {
    id
    requestNumber
    requestType
    requestSource
    message
    metadata
    createdAt
  }
}
```

#### clearPluginMapRequests

Clears all logged requests.

```graphql
mutation ClearRequests {
  clearPluginMapRequests {
    success
    clearedCount
    message
  }
}
```

## Usage Examples

### Logging Requests from Extensions

From an admin global extension:

```javascript
// Log a request from admin dashboard
await logPluginMapRequest({
  requestType: "admin_global",
  requestSource: "dashboard_widget",
  metadata: "User clicked analytics button",
});
```

From a user organization extension:

```javascript
// Log a request from user org page
await logPluginMapRequest({
  requestType: "user_org",
  requestSource: "event_rsvp_widget",
  metadata: "User RSVP'd to event",
});
```

### Viewing Extension Points

```javascript
// Get all extension points overview
const overview = await getExtensionPointsOverview();
console.log(overview.extensionPoints.admin.global.routes);
```

### Monitoring Requests

```javascript
// Get recent requests
const requests = await getPluginMapRequests({ limit: 10 });
console.log(requests.requests);

// Get only admin requests
const adminRequests = await getPluginMapRequests({
  requestType: "admin_global",
  limit: 20,
});
```

## Development Workflow

1. **Explore Extension Points**: Use `getExtensionPointsOverview` to understand available integration points
2. **Build Extensions**: Create extensions that target specific extension points
3. **Log Activity**: Use `logPluginMapRequest` to track extension usage
4. **Monitor Usage**: Use `getPluginMapRequests` to see activity logs
5. **Debug Issues**: Check request logs to understand extension behavior

## Request Types

| Type           | Description                | Use Cases                                           |
| -------------- | -------------------------- | --------------------------------------------------- |
| `admin_global` | Global admin context       | Dashboard widgets, system settings, user management |
| `admin_org`    | Organization admin context | Org settings, member management, org events         |
| `user_global`  | Global user context        | User profile, notifications, preferences            |
| `user_org`     | Organization user context  | User org dashboard, events, posts                   |

## Installation

This plugin is included as a template/example. To use:

1. Install the plugin via the plugin management system
2. Activate the plugin to start logging
3. Access GraphQL endpoints to query extension points and logs
4. Use in your admin dashboard to monitor plugin activity

## Plugin Lifecycle

- **onLoad**: Verifies database table exists
- **onActivate**: Logs activation event, registers GraphQL extensions
- **onDeactivate**: Logs deactivation event
- **onUnload**: Clean shutdown
- **Event Handlers**: Logs plugin activation/deactivation events from other plugins

## Notes

- Request numbers auto-increment globally across all request types
- Logs are persistent until manually cleared
- Extension points overview is static but can be extended
- Suitable for development and monitoring environments
- Minimal overhead with simple logging mechanism
