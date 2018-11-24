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
    with TickerProviderStateMixin {
  double _radius;
  double _newRadius = 0.0;
  bool isLogin = false;
  bool shouldNavigate = false;
  AnimationController _radiusAnimationController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _radius = 1200;
    });

    _radiusAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {
          _radius =
              lerpDouble(_radius, _newRadius, _radiusAnimationController.value);
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && isLogin && shouldNavigate) {
          Navigator.pushNamed(context, KaffeRoutes.login);
        }
        if (status == AnimationStatus.completed && !isLogin && shouldNavigate) {
          Navigator.pushNamed(context, KaffeRoutes.signup);
        }
      });

          setState(() {
          _radius = _newRadius;
          _newRadius = 500;
          _radiusAnimationController.forward(from: 0);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CustomPaint(
          painter: LaunchArcPainter(
              startColor: Theme.of(context).accentColor,
              endColor: Color(0xFFFA9D11),
              radius: _radius,
              surfaceColor: Colors.grey,
              paintBackdrop: true),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 125.0,
                ),
                Image.asset(
                  'assets/images/takeaway.png',
                  fit: BoxFit.cover,
                  height: 300.0,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'The daily fuel.',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 22,
                      color: Colors.black12,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 200.0,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    OutlineButton(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: Hero(
                          child: Text('Signup',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          tag: 'signup',
                        ),
                        textColor: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        highlightColor: Theme.of(context).primaryColorLight,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        highlightedBorderColor: Colors.white,
                        onPressed: () {
                          shouldNavigate = true;
                          setState(() {
                            isLogin = false;
                            _radius = _newRadius;
                            _newRadius = 1200;
                            _radiusAnimationController.forward(from: 0.0);
                          });
                        }),
                    OutlineButton(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                        child: Hero(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            tag: 'login'),
                        textColor: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        highlightColor: Colors.white,
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        highlightedBorderColor:
                            Theme.of(context).primaryColorLight,
                        onPressed: () {
                          shouldNavigate = true;
                          setState(() {
                            isLogin = true;
                            _radius = _newRadius;
                            _newRadius = 1200;
                            _radiusAnimationController.forward(from: 0.0);
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
