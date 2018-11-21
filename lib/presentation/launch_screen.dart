import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/constants/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                child: SvgPicture.asset(
                  'assets/images/kaffe_logo_outline.svg',
                  fit: BoxFit.cover,
                  height: 150.0,
                  color: Theme.of(context).accentColor,
                  alignment: Alignment.center,
                ),
                tag: "logo",
              ),
              SizedBox(
                height: 450.0,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  OutlineButton(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Text(' Login ',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      textColor: Theme.of(context).buttonColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      highlightColor: Theme.of(context).buttonColor,
                      borderSide: BorderSide(
                        color: Theme.of(context).buttonColor,
                        width: 2.0,
                      ),
                      highlightedBorderColor: Theme.of(context).buttonColor,
                      onPressed: () {}),
                  OutlineButton(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      textColor: Theme.of(context).buttonColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      highlightColor: Theme.of(context).buttonColor,
                      borderSide: BorderSide(
                        color: Theme.of(context).buttonColor,
                        width: 2.0,
                      ),
                      highlightedBorderColor: Theme.of(context).buttonColor,
                      onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
