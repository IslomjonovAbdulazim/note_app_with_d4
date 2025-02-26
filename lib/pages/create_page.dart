import 'package:flutter/material.dart';
import 'package:note_app_with_d4/models/note_model.dart';

class CreatePage extends StatefulWidget {
  final NoteModel? note;
  const CreatePage({super.key, this.note});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

