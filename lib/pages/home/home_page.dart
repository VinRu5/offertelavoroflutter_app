import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            "Offerte Lavoro Flutter",
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
        ),
      );
}
