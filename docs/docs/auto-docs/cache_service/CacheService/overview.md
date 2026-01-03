# Overview for `CacheService`

## Description

This class provides functionalities for caching GraphQL operations.

## Members

- **_timeToLive**: `Duration`
  Duration for which cached operations are considered valid.

- **offlineActionQueue**: `OfflineActionQueue`
  Queue for storing user actions to be executed offline.

- **offlineResult**: `QueryResult`
  static graphql result when device is offline.

## Constructors

### Unnamed Constructor
Initializes the cache service and the offline action queue.

