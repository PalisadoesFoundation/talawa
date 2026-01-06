# Overview for `BaseFeedManager`

## Description

An abstract base class for managing a feed of type [T] with caching and online data fetching capabilities.

 This class provides methods for initializing a cache, loading cached data, saving data to cache,
 and fetching new data from an API. It also handles automatic cache refreshing when online.

 **params**:
 * `cacheKey`: A unique key for identifying the cache box in Hive.

 **methods**:
 * `loadCachedData`: Loads the data cached in Hive for the specified [cacheKey].
 * `saveDataToCache`: Saves a list of data to the cache, clearing any existing data in the process.
 * `fetchDataFromApi`: Abstract method to be implemented by subclasses for fetching data from an API.
 * `getNewFeedAndRefreshCache`: Fetches new data from the API if online, updates the cache, and returns the data.
   If offline, it loads and returns cached data.

## Members

- **cacheKey**: `String`
  feed cacheBox key.

- **_box**: `Box&lt;T&gt;`
  feed cache box.

## Constructors

### Unnamed Constructor


