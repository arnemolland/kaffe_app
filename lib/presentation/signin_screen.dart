import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/actions/actions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import 'package:kaffe_app/constants/painters.dart';
import 'dart:async';
import 'dart:io';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/constants/routes.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key ?? KaffeKeys.signinScreen);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  double _radius = 0.0;
  double _newRadius = 0.0;
  AnimationController _radiusAnimationController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _radius = 1200.0;
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
        if (status == AnimationStatus.completed) {
          Navigator.pop(context);
        }
      });
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _loginSnack = SnackBar(
    content: Row(
      children: <Widget>[
        Icon(Icons.error, color: Colors.white),
        Text(
          'Logging in..',
          style: TextStyle(color: Colors.black45, fontFamily: 'Raleway'),
        ),
      ],
    ),
    backgroundColor: Colors.white,
  );

  final _invalidSnack = SnackBar(
      content: Text('Invalid email or password',
          style: TextStyle(color: Colors.white, fontFamily: 'Raleway')),
      backgroundColor: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: CustomPaint(
          painter: LaunchArcPainter(
              startColor: Theme.of(context).accentColor,
              endColor: Color(0xFFFA9D11),
              radius: _radius,
              surfaceColor: Colors.grey,
              paintBackdrop: false),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Hero(
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 42),
                    ),
                  ),
                  tag: 'login',
                ),
                SizedBox(height: 100.0),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginSnack = SnackBar(
    content: Row(
      children: <Widget>[
        Icon(Icons.error, color: Colors.white),
        Text(
          'Logging in..',
          style: TextStyle(color: Colors.black45, fontFamily: 'Raleway'),
        ),
      ],
    ),
    backgroundColor: Colors.white,
  );

  final _invalidSnack = SnackBar(
      content: Text('Invalid email or password',
          style: TextStyle(color: Colors.white, fontFamily: 'Raleway')),
      backgroundColor: Colors.red);

  _signInUser(Function(String email, String password) onSubmittedCallback,
      String email, String password) async {
    onSubmittedCallback(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SignInScreenViewModel>(converter: (store) {
      return new SignInScreenViewModel(
          signInUserEmailCallback: ((email, password) =>
              store.dispatch(new SignInMailAction(email, password))),
          signInGoogleCallback: () => store.dispatch(new SignInGoogleAction()));
    }, builder: (context, viewModel) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your email';
                }
              },
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelStyle:
                    TextStyle(color: Colors.white70, fontFamily: 'Raleway'),
                filled: false,
                labelText: 'Email',
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),

            // Spacer
            SizedBox(height: 12.0),

            // [Password]
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your password';
                }
              },
              controller: _passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.circular(30),
                ),
                labelStyle:
                    TextStyle(color: Colors.white70, fontFamily: 'Raleway'),
                filled: false,
                labelText: 'Password',
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
              obscureText: true,
            ),

            SizedBox(
              height: 50.0,
            ),
            Center(
              child: SizedBox(
                height: 50.0,
                width: 250.0,
                child: OutlineButton(
                    child: Text(
                      'Enter',
                      style: TextStyle(fontFamily: 'Raleway'),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(_loginSnack);
                        _signInUser(viewModel.signInUserEmailCallback,
                            _emailController.text, _passwordController.text);
                      } //Navigator.pop(context);
                    }),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: FlatButton(
                child: Text('Having trouble logging in?'),
                textColor: Colors.white,
                onPressed: () {
                  _emailController.clear();
                  _passwordController.clear();
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

@immutable
class SignInScreenViewModel {
  final Function(String email, String password) signInUserEmailCallback;
  final Function() signInGoogleCallback;

  SignInScreenViewModel(
      {this.signInUserEmailCallback, this.signInGoogleCallback});
}
