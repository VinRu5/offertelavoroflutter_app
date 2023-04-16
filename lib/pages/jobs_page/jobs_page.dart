import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Text("jobs"),
      );
}
