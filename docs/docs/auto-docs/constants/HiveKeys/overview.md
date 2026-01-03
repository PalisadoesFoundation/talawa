# Overview for `HiveKeys`

## Description

A class containing static constants representing the keys used to identify Hive boxes in the application.

 These keys are used to open or access specific Hive boxes, which store various types of data such as user information,
 organization details, and cached actions.

## Members

- **userBoxKey**: `dynamic`
  The key used to identify the Hive box that stores the current user information.

- **orgBoxKey**: `dynamic`
  The key used to identify the Hive box that stores the current organization's information.

- **asymetricKeyBoxKey**: `dynamic`
  The key used to identify the Hive box that stores asymmetric keys for the user.

- **urlBoxKey**: `dynamic`
  The key used to identify the Hive box that stores URLs.

- **postFeedKey**: `dynamic`
  The key used to identify the Hive box that stores the post feed data.

- **eventFeedKey**: `dynamic`
  The key used to identify the Hive box that stores the event feed data.

- **offlineActionQueueKey**: `dynamic`
  The key used to identify the Hive box that stores the offline action queue.

- **pinnedPostKey**: `dynamic`
  The key used to identify the Hive box that stores pinned posts.

- **encryptionKey**: `dynamic`
  The key used to store/retrieve the Hive encryption key in Secure Storage.

