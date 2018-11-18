import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super(key: KaffeKeys.loginScreen);
  @override
  _LoginScreenState createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0,),
              Image.asset(
                'assets/images/kaffe_logo_outline.png',
                fit: BoxFit.scaleDown,
                scale: 7.5,
                alignment: Alignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
