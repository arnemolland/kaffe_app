import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/presentation/loading_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:kaffe_app/containers/stats_view.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/containers/app_loading.dart';
import 'package:kaffe_app/containers/stats_view.dart';
import 'package:kaffe_app/presentation/stats_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Stats extends StatelessWidget {
  final List<Coffee> coffees;

  Stats({Key key, @required this.coffees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, loading) {
      LoadingIndicator(key: KaffeKeys.coffeesLoading);
    });
  }
}

class _ViewModel {
  final List<Coffee> coffees;
  final bool loading;

  _ViewModel({@required this.coffees, @required this.loading});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      coffees: store.state.coffees,
      loading: store.state.isLoading,
    );
  }
}
