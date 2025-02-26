import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
