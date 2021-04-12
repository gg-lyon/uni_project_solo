import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_note/controller/FirebaseController.dart';
import 'package:simple_note/models/Note.dart';
import 'package:simple_note/screens/NotesList.dart';

class NoteEditWidget extends StatefulWidget {
  final Note note;

  const NoteEditWidget({Key key, this.note}) : super(key: key);
  @override
  _NoteEditWidgetState createState() => _NoteEditWidgetState();
}

class _NoteEditWidgetState extends State<NoteEditWidget> {
  Note note;

  @override
  void initState() {
    note = widget.note ?? Note();  //?? means checking if its null
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: note.title ?? "");
    TextEditingController contentController = TextEditingController(text: note.content ?? "");

    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
              labelText: "Title",
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
              )

          ),
          onChanged: (title)=>note.title = title,),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: TextField(
              maxLines: null,
              minLines: 30,
              controller: contentController,
              decoration: InputDecoration(
                  labelText: "Message",
                  hintText: "Write message here...",
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                  )

              ),
              onChanged: (content)=>note.content = content,),
          ),
        ),

        /*Padding(                                    removed buttons and added
          padding: const EdgeInsets.all(16.0),        icons in top right
          child: ElevatedButton(
            child: Text("Save note"),
            onPressed: (){
              note.dateTime = DateTime.now();
              recordDocument(note);
              Navigator.pop(context);
            },),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextButton(
            child: Text("Delete note"),
            onPressed: () {
              Navigator.pop(context);
              deleteDocument(note.id);
            },),
        )*/
      ],);
  }
}


class NoteEditScreen extends StatelessWidget {
  static const String route = "/NoteEditScreen";


  Note getNoteFromParams(BuildContext context) {
    NoteEditScreenArguments args = ModalRoute.of(context).settings.arguments;
    return args?.note ?? Note();
  }

  @override
  Widget build(BuildContext context) {
    Note note = getNoteFromParams(context);
    return Scaffold(
      appBar: AppBar(title: Text("Edit Note"),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.save),
            //label: Text('Sign In'),
            onPressed: () {
              note.dateTime = DateTime.now();
              recordDocument(note);
              Navigator.pop(context);
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            //label: Text('Sign In'),
            onPressed: () {
              Navigator.pop(context);
              deleteDocument(note.id);
            },
          ),
        ],),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NoteEditWidget(note: note,),
      ),
    );
  }
}

class NoteEditScreenArguments {
  final Note note;

  NoteEditScreenArguments(this.note);
}