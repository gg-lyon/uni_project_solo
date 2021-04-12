import 'package:flutter/material.dart';
import 'package:simple_note/screens/SignUp.dart';

class SignInPage extends StatelessWidget {

  //text field
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In Page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter email',
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
                    labelText: 'Enter password',
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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text('Sign In', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text('Sign Up', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
