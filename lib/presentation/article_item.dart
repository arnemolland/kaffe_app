import 'package:flutter/foundation.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:date_format/date_format.dart';

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
                    Hero(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(article.imageUrl),
                                fit: BoxFit.fitHeight)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                      ),
                      tag: article.id,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 25, top: 0, bottom: 5, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              article.title,
                              key: KaffeKeys.articleItemTitle(article.id),
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              textAlign: TextAlign.start,
                              softWrap: true,
                            ),
                            Text(
                              formatDate(
                                  article.published, [dd, '/', mm, '/', yy]),
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 12,
                                color: Theme.of(context).accentColor
                              ),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              style: TextStyle(
                                  fontFamily: 'Merriweather',
                                  fontSize: 12,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w300),
                              maxLines: 3,
                              softWrap: true,
                              textAlign: TextAlign.left,
                            ),
                            Text('...', style: TextStyle(
                              fontFamily: 'Merriweather',
                              fontSize: 12,
                              color: Colors.black45,
                              fontWeight: FontWeight.w300
                            ),)
                          ],
                        ),
                      ),
                    ),
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
            )),
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}
