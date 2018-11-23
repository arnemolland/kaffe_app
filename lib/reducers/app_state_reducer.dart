import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/reducers/loading_reducer.dart';
import 'package:kaffe_app/reducers/articles_reducer.dart';
import 'package:kaffe_app/reducers/tabs_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    articles: articlesReducer(state.articles, action),
    activeTab: tabsReducer(state.activeTab, action),
  );
}