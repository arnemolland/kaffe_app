import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/presentation/loading_indicator.dart';
import 'package:kaffe_app/containers/app_loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/presentation/article_item.dart';
import 'package:kaffe_app/presentation/article_view.dart';
import 'package:kaffe_app/containers/article_details.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  ArticleList({Key key, @required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
      return loading
          ? LoadingIndicator(key: KaffeKeys.articlesLoading)
          : _buildListView();
    });
  }

  ListView _buildListView() {
    return ListView.builder(
      key: KaffeKeys.articleList,
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        final article = articles[index];

        return ArticleItem(
          article: article,
          onDismissed: (direction) {
            if(direction == DismissDirection.startToEnd) {
              
            }
            else if(direction == DismissDirection.endToStart) {
            }
          },
          onTap: () => _onArticleTap(context, article),
        );
      },
    );
  }

  void _onArticleTap(BuildContext context, Article article) {
    Navigator
    .of(context)
    .push(MaterialPageRoute(
      builder: (_) => ArticleDetails(id: article.id),
    ));
  }
}
