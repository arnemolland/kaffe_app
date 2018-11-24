import 'package:flutter/foundation.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';

class ArticleItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final Article article;

  ArticleItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.article
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: KaffeKeys.articleItem(article.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Icon(Icons.watch),
        title: Hero(
          tag: '${article.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Container(
                child: Text(article.title,
                key:KaffeKeys.articleItemTitle(article.id),
                style: TextStyle(fontFamily: 'Raleway'),)
              ),
            ),
          ),
        ),
        subtitle: Text(
          article.author,
          key: KaffeKeys.articleItemAuthor(article.id),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 12,
          )
        ),
      ),
    );
  }
}