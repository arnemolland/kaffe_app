import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_repository/kaffe_repository.dart';

List<Middleware<AppState>> createStoreArticlesMiddleware(
  ReactiveArticlesRepository articlesRepository
) {
  return [
    TypedMiddleware<AppState, ConnectToDataSourceAction>(
      _firestoreConnect(articlesRepository),
    ),
    TypedMiddleware<AppState, AddArticleAction>(
      _firestoreSaveNewArticle(articlesRepository),
    ),
    TypedMiddleware<AppState, DeleteArticleAction>(
      _firestoreDeleteArticle(articlesRepository),
    ),
    TypedMiddleware<AppState, UpdateArticleAction>(
      _firestoreUpdateArticle(articlesRepository),
    ),
  ];
}

void Function(
  Store<AppState> store,
  ConnectToDataSourceAction action,
  NextDispatcher next,
) _firestoreConnect(
  ReactiveArticlesRepository repository,
) {
  return (store, action, next) {
    next(action);

    repository.articles().listen((articles) {
      store.dispatch(LoadArticlesAction(articles.map(Article.fromEntity).toList()));
    });
  };
}

void Function(
  Store<AppState> store,
  AddArticleAction action,
  NextDispatcher next,
) _firestoreSaveNewArticle(
  ReactiveArticlesRepository repository,
) {
  return (store, action, next) {
    next(action);
    repository.addNewArticle(action.article.toEntity());
  };
}

void Function(
  Store<AppState> store,
  DeleteArticleAction action,
  NextDispatcher next,
) _firestoreDeleteArticle(
  ReactiveArticlesRepository repository,
) {
  return (store, action, next) {
    next(action);
    repository.deleteArticle([action.id]);
  };
}

void Function(
  Store<AppState> store,
  UpdateArticleAction action,
  NextDispatcher next,
) _firestoreUpdateArticle(
  ReactiveArticlesRepository repository,
) {
  return (store, action, next) {
    next(action);
    repository.updateArticle(action.updatedArticle.toEntity());
  };
}
