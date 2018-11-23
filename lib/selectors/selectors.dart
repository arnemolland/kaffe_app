import 'package:kaffe_app/models/models.dart';

List<Article> articlesSelector(AppState state) => state.articles;

bool isLoadingSelector(AppState state) => state.isLoading;

AppTab activeTabSelector(AppState state) => state.activeTab;