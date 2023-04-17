import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/di/dependency_injector.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/theme/models/theme.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) => DependencyInjector(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => "Offertelavoroflutter.it",
          theme: LightTheme.make,
          routerConfig: _appRouter.config(),
        ),
      );
}
