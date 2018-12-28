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
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key ?? KaffeKeys.signinScreen);
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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

  _onSubmit(Store<AppState> store, String email, String password) {
    store.dispatch(SignInMailAction(
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
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(_invalidSnack);
  }

  _displaySnack(SnackBar bar) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(bar);
  }

  final passFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
          key: KaffeKeys.signInFab,
          backgroundColor: Colors.white,
          child: Icon(Icons.subdirectory_arrow_right),
          foregroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _displaySnack(_loginSnack);
              _onSubmit(StoreProvider.of<AppState>(context),
                  _emailController.text, _passwordController.text);
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Enter your email';
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(passFocus);
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelStyle: TextStyle(
                            color: Colors.white70, fontFamily: 'Raleway'),
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
                        textInputAction: TextInputAction.send,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelStyle: TextStyle(
                              color: Colors.white70, fontFamily: 'Raleway'),
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
                            _displaySnack(_loginSnack);
                            _onSubmit(
                                StoreProvider.of<AppState>(context),
                                _emailController.text,
                                _passwordController.text);
                          } //Navigator.pop(context);              },
                        }),

                    SizedBox(
                      height: 50.0,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
