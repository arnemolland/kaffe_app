import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/optional.dart';

List<Article> articlesSelector(AppState state) => state.articles;

bool isLoadingSelector(AppState state) => state.isLoading;

AppTab activeTabSelector(AppState state) => state.activeTab;

Optional<Article> articleSelector(List<Article> articles, String id) {
  try {
    return Optional.of(articles.firstWhere((article) => article.id == id));
  } catch (e) {
    return Optional.absent();
  }
}