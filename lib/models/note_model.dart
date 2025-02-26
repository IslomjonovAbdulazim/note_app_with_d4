import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class NoteModel {
  // Fields
  late String title;
  late String body;
  late DateTime time;

  // Constructor
  NoteModel({
    required this.title,
    required this.body,
    required this.time,
  });

  // fromJson = import
  NoteModel.fromJson(Map json) {
    title = json["title"];
    body = json["body"];
    time = DateTime.parse(json["time"]);
  }

  // toJson = export
  Map toJson() => {
        "title": title,
        "body": body,
        "time": time.toIso8601String(),
      };
}

Future<List<NoteModel>> readAllNotes() async {
  final db = await SharedPreferences.getInstance();
  String? data = db.getString("notes");
  List<NoteModel> result = [];
  if (data != null) {
    List jsonList = List.from(jsonDecode(data));
    result = jsonList.map((json) => NoteModel.fromJson(json)).toList();
    result.sort((one, another) => another.time.compareTo(one.time));
  }
  return result;
}

Future<void> saveAllNotes(List<NoteModel> notes) async {
  List jsonList = notes.map((model) => model.toJson()).toList();
  String data = jsonEncode(jsonList);
  final db = await SharedPreferences.getInstance();
  await db.setString("notes", data);
}

Future<void> deleteNote(NoteModel note) async {
  List<NoteModel> data = await readAllNotes();
  data.removeWhere((one) => one.time == note.time);
  await saveAllNotes(data);
}

Future<void> createNote(NoteModel note) async {
  List<NoteModel> data = await readAllNotes();
  data.removeWhere((one) => one.time == note.time);
  data.add(note);
  await saveAllNotes(data);
}





