import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/freelance_list_bloc/freelance_list_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_list_bloc/job_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:offertelavoroflutter_app/widgets/tag_color.dart';

class FreelanceList extends StatelessWidget {
  const FreelanceList({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<FreelanceListBloc>(
            create: (context) => FreelanceListBloc(
              jobRepository: context.read<JobRepository>(),
            )..fetchFreelance(),
          ),
        ],
        child: BlocBuilder<FreelanceListBloc, FreelanceListState>(
          builder: (context, state) {
            if (state is FetchingFreelanceListState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is FetchedFreelanceListState) {
              return _FreelanceListContent(
                jobs: state.freelanceJobs,
              );
            }

            if (state is NoFreelanceListState) {
              return Text('Nessun lavoro');
            }

            if (state is ErrorFreelanceListState) {
              return Text('Errore di caricamento');
            }

            return const SizedBox();
          },
        ),
      );
}

class _FreelanceListContent extends StatelessWidget {
  final List<JobFreelance> jobs;

  const _FreelanceListContent({
    required this.jobs,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        itemCount: jobs.length,
        separatorBuilder: (_, index) => const Divider(
          color: AppColors.black,
        ),
        itemBuilder: (_, index) => _FreelanceTile(
          job: jobs[index],
          onPressed: () {
            context.router.push(
              FreelanceDetailsRoute(job: jobs[index]),
            );
          },
        ),
      );
}

class _FreelanceTile extends StatelessWidget {
  final JobFreelance job;
  final GestureTapCallback? onPressed;

  const _FreelanceTile({
    required this.job,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            SizedBox(
              width: 20,
              child: Text(job.emoji),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  job.code,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Visibility(
                visible: job.relationship != Relationship.undefined,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: TagColor(
                    text: job.relationship.getString,
                    backgroundColor: job.relationship.color,
                    color: job.relationship.colorText,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
