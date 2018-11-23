import 'package:kaffe_app/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadArticlesAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}