import 'package:flutter/material.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Ayam",
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
