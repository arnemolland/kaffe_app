import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/containers/filtered_articles.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/constants/routes.dart';
import 'package:kaffe_app/containers/kaffe_bar.dart';
import 'package:kaffe_app/containers/stats_view.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:kaffe_app/constants/painters.dart';
import 'package:kaffe_app/actions/actions.dart';

@immutable
class HomeScreenViewModel {
  final List<Article> articles;

  HomeScreenViewModel({
    @required this.articles,
  });
}

class MainScreen extends StatefulWidget {
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _isNewRoute = false;
    _isPopupVisible = false;
    tab = AppTab.feed;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  bool _isNewRoute;
  bool _isPopupVisible;
  AppTab tab;
  AnimationController _controller;
  Animation _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle,
                color: Theme.of(context).accentColor),
            splashColor: Theme.of(context).primaryColorLight,
            highlightColor: Theme.of(context).primaryColorLight,
            onPressed: () {},
          )
        ],
        title: Text(
          'Kaffe.io',
          style: TextStyle(
              fontFamily: 'Lobster',
              color: Theme.of(context).accentColor,
              fontSize: 28),
        ),
      ),
      body: tab == AppTab.feed ? FilteredArticles() : StatsView(),
      floatingActionButton: FloatingActionButton(
        key: KaffeKeys.addCoffeeFab,
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(Icons.add),
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          _buildOverlay(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                      tab == AppTab.feed ? Icons.dashboard : OMIcons.dashboard,
                      color: Theme.of(context).buttonColor),
                  onPressed: () {
                    Navigator.popUntil(context, (route) {
                      if (route.settings.name == KaffeRoutes.feed) {
                        _isNewRoute = false;
                      }
                      return true;
                    });

                    if (_isNewRoute) {
                      setState(() {
                        tab = AppTab.feed;
                      });
                    }
                  },
                  tooltip: 'Feed',
                  padding: EdgeInsets.symmetric(horizontal: 50.0)),
              IconButton(
                  icon: Icon(
                      tab == AppTab.stats
                          ? Icons.bubble_chart
                          : OMIcons.bubbleChart,
                      color: Theme.of(context).buttonColor),
                  onPressed: () {
                    Navigator.popUntil(context, (route) {
                      if (route.settings.name == KaffeRoutes.stats) {
                        _isNewRoute = false;
                      }
                      return true;
                    });

                    if (_isNewRoute) {
                      setState(() {
                        tab = AppTab.stats;
                      });
                      tab = AppTab.stats;
                    }
                  },
                  tooltip: 'Stats',
                  padding: EdgeInsets.symmetric(horizontal: 50.0)),
            ]),
      ),
    );
  }

  _buildOverlay(BuildContext context) async {
    _controller.forward(from: 0);
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        opaque: false,
        builder: (context) => FadeTransition(
          opacity: _animation,
              child: Align(
                alignment: Alignment(0, 0.8),
                child: Container(
                  width: 150,
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            int number = StoreProvider.of<AppState>(context)
                                    .state
                                    .articles
                                    .length +
                                1;
                            Article article = Article('Article $number',
                                author: 'Arne Olai Molland',
                                imageUrl:
                                    'https://picsum.photos/500/500/?random');
                            StoreProvider.of<AppState>(context)
                                .dispatch(AddArticleAction(article));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.near_me),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));

    overlayState.insert(overlayEntry);
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.dismissed) {
        overlayEntry.remove();
      }
    });

    await Future.delayed(Duration(seconds: 2));
    _controller.reverse(from: 1);

  }
}
