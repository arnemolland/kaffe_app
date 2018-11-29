import 'package:kaffe_app/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/containers/kaffe_bar.dart';
import 'package:kaffe_app/containers/app_loading.dart';
import 'package:kaffe_app/presentation/loading_indicator.dart';
import 'package:kaffe_app/constants/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleView extends StatelessWidget {
  final Article article;
  final Function onBeaned;

  ArticleView({Key key, this.article, this.onBeaned})
      : super(key: key ?? KaffeKeys.articleView);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                child: Image.network(
                  article.imageUrl,
                  fit: BoxFit.cover,
                ),
                tag: article.id,
              ),
            ),
            actions: <Widget>[
              _chipBuilder(),
              IconButton(
                icon: Icon(
                  Icons.watch_later,
                  color: Colors.white,
                ),
                tooltip: 'Author',
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article.title,
                        style: TextStyle(
                            fontFamily: 'Merriweather',
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              )
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: KaffeKeys.addCoffeeFab,
        backgroundColor: Theme.of(context).buttonColor,
        child: SvgPicture.asset('assets/images/kaffe_logo_outline.svg',
            color: Colors.white, height: 25, width: 25),
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, KaffeRoutes.add);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  Widget _chipBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Chip(
          label: Text('Review'),
        ),
        Chip(label: Text('New'))
      ],
    );
  }
}
