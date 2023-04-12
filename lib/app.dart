import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/di/dependency_injector.dart';
import 'package:offertelavoroflutter_app/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjector(
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: "Montserrat",
          ),
          home: HomePage(),
        ),
      );
}
