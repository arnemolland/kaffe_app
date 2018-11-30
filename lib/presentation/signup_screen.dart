import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/constants/painters.dart';
import 'dart:ui';
import 'package:kaffe_app/constants/routes.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
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
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 42),
                    ),
                  ),
                  tag: 'signup',
                ),
                SizedBox(height: 100.0),
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _signupSnack = SnackBar(
    content: Row(
      children: <Widget>[
        Text(
          'Signing up..',
          style: TextStyle(color: Colors.black45),
        ),
      ],
    ),
    backgroundColor: Colors.white,
  );

  final _invalidSnack = SnackBar(
    content: Text('Invalid email or password',
        style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.red,
  );

  final _connectionSnack = SnackBar(
    content: Row(children: <Widget>[
      Text('Not connected to a network', style: TextStyle(color: Colors.white)),
    ]),
    backgroundColor: Colors.red,
  );

  final passFocus = FocusNode();
  final mailFocus = FocusNode();

  _onSubmit(Store<AppState> store, String email, String password) {
    store.dispatch(SignUpMailAction(
        onCompleted: _onCompleted,
        onError: _onError,
        email: email,
        password: password));
  }

  _onCompleted() {
    Navigator.pushNamedAndRemoveUntil(
        context, KaffeRoutes.main, (Route<dynamic> route) => false);
  }

  _onError(error) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(_invalidSnack);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SignUpScreenViewModel>(converter: (store) {
      return new SignUpScreenViewModel();
    }, builder: (context, viewModel) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              focusNode: mailFocus,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your email';
                }
              },
              controller: _emailController,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(passFocus);
              },
              keyboardType: TextInputType.emailAddress,
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
              focusNode: passFocus,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter your password';
                }
              },
              controller: _passwordController,
              textInputAction: TextInputAction.done,
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
              onEditingComplete: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(_signupSnack);
                  _onSubmit(StoreProvider.of<AppState>(context),
                      _emailController.text, _passwordController.text);
                } //Navigator.pop(context);
              },
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
                      'Sign up',
                      style: TextStyle(fontFamily: 'Raleway'),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(_signupSnack);
                        _onSubmit(StoreProvider.of<AppState>(context),
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
                child: Row(
                  children: <Widget>[
                    Text(
                      'By signing up you agree to the ',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Terms and Conditions',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
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

class SignUpScreenViewModel {
  final Function(String email, String password) signUpUserCallback;

  SignUpScreenViewModel({this.signUpUserCallback});
}
