import 'package:flutter/material.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class StatsBuilder extends StatelessWidget {
  //StatsBuilder(this.coffees);
  //final List<Coffee> coffees;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 200),
      child: Card(
        elevation: 2.5,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Sparkline(
            data: [
              1,
              4,
              3,
              3,
              2,
              2,
              1,
              1,
              1,
              2,
              1,
              3,
              4,
              3,
            ],
            sharpCorners: false,
            fillMode: FillMode.below,
            fillGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.7)
                ]),
            lineGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.7)
                ]),
          ),
        ),
      ),
    );
  }

  List<double> _getDataPoints(List<Coffee> coffees) {
    List<DateTime> dates =
        coffees.map((coffee) => coffee.time.toUtc()).toSet().toList();
    dates.sort();
    List<double> data;

    for (var date in dates) {
      var sum = coffees
          .where((coffee) => coffee.time.toUtc() == date)
          .fold(0, (prev, element) => 1.0 + 1.0);
      data.add(sum);
    }

    return data;
  }
}
