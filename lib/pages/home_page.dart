import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_d4/models/note_model.dart';
import 'package:note_app_with_d4/pages/create_page.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Notes"),
        actions: [
          CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePage(),
                ),
              );
            },
            child: Icon(CupertinoIcons.add, size: 30),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            NoteModel data = notes[index];
            return ListTile(
              title: Text(
                data.title,
                style: TextStyle(),
                maxLines: 1,
              ),
              subtitle: Column(
                children: [
                  Text(
                    data.body,
                    style: TextStyle(),
                    maxLines: 2,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
