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
  }

  bool isNewRoute = false;
  AppTab tab = AppTab.feed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tab == AppTab.feed ? 'Feed' : 'Stats',
          style: TextStyle(
              fontFamily: 'Raleway', color: Theme.of(context).accentColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {},
          ),
        ],
      ),
      body: tab == AppTab.feed ? FilteredArticles() : StatsView(),
      floatingActionButton: FloatingActionButton(
        key: KaffeKeys.addCoffeeFab,
        backgroundColor: Theme.of(context).buttonColor,
        child: Icon(Icons.add),
        foregroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, KaffeRoutes.add);
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
                  icon: Icon(Icons.dashboard,
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
                  icon: Icon(Icons.bubble_chart,
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
}
