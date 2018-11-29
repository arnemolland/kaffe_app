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
    isNewRoute = false;
    tab = AppTab.feed;
  }

  bool isNewRoute;
  AppTab tab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Theme.of(context).accentColor),
            splashColor: Theme.of(context).primaryColorLight,
            highlightColor: Theme.of(context).primaryColorLight,
            onPressed: () {

            },
          )
        ],
        title: Text(
          'Kaffe.io',
          style: TextStyle(
              fontFamily: 'Lobster', color: Theme.of(context).accentColor,
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
          //_buildOverlay(context);
          int number = StoreProvider.of<AppState>(context).state.articles.length+1;
          Article article = Article('Article $number', author: 'Arne Olai Molland', imageUrl: 'https://picsum.photos/500/500/?random');
          StoreProvider.of<AppState>(context).dispatch(AddArticleAction(article));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: new Row(
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
                        isNewRoute = false;
                      }
                      return true;
                    });

                    if (isNewRoute) {
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
                        isNewRoute = false;
                      }
                      return true;
                    });

                    if (isNewRoute) {
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
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      opaque: false,
      builder: (context) => Container(
            child: CustomPaint(
              painter: OverlayPainter(surfaceColor: Colors.white),
              child: SafeArea(
                child: Row(
                  children: <Widget>[
                    /*IconButton(
                      icon: Icon(Icons.add_comment),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {},
                    ),*/
                  ],
                ),
              ),
            ),
          ),
    );

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 5));

    overlayEntry.remove();
  }
}
