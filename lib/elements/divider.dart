import 'package:flutter/material.dart';

class MDivider extends StatelessWidget {
  final Axis direction;
  final double height;
  final Color color;
  final double? width;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  const MDivider(
      {super.key,
      this.height = 5,
      this.color = Colors.grey,
      this.width,
      this.marginBottom = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.marginTop = 18,
      this.direction = Axis.horizontal});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          top: marginTop,
          bottom: marginBottom),
      width: direction == Axis.horizontal && width == null
          ? MediaQuery.of(context).size.width
          : width,
      decoration: BoxDecoration(color: color),
    );
  }
}
