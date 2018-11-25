import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:redux/redux.dart';

final visibilityReducer = combineReducers<VisibilityFilter>([

]);

VisibilityFilter _newestFilterReducer(
  VisibilityFilter newestFilter, UpdateFilterAction action) {
    return action.newFilter;
  }