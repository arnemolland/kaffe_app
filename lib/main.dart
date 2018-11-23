import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/theme.dart';
import 'constants/routes.dart';
import 'package:kaffe_app/presentation/launch_screen.dart';
import 'presentation/signin_screen.dart';
import 'package:kaffe_repository/kaffe_repository.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_app/reducers/app_state_reducer.dart';
import 'package:kaffe_app/middleware/auth_middleware.dart';
import 'package:kaffe_app/middleware/store_articles_middleware.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/repositories/flutterfire/reactive_articles_repository.dart';
import 'package:kaffe_app/repositories/flutterfire/user_repository.dart';
import 'package:kaffe_app/actions/actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main([
  ReactiveArticlesRepository articlesRepository,
  UserRepository userRepository,
]) {
  runApp(KaffeApp(
      articlesRepository: articlesRepository, userRepository: userRepository));
}

class KaffeApp extends StatelessWidget {
  final Store<AppState> store;

  KaffeApp({
    Key key,
    ReactiveArticlesRepository articlesRepository,
    UserRepository userRepository,
  })  : store = Store<AppState>(
          appReducer,
          initialState: AppState.loading(),
          middleware: []..addAll(createStoreArticlesMiddleware(
            articlesRepository ??
                FirestoreReactiveArticlesRepository(Firestore.instance)),
          )..addAll(createAuthMiddleware(userRepository ?? FirebaseUserRepository(FirebaseAuth.instance))),
        ),
        super(key: key) {
    store.dispatch(InitAppAction());
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Kaffe',
        theme: KaffeTheme.modernTheme,
        routes: {
          KaffeRoutes.home: (context) => MyHomePage(),
          KaffeRoutes.login: (context) => SignInScreen(),
          KaffeRoutes.launch: (context) => LaunchScreen()
        },
        initialRoute: '/launch',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
