import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/optional.dart';

List<Article> articlesSelector(AppState state) => state.articles;

VisibilityFilter activeFilterSelector(AppState state) => state.activeFilter;

bool isLoadingSelector(AppState state) => state.isLoading;

AppTab activeTabSelector(AppState state) => state.activeTab;

List<Article> newestArticleSelector(List<Article> articles) =>
  articles.where((article) => DateTime.now().difference(article.published).inDays < 31).toList();

List<Article> filteredArticlesSelector(
  List<Article> articles,
  VisibilityFilter activeFilter,
) {
  switch (activeFilter) {
    case VisibilityFilter.newest:
      return newestArticleSelector(articles);
    case VisibilityFilter.all:
    default:
     return articles;
  }
}

Optional<Article> articleSelector(List<Article> articles, String id) {
  try {
    return Optional.of(articles.firstWhere((article) => article.id == id));
  } catch (e) {
    return Optional.absent();
  }
}