import 'package:flutter/material.dart';
import 'package:note_keeper/screens/note_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteKeeper',
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
      home: NoteList(),
    );
  }

}
