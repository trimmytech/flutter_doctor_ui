
import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  final Axis direction;
  final int count;
  final BouncingScrollPhysics physics;
  final dynamic widget;

  const ListViewBuilder({
    Key? key, required this.direction, required this.count, required this.physics, required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: count,
        scrollDirection: direction,
        physics: physics,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return widget;
        });
  }
}