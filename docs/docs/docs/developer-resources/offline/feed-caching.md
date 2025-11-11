---
id: feed-caching
title: Feed Caching
sidebar_position: 2
---

An abstract base class for managing a feed of type `[T]` with support for caching and online data fetching. This class is designed to provide a unified interface for handling data operations that involve both local caching and remote API interactions.

### Overview

`BaseFeedManager` provides a robust framework for managing data feeds by:

- Initializing a cache using Hive.
- Loading data from the local cache.
- Saving data to the local cache.
- Fetching new data from a remote API.
- Automatically refreshing the cache based on online connectivity.

This class is generic and can be used with any data type by specifying the type parameter `[T]`. Subclasses must implement the abstract method `fetchDataFromApi` to define how to retrieve data from an API.

### Flow-breakdown

![Basefeed manager](../../../../static/img/markdown/offline/perform_action_wrapper_flow.png)

1. **Initialize Feed**

   - The `BaseFeedManager` is initialized with the specific feed type. During initialization:
     - The associated Hive box for caching is set up.
     - Any previously cached feed data is loaded from local storage.

2. **Serve Cached Data**

   - The feed manager immediately retrieves and serves cached data from local storage to the UI.
   - This ensures that users see previously loaded content while new data is fetched in the background.

3. **Fetch Fresh Data**

   - The API Service performs a network request to fetch the latest feed data from the server.
   - This operation occurs asynchronously to avoid blocking the UI thread.

4. **Update Cache**

   - Once fresh data is successfully fetched, it is stored in the cache.
   - The existing cache is cleared and replaced with the new data to ensure that the cache remains up-to-date.

5. **UI Update**
   - The UI is updated to display the latest feed content.
   - This involves notifying relevant components to refresh and render the updated data, ensuring that users have access to the most recent information.

### Constructor

#### `BaseFeedManager(String cacheKey)`

Initializes the `BaseFeedManager` with a unique cache key for Hive.

**Parameters:**

- `cacheKey`: A unique string used to identify the cache box in Hive.

### Properties

- **`String cacheKey`**: The unique key used to access the Hive cache box.
- **`Box<T> _box`**: The Hive box that stores the cached data.

### Methods

**Method**

#### `_initialize()`

Initializes the Hive box associated with the `cacheKey`.

**Returns:**

- `Future<void>`: Completes when the initialization is finished.

**Method**

#### `Future<List<T>> loadCachedData()`

Loads the data cached in Hive.

**Returns:**

- `Future<List<T>>`: A `Future` that resolves to a list of cached data of type `[T]`.

**Method**

#### `Future<void> saveDataToCache(List<T> data)`

Saves a list of data to the cache, replacing any existing data.

**Parameters:**

- `data`: A list of data of type `[T]` to be saved in the cache.

**Returns:**

- `Future<void>`: Completes when the data has been saved to the cache.

**Method**

#### `Future<List<T>> fetchDataFromApi()`

An abstract method that must be implemented by subclasses to fetch data from an API.

**Returns:**

- `Future<List<T>>`: A `Future` that resolves to a list of data of type `[T]` fetched from the API.

**Method**

#### `Future<List<T>> getNewFeedAndRefreshCache()`

Fetches new data from the API if online, updates the cache, and returns the data. If offline, it loads and returns cached data.

**Returns:**

- `Future<List<T>>`: A `Future` that resolves to a list of the latest data of type `[T]`.

### Example Usage

To use `BaseFeedManager`, create a subclass that implements the `fetchDataFromApi` method. Here is an example of how to create a concrete implementation:

```dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'base_feed_manager.dart'; // Import your BaseFeedManager class

class MyFeedManager extends BaseFeedManager<MyDataType> {
  MyFeedManager() : super('myFeedCacheKey');

  @override
  Future<List<MyDataType>> fetchDataFromApi() async {
    // Replace with your actual API fetching logic
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => MyDataType.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Open Hive box
  await Hive.openBox<MyDataType>('myFeedCacheKey');

  final feedManager = MyFeedManager();

  // Fetch and refresh cache
  final data = await feedManager.getNewFeedAndRefreshCache();

  // Use the data
  print(data);
}
```
