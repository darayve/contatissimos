import 'package:flutter/material.dart';

class WrapContainer extends StatelessWidget {
  WrapContainer({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/background.png'), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
