import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/containers/filtered_articles.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/constants/routes.dart';
import 'package:kaffe_app/containers/kaffe_bar.dart';

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

class _MainScreenState extends State<MainScreen>
 with TickerProviderStateMixin {

   @override
   void initState() {
     super.initState();

   }
  
  @override Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Kaffe'),
            actions: [
              
            ],
          ),
          body: FilteredArticles(),
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
          bottomNavigationBar: KaffeBar(),
        );
      }
}