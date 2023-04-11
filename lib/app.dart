import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          fontFamily: "Montserrat",
        ),
        home: Scaffold(
          body: Center(
            child: Text(
              "Offerte Lavoro Flutter",
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
          ),
        ),
      );
}
