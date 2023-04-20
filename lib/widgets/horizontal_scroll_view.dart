import 'package:flutter/material.dart';

class HorizontalScrollView extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final double padding;

  const HorizontalScrollView({super.key, 
    required this.children,
    this.height =120,
    this.padding = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: children.map((child) {
            return Padding(
              padding: EdgeInsets.only(left: padding, right: padding),
              child: child,
            );
          }).toList(),
        ),
      ),
    );
  }
}
