import 'package:flutter/foundation.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';

class ArticleItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final Article article;

  ArticleItem(
      {@required this.onDismissed,
      @required this.onTap,
      @required this.article});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: KaffeKeys.articleItem(article.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${article.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 2.5,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://upload.wikimedia.org/wikipedia/commons/c/c5/Roasted_coffee_beans.jpg'),
                              fit: BoxFit.cover)),
                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 5, bottom: 5),
                      child: Column(
                        children: <Widget>[
                          Text(
                            article.title,
                            key: KaffeKeys.articleItemTitle(article.id),
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          Text(
                            article.published.weekday.toString(),
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 12),
                          ),
                          Text('Oppsummering'),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        subtitle: Text(article.author,
            key: KaffeKeys.articleItemAuthor(article.id),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 12,
            )
            ),
            contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}
