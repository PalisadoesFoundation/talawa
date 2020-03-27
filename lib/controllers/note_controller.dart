import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:talawa/model/note.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/views/widgets/chat_message.dart';

class NoteController with ChangeNotifier {
  //TODO: Refactor code such that the current user id is easily accessible across more than one provider
  int currentUserId;
  SocketIO socket;

  void initializeSocket(int tCurrentUserId) async {
    currentUserId = tCurrentUserId;
    if (this.socket != null) {
      print("Socket already initialized");
    } else {
      this.socket = await SocketIOManager().createInstance(SocketOptions(
          baseRoute,
          enableLogging: true,
          transports: [Transports.WEB_SOCKET]));
      this.socket.onConnect((data) {
        print("connected...");
        socket.emit("join_activity_rooms", [currentUserId]);
      });
      this.socket.onConnectError((err) {
        print(err);
      });
      this.socket.on("joined_room", (data) {
        print(data);
      });
      this.socket.on("receive_note", (data) {
        _addNote(data);
      });
      this.socket.connect();
    }
  }

  void sendMessage(String activity, String message) {
    Map<String, dynamic> requestBody = {
      "activity": activity,
      "sender": currentUserId,
      "message": message
    };
    this.socket.emit("send_note", [requestBody]);
  }

  Future<List<Note>> getNotes(int activityId) async {
    Database db = await openDatabase('notes.db', version: 1);
    List<Note> notes = [];
    var query = await db.rawQuery('SELECT * FROM Note WHERE activityId = ?', [activityId]);
    query.forEach((item){
      notes.add(new Note(item["id"], item["senderId"], item["activityId"], 
      item["message"], DateTime.fromMicrosecondsSinceEpoch(item["timestamp"])));
    });
    return notes;
  }

  void _addNote(Map<String, dynamic> requestBody) async {
    //Create note instance
    Note note = new Note(
        requestBody["id"],
        requestBody["senderId"],
        requestBody["activityId"],
        requestBody["body"],
        DateTime.fromMillisecondsSinceEpoch(requestBody["timestamp"]));
    Database db = await openDatabase('notes.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY, senderId INTEGER, activityId INTEGER, message TEXT, timestamp BLOB)');
    });

    db.transaction((tran) async {
      await tran.rawInsert(
          'INSERT INTO Note (id, senderId, activityId, message, timestamp) VALUES(?, ?, ?, ?, ?)',
          [
            note.id,
            note.senderId,
            note.activityId,
            note.message,
            note.timestamp.microsecondsSinceEpoch
          ]);
      notifyListeners();
    });
  }
}
