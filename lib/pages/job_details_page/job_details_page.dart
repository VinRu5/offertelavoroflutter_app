import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Text("jobs details"),
      );
}
