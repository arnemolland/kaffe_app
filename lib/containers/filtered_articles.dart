import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/actions/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_app/presentation/article_list.dart';
import 'package:kaffe_app/selectors/selectors.dart';

class FilteredArticles extends StatelessWidget {
  FilteredArticles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return ArticleList(
          articles: vm.articles,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Article> articles;
  final bool loading;
  final Function(Article) onBeaned;

  _ViewModel(
      {@required this.articles,
      @required this.loading,
      @required this.onBeaned});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      articles: filteredArticlesSelector(
        articlesSelector(store.state),
        activeFilterSelector(store.state),
      ),
      loading: store.state.isLoading,
      onBeaned: (article) {
        store.dispatch(UpdateArticleAction(
          article.id,
          article.copyWith(
            id: article.id,
            title: article.title,
            author: article.author,
            published: article.published,
            beans: article.beans + 1
          )
        ));
      },
    );
  }
}
