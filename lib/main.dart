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
import 'presentation/main_screen.dart';
import 'presentation/signup_screen.dart';
import 'package:kaffe_app/presentation/article_editor.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main([
  ReactiveArticlesRepository articlesRepository,
  UserRepository userRepository,
]) {
  runApp(KaffeApp(
      articlesRepository: articlesRepository,
      userRepository: userRepository));
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
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
        title: 'Kaffe',
        theme: KaffeTheme.modernTheme,
        routes: {
          KaffeRoutes.main: (context) => MainScreen(),
          KaffeRoutes.feed: (context) => MainScreen(),
          KaffeRoutes.login: (context) => SignInScreen(),
          KaffeRoutes.launch: (context) => LaunchScreen(),
          KaffeRoutes.editor: (context) => ArticleEditor()
        },
        initialRoute: '/launch',
      ),
    );
  }
}


