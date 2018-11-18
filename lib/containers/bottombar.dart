import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';

class KaffeBottomBar extends StatefulWidget {
  KaffeBottomBar() : super(key: KaffeKeys.kaffeBottomBar);
  @override
  _KaffeBottomBarState createState() => new _KaffeBottomBarState();
}

class _KaffeBottomBarState extends State<KaffeBottomBar> {
  @override
  Widget build(BuildContext context) {
    return new BottomAppBar(
      notchMargin: 5.0,
      shape: CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.dashboard, color: Theme.of(context).accentColor,),
            onPressed: () {},
            tooltip: 'Dashboard',
            padding: new EdgeInsets.symmetric(horizontal: 50.0),
          ),
          new IconButton(
              icon: new Icon(Icons.bubble_chart, color: Theme.of(context).accentColor,),
              onPressed: () {},
              tooltip: 'Stats',
              padding: new EdgeInsets.symmetric(horizontal: 50.0)),
        ],
      ),
    );
  }
}

class AddCoffeeFab extends StatefulWidget {
    AddCoffeeFab() : super(key: KaffeKeys.addCoffeeFab);
  @override
  _AddCoffeeFabState createState() => new _AddCoffeeFabState();
}

class _AddCoffeeFabState extends State<AddCoffeeFab> {
  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      child: new Icon(Icons.add),
      onPressed: () {},
      elevation: 5.0,
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
