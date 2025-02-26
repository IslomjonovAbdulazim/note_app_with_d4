import 'package:flutter/material.dart';
import 'package:note_app_with_d4/models/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> notes = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    notes = await readAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            NoteModel data = notes[index];
            return ListTile(
              title: Text(data.title),
              subtitle: Text(data.body),
            );
          },
        ),
      ),
    );
  }
}
