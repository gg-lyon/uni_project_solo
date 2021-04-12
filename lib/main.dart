import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:simple_note/controller/FirebaseController.dart';
import 'package:simple_note/screens/NoteAdd.dart';
import 'package:simple_note/screens/NoteEdit.dart';
import 'package:simple_note/screens/NotesList.dart';
import 'package:simple_note/screens/SignIn.dart';
import 'package:simple_note/screens/SignUp.dart';

import 'screens/NoteEdit.dart';
import 'screens/NoteEdit.dart';


void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notetaking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Notes List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        NoteEditScreen.route: (context)=> NoteEditScreen()
      },
      home: FutureBuilder<Object>(
          future: initDb(),
          builder: (context, snapshot) {
            return Scaffold(

              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  NoteAddWidget())); //SignInPage()));
                },
              ),
              appBar: AppBar(
                title: Text(widget.title),
                actions: <Widget>[
                  IconButton(//FlatButton.icon(
                    iconSize: 35,
                    icon: Icon(Icons.person),
                    //label: Text('Sign In'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
                    },
                  )
                ],
              ),
              body: StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance.collection('notes').snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return Center(
                        child: Column(
                          children: [
                            NotesListScreen()
                          ],
                        ));
                  }
              ),
            );
          }
      ),
    );
  }
}