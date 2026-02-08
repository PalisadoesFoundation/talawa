import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/caching/cached_user_action.dart';

/// OfflineActionQueue class manages a queue for offline actions.
///
/// This class provides the following functionalities:
/// * `initialize` : initializes the queue by registering adapters and opening the queue.
/// * `registerAdapters` : registers the required Hive adapters.
/// * `openQueue` : opens the Hive box for the offline action queue.
/// * `addAction` : adds an action to the queue with a TTL.
/// * `getActions` : retrieves all valid actions from the queue.
/// * `removeAction` : removes a specific action from the queue.
/// * `clearActions` : clears all actions from the queue.
/// * `removeExpiredActions` : removes expired actions from the queue.
class OfflineActionQueue {
  OfflineActionQueue() {
    initialize();
  }

  ///Offline Action Queue box name.
  static const String boxName = HiveKeys.offlineActionQueueKey;
  late final Box<CachedUserAction> _actionsBox;

  /// Initializes the queue by registering adapters and opening the queue.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialize() {
    openQueue();
  }

  // /// Registers the required Hive adapters.
  // ///
  // /// **params**:
  // ///   None
  // ///
  // /// **returns**:
  // ///   None
  // void registerAdapters() {

  // }

  /// Opens the Hive box for the offline action queue.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void openQueue() {
    _actionsBox = Hive.box<CachedUserAction>(boxName);
  }

  /// Adds an action to the queue with a TTL.
  ///
  /// **params**:
  /// * `action`: the action to be added.
  ///
  /// **returns**:
  /// * `Future<bool>`: returns true if the action was added successfully, otherwise false.
  Future<bool> addAction(CachedUserAction action) async {
    try {
      await _actionsBox.put(action.id, action);
      return true;
    } catch (e) {
      // Handle or log the exception
      print('Failed to add action: $e');
      return false;
    }
  }

  /// Retrieves all valid actions from the queue.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `List<CachedUserAction>`: a list of valid actions.
  List<CachedUserAction> getActions() {
    try {
      final now = DateTime.now();
      final validActions = _actionsBox.values
          .where((action) => action.expiry.isAfter(now))
          .toList();
      removeExpiredActions();
      return validActions;
    } catch (e) {
      // Handle or log the exception
      print('Failed to get actions: $e');
      return [];
    }
  }

  /// Removes a specific action from the queue.
  ///
  /// **params**:
  /// * `key`: the key of the action to be removed.
  ///
  /// **returns**:
  /// * `Future<bool>`: returns true if the action was removed successfully, otherwise false.
  Future<bool> removeAction(dynamic key) async {
    try {
      await _actionsBox.delete(key);
      return true;
    } catch (e) {
      // Handle or log the exception
      print('Failed to remove action: $e');
      return false;
    }
  }

  /// Clears all actions from the queue.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: returns true if all actions were cleared successfully, otherwise false.
  Future<bool> clearActions() async {
    try {
      await _actionsBox.clear();
      return true;
    } catch (e) {
      // Handle or log the exception
      print('Failed to clear actions: $e');
      return false;
    }
  }

  /// Removes expired actions from the queue.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: returns true if expired actions were removed successfully, otherwise false.
  Future<bool> removeExpiredActions() async {
    try {
      final now = DateTime.now();
      final expiredKeys = _actionsBox.keys.where((key) {
        final CachedUserAction action = _actionsBox.get(key)!;
        return action.expiry.isBefore(now);
      }).toList();
      for (final key in expiredKeys) {
        await _actionsBox.delete(key);
      }
      return true;
    } catch (e) {
      // Handle or log the exception
      debugPrint('Failed to remove expired actions: $e');
      return false;
    }
  }

  /// Updates an existing action in the queue.
  ///
  /// **params**:
  /// * `action`: the action to be updated.
  ///
  /// **returns**:
  /// * `Future<bool>`: returns true if the action was updated successfully, otherwise false.
  Future<bool> updateAction(CachedUserAction action) async {
    try {
      await _actionsBox.put(action.id, action);
      return true;
    } catch (e) {
      debugPrint('Failed to update action: $e');
      return false;
    }
  }

  /// Gets pending actions sorted by timestamp.
  ///
  /// Returns all non-expired actions with pending status, sorted by
  /// timestamp in ascending order (oldest first - FIFO).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `List<CachedUserAction>`: a list of pending actions sorted by timestamp.
  List<CachedUserAction> getPendingActions() {
    try {
      final now = DateTime.now();
      return _actionsBox.values
          .where(
            (action) =>
                action.expiry.isAfter(now) &&
                action.status == CachedUserActionStatus.pending,
          )
          .toList()
        ..sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
    } catch (e) {
      debugPrint('Failed to get pending actions: $e');
      return [];
    }
  }

  /// Marks an action as completed and removes it from the queue.
  ///
  /// **params**:
  /// * `actionId`: the ID of the action to mark as completed.
  ///
  /// **returns**:
  /// * `Future<bool>`: returns true if the action was marked completed successfully, otherwise false.
  Future<bool> markCompleted(String actionId) async {
    try {
      await _actionsBox.delete(actionId);
      return true;
    } catch (e) {
      debugPrint('Failed to mark action completed: $e');
      return false;
    }
  }

  /// Gets the count of pending actions.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `int`: the number of pending actions.
  int getPendingCount() {
    try {
      final now = DateTime.now();
      return _actionsBox.values
          .where(
            (action) =>
                action.expiry.isAfter(now) &&
                action.status == CachedUserActionStatus.pending,
          )
          .length;
    } catch (e) {
      debugPrint('Failed to get pending count: $e');
      return 0;
    }
  }
}
