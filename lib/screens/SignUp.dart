import 'package:flutter/material.dart';
import '../main.dart';
import '../models/Note.dart';


class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter a name',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                      )
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter an email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                      )
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter a password',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0)
                      )
                  ),
                  obscureText: true,
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Sign Up', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyApp()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

