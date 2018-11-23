import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:redux/redux.dart';

final articlesReducer = combineReducers<List<Article>>([
  TypedReducer<List<Article>, LoadArticlesAction>(_setLoadedArticles),
  TypedReducer<List<Article>, DeleteArticleAction>(_deleteArticle),
]);

List<Article> _setLoadedArticles(List<Article> articles, LoadArticlesAction action) {
  return action.articles;
}

List<Article> _deleteArticle(List<Article> articles, DeleteArticleAction action) {
  return articles..removeWhere((article) => article.id == action.id);
}