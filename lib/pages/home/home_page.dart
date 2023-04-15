import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_app/services/network/job_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Offerte Lavoro Flutter",
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
            ElevatedButton(
              onPressed: () async {
                print('into');
                final resp = await context.read<JobRepository>().allJobs;

                print('this is resp $resp');
              },
              child: Text('click'),
            ),
          ],
        ),
      );
}
