import 'package:fickle/components/rounded_button.dart';
import 'package:fickle/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:fickle/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  String username;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'Flicker',
                child: Container(
                  height: 45.0,
                  child: Image.asset('images/Flicker.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                  username = value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Username')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email =  value;
                  },
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Password')),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Sign up',
                buttonColor: Colors.pinkAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(newUser != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }catch (e){
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
