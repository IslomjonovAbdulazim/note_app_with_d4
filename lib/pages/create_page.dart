import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_d4/models/note_model.dart';

class CreatePage extends StatefulWidget {
  final NoteModel? note;

  const CreatePage({super.key, this.note});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final titleController = TextEditingController();
  final titleFocus = FocusNode();
  final bodyController = TextEditingController();
  final bodyFocus = FocusNode();

  @override
  void initState() {
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      bodyController.text = widget.note!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Note"),
        actions: [
          CupertinoButton(
            onPressed: () {},
            child: Text("Save"),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                focusNode: titleFocus,
                onTapOutside: (val) => titleFocus.unfocus(),
                decoration: InputDecoration(
                  hintText: "Title...",
                ),
              ),
              Expanded(
                child: TextField(
                  controller: bodyController,
                  focusNode: bodyFocus,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







