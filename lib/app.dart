import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/di/dependency_injector.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjector(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => "Offertelavoroflutter.it",
          //routeInformationParser: _appRouter.defaultRouteParser(),
          routerConfig: _appRouter.config(),
          //routerDelegate: _appRouter.delegate(),
        ),
      );
}
