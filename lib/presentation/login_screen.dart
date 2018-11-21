import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen() : super(key: KaffeKeys.loginScreen);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _loginSnack = SnackBar(
    content: Row(
      children: <Widget>[
        Icon(Icons.error, color: Colors.white),
        Text(
          'Logging in..',
          style: TextStyle(color: Colors.black45),
        ),
      ],
    ),
    backgroundColor:Colors.white,
  );

  final _invalidSnack = SnackBar(
    content: Text('Invalid email or password',
        style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.red
  );

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
                child: SvgPicture.asset('assets/images/kaffe_logo_outline.svg',
                fit: BoxFit.cover,
                height: 200.0,
                color: Theme.of(context).accentColor,
                alignment: Alignment.center,
                ),
                tag: "logo",
              ),
              SizedBox(
                height: 50.0,
              ),
              Hero(
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Theme.of(context).buttonColor,
                        fontFamily: 'Raleway',
                        fontSize: 36),
                  ),
                ),
                tag: "login",
              ),
              SizedBox(height: 100.0),

            ],
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
          style: TextStyle(color: Colors.black45),
        ),
      ],
    ),
    backgroundColor:Colors.white,
  );

  final _invalidSnack = SnackBar(
    content: Text('Invalid email or password',
        style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.red
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Log in',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 36.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter your email';
              }
            },
            controller: _emailController,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
              ),
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
              labelStyle: TextStyle(
                color: Theme.of(context).accentColor,
              ),
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
              child: RaisedButton(
                  padding: new EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: Text('Login'),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.green,
                  textColor: Colors.white,
                  elevation: 0.5,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(_loginSnack);
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
  }
}