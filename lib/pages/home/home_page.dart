import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/widgets/tag_color.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/empty_chair.jpg",
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              "Offerte Lavoro Flutter",
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
            ElevatedButton(
              onPressed: () async {
                // print('into');
                // final resp = await context.read<JobRepository>().allJobs;

                // print('this is resp $resp');
                context.router.push(const JobsRoute());
              },
              child: Text('click'),
            ),
            TagColor(
              text: TeamLocation.hybrid.getString,
              color: TeamLocation.hybrid.colorText,
              backgroundColor: TeamLocation.hybrid.color,
            )
          ],
        ),
      );
}
