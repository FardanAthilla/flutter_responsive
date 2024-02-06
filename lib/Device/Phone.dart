import 'package:flutter/material.dart';

class HomePhone extends StatelessWidget {
  const HomePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Iwak",
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
