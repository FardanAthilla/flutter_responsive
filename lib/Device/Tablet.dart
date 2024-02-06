import 'package:flutter/material.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Sapi",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
