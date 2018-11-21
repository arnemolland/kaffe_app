import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/constants/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

class LaunchScreen extends StatefulWidget {
  LaunchScreen() : super(key: KaffeKeys.launchScreen);
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with TickerProviderStateMixin {
  double _radius = 0.0;
  double _newRadius = 0.0;
  AnimationController raduiusAnimationController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _radius = 500.0;
    });

    raduiusAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {
          _radius =
              lerpDouble(_radius, _newRadius, raduiusAnimationController.value);
        });
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
          ),
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
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: Text('Signup',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
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
                          setState(() {
                            _radius = _newRadius;
                            _newRadius = 1100;
                            raduiusAnimationController.forward(from: 0.0);
                          });
                        }),
                    OutlineButton(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: Text(
                          ' Login ',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
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
                          _radius = _newRadius;
                          _newRadius = 500;
                          raduiusAnimationController.forward(from: 0.0);
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

class LaunchArcPainter extends CustomPainter {
  Color startColor;
  Color endColor;
  double radius;
  LaunchArcPainter({this.startColor, this.endColor, this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = new Offset(size.width / 2, size.height * 1.25);
    Rect rect = new Rect.fromCircle(center: center, radius: radius);

    final Gradient gradient = new LinearGradient(
      colors: <Color>[startColor, endColor],
      stops: [0.0, 1.0],
    );
    Paint surface = new Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(rect);

    canvas.drawCircle(center, radius, surface);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
