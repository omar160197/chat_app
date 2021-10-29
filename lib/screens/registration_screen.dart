import 'package:firebase_chat/component/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:firebase_chat/constants.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
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
                 email=value;
                },
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                pass=value;
                },
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title:   'Register',
                colour: Colors.blueAccent,
                onpressed: () async{
                  setState(() {

                  });
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: pass);
                    if (newuser != null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                    }

                    setState(() {

                    });
                    }catch(e){
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
    );
  }
}
