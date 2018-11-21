import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/constants/routes.dart';

class LaunchScreen extends StatefulWidget {
  LaunchScreen() : super(key: KaffeKeys.launchScreen);
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Hero(
                child: Image.asset(
                  'assets/images/kaffe_logo_outline.png',
                  fit: BoxFit.scaleDown,
                  scale: 7.5,
                  alignment: Alignment.center,
                ),
                tag: "logo",
              ),
              SizedBox(
                height: 100.0,
              ),
              FlatButton(
                  child: Hero(
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontFamily: 'Merriweather',
                          fontSize: 32),
                    ),
                    tag: "login",
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, KaffeRoutes.login)),
            ],
          ),
        ),
      ),
    );
  }
}
