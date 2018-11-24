import 'package:kaffe_app/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';

class ArticleView extends StatelessWidget {
  final Article article;
  final Function onBeaned;

  ArticleView({Key key, this.article, this.onBeaned}) : super(key: key ?? KaffeKeys.articleView);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  
}