import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_note/controller/FirebaseController.dart';
import 'package:simple_note/models/Note.dart';
import 'package:simple_note/screens/NoteEdit.dart';
import 'package:simple_note/widgets/NoteWidget.dart';

import 'NoteEdit.dart';

class NotesListWidget extends StatelessWidget {
  final List<Note> notesList;


  const NotesListWidget({Key key, this.notesList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(notesList == null || notesList.isEmpty) {
      return Center(child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
        child: Text("Add a note...", style: TextStyle(fontSize: 25),),
      ),);
    }
    return Column(
      children: notesList.map<Widget>((note) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NoteEditScreen(),
                settings: RouteSettings(arguments: NoteEditScreenArguments(note))));
          },
          child: NoteWidget(note: note,))).toList(),
    );
  }
}

class NotesListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder<List<Note>>(
          future: getAllDocuments(),
          builder: (context,  AsyncSnapshot<List<Note>> snapshot) {

            if (snapshot.hasData) {
              return NotesListWidget(notesList: snapshot.data,);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          });

  }
}

