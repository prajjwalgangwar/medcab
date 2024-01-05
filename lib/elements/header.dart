import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String heading;
  final Widget? trailing;
  final double horizontalMargin;
  final double verticalMargin;
  final int trailingFlex;
  const Header(
      {super.key,
      required this.heading,
      this.trailing,
      this.horizontalMargin = 16,
      this.verticalMargin = 16,
      this.trailingFlex = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin, vertical: verticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 13,
              child: Text(
                heading,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
          if (trailing != null) Flexible(flex: trailingFlex, child: trailing!)
        ],
      ),
    );
  }
}
