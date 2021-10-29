import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/component/rounded_button.dart';
import 'package:firebase_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'chat_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  KTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                pass = value;
              },
              decoration: KTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onpressed: ()async {
                setState(() {
                 // spinner=true;
                });
                final existeduser =await _auth.signInWithEmailAndPassword(
                    email: email, password: pass);
                try {
                  if (existeduser != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreen()));
                  }
                  setState(() {
                   // spinner=false;
                  });
                } catch (e) {
                  print(e);
                }
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
