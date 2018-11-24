import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/presentation/article_view.dart';
import 'package:kaffe_app/selectors/selectors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ArticleDetails extends StatelessWidget {
  final String id;

  ArticleDetails({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      ignoreChange: (state) => articleSelector(state.articles, id).isNotPresent,
      converter: (Store<AppState> store) {
        return _ViewModel.from(store, id);
      },
      builder: (context, vm) {
        return ArticleView(
          article: vm.article,
          onBeaned: vm.onBeaned,
        );
      },
    );
  }
}

class _ViewModel {
  final Article article;
  final Function onBeaned;

  _ViewModel({
    @required this.article,
    @required this.onBeaned
  });

  factory _ViewModel.from(Store<AppState> store, String id) {
    final article = articleSelector(articlesSelector(store.state), id).value;

    return _ViewModel(
      article: article,
      onBeaned: () => store.dispatch(UpdateArticleAction(article.id, article.copyWith(
        title: article.title,
        id: article.id,
        author: article.author,
        published: article.published,
        beans: article.beans + 1,
      ))),
    );
  }
}