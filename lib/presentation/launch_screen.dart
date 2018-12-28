import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/constants/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaffe_app/constants/painters.dart';
import 'dart:ui';
import 'dart:io';
import 'dart:async';

class LaunchScreen extends StatefulWidget {
  LaunchScreen() : super(key: KaffeKeys.launchScreen);
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with RouteAware, TickerProviderStateMixin {
  double _radius;
  AnimationController _radiusAnimationController;

  @override
  void initState() {
    super.initState();
  }

  // Called when the top route has been popped off, and the current route shows up.
  @override
  void didPopNext() {
    setState(() {
      _radiusAnimationController.reverse(from: 1);
    });
    debugPrint("didPopNext: $runtimeType");
  }

  // Called when the current route has been pushed.
  @override
  void didPush() {
    _radiusAnimationController.reverse(from: 1);
    debugPrint("didPush: $runtimeType");
  }

  // Called when the current route has been popped off.
  @override
  void didPop() {
    debugPrint("didPop: $runtimeType");
  }

  // Called when a new route has been pushed, and the current route is no longer visible.
  @override
  void didPushNext() {
    _radiusAnimationController.forward(from: 0.0);
    debugPrint("didPushNext ${runtimeType}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: KaffeKeys.signInFab,
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_forward),
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, KaffeRoutes.login);
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Container(
        color: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 125.0,
              ),
              Text(
                'kaffe.io',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 72,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Runtime.',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 22,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
