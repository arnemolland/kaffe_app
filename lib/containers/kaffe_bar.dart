import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/actions/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_app/constants/routes.dart';

class KaffeBar extends StatelessWidget {
  KaffeBar({Key key}) : super(key: key);

  bool isNewRoute = true;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Theme.of(context).buttonColor),
              onPressed: () {
                
                Navigator.popUntil(context, (route) {
                  if(route.settings.name == KaffeRoutes.feed) {
                    isNewRoute = false;
                  }
                  return true;
                });

                if(isNewRoute) {
                  Navigator.pushReplacementNamed(context, KaffeRoutes.feed);
                }
              },
              tooltip: 'Feed',
              padding: EdgeInsets.symmetric(horizontal: 50.0)
            ),
            IconButton(
              icon: Icon(Icons.bubble_chart, color: Theme.of(context).buttonColor),
              onPressed: () {
                Navigator.popUntil(context, (route) {
                  if(route.settings.name == KaffeRoutes.stats) {
                    isNewRoute = false;
                  }
                  return true;
                });

                if(isNewRoute) {
                  Navigator.pushReplacementNamed(context, KaffeRoutes.stats);
                }
              },
              tooltip: 'Stats',
              padding: EdgeInsets.symmetric(horizontal: 50.0)
            ),
          ]),
    );
  }
}
