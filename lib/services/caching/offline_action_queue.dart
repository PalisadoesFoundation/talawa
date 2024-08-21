import 'package:hive/hive.dart';
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
  ///Offline Action Queue box name.
  static const String boxName = 'offline_action_queue';
  late final Box<CachedUserAction> _actionsBox;

  /// Initializes the queue by registering adapters and opening the queue.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initialize() async {
    registerAdapters();
    await openQueue();
  }

  /// Registers the required Hive adapters.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void registerAdapters() {
    Hive.registerAdapter(CachedUserActionAdapter());
    Hive.registerAdapter(CachedOperationTypeAdapter());
    Hive.registerAdapter(CachedUserActionStatusAdapter());
  }

  /// Opens the Hive box for the offline action queue.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> openQueue() async {
    _actionsBox = await Hive.openBox<CachedUserAction>(boxName);
    print('initialised');
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
      print('Failed to remove expired actions: $e');
      return false;
    }
  }
}
