import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePage(),
                ),
              );
              load();
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
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatePage(note: data),
                  ),
                );
                load();
              },
              child: ListTile(
                title: Text(
                  data.title,
                  style: TextStyle(),
                  maxLines: 1,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.body,
                      style: TextStyle(),
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          DateFormat.yMMMMd().format(data.time),
                        ),
                        Text(" at "),
                        Text(
                          DateFormat.Hm().format(data.time),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    await deleteNote(data);
                    load();
                  },
                  child: Icon(CupertinoIcons.delete),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
