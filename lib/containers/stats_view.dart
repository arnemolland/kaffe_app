import 'package:flutter/material.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/actions/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:kaffe_app/presentation/stats.dart';

class StatsView extends StatelessWidget {
  StatsView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel> (
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Stats(coffees: vm.coffees);
      },
    );
  }
}

class _ViewModel {
  final List<Coffee> coffees;
  final bool loading;

  _ViewModel({
    @required this.coffees,
    @required this.loading
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      coffees: store.state.coffees,
      loading: store.state.isLoading
    );
  }
}