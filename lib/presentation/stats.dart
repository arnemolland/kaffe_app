import 'package:flutter/material.dart';
import 'package:kaffe_app/constants/keys.dart';
import 'package:kaffe_app/presentation/loading_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:kaffe_app/containers/stats_view.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:kaffe_app/containers/app_loading.dart';

class Stats extends StatelessWidget {
  final List<Coffee> coffees;

  Stats({Key key, @required this.coffees}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return AppLoading(builder: (context, loading) {
       loading
       ? LoadingIndicator(key: KaffeKeys.coffeesLoading)
       : _buildStatsView();
     });
   }

   Widget _buildStatsView() {
     
   }
}