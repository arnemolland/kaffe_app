import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_repository/kaffe_repository.dart';

List<Middleware<AppState>> createAuthMiddleware(
  UserRepository userRepository
) {
  return [
    TypedMiddleware<AppState, SignInMailAction>(
      _firebaseSignInMail(userRepository),
    ),
    TypedMiddleware<AppState, SignUpMailAction>(
      _firebaseSignUpMail(userRepository),
    ),
    TypedMiddleware<AppState, SignInGoogleAction>(
      _firebaseSignInGoogle(userRepository),
    ),
  ];
}

void Function(
  Store<AppState> store,
  SignInMailAction action,
  NextDispatcher next,
) _firebaseSignInMail(
  UserRepository repository,
) {
  return (store, action, next) {
    next(action);

    repository.signinMail(action.email, action.password).then((_) {
      store.dispatch(ConnectToDataSourceAction());
    });
  };
}

void Function(
  Store<AppState> store,
  SignUpMailAction action,
  NextDispatcher next,
) _firebaseSignUpMail(
  UserRepository repository,
) {
  return (store, action, next) {
    next(action);

    repository.signupMail(action.email, action.password).then((_) {
      store.dispatch(ConnectToDataSourceAction());
    });
  };
}

void Function(
  Store<AppState> store,
  SignInGoogleAction action,
  NextDispatcher next,
) _firebaseSignInGoogle(
  UserRepository repository
) {
  return (store, action, next) {
    next(action);

    repository.signinGoogle().then((_) {
      store.dispatch(ConnectToDataSourceAction());
    });
  };
}



