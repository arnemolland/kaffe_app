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
              SizedBox(
                height: 50.0,
              ),
              Hero(
                child: Image.asset(
                  'assets/images/kaffe_logo_outline.png',
                  fit: BoxFit.scaleDown,
                  scale: 10,
                  alignment: Alignment.center,
                ),
                tag: "logo",
              ),
              SizedBox(
                height: 50.0,
              ),
              Hero(
                child: Text(
                  'Log in',
                  style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontFamily: 'Merriweather',
                      fontSize: 46),
                ),
                tag: "login",
              )
            ],
          ),
        ),
      ),
    );
  }
}
