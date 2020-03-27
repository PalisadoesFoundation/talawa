class Note {
  int id;
  int senderId;
  int activityId;
  String message;
  DateTime timestamp;

  Note(int id, int senderId, int activityId, String message,
      DateTime timestamp) {
    this.id = id;
    this.senderId = senderId;
    this.activityId = activityId;
    this.message = message;
    this.timestamp = timestamp;
  }
}
