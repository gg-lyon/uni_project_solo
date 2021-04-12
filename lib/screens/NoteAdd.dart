import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_note/controller/FirebaseController.dart';
import 'package:simple_note/models/Note.dart';


class NoteAddWidget extends StatefulWidget {
  final Note note;

  const NoteAddWidget({Key key, this.note}) : super(key: key);
  @override
  _NoteAddWidgetState createState() => _NoteAddWidgetState();
}

class _NoteAddWidgetState extends State<NoteAddWidget> {
  Note _note;

  @override
  void initState() {
    _note = widget.note ?? Note();  //?? means checking if its null
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
        text: _note.title ?? "");
    TextEditingController contentController = TextEditingController(
        text: _note.content ?? "");
    return Scaffold(
      appBar: AppBar(title: Text('Add Note'),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.save),
            //label: Text('Sign In'),
            onPressed: () {
              _note.dateTime = DateTime.now();
              recordDocument(_note);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
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
              onChanged: (title) => _note.title = title,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: TextField(
                  controller: contentController,
                  maxLines: null,
                  minLines: 30,
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
                  onChanged: (content) => _note.content = content,),
              ),
            ),
          ],
        ),
      ),
    );
  }


}


