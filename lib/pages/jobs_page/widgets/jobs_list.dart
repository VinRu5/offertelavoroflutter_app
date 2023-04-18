import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_list_bloc/job_list_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_app/routers/app_router.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:offertelavoroflutter_app/widgets/tag_color.dart';

class JobsList extends StatelessWidget {
  const JobsList({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<JobListBloc>(
            create: (context) => JobListBloc(
              jobRepository: context.read<JobRepository>(),
            )..fetchJobs(),
          ),
        ],
        child: BlocBuilder<JobListBloc, JobListState>(
          builder: (context, state) {
            if (state is FetchingJobListState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is FetchedJobListState) {
              return _JobsListContent(
                jobs: state.jobs,
              );
            }

            if (state is NoJobListState) {
              return Text('Nessun lavoro');
            }

            if (state is ErrorJobListState) {
              return Text('Errore di caricamento');
            }

            return const SizedBox();
          },
        ),
      );
}

class _JobsListContent extends StatelessWidget {
  final List<Job> jobs;

  const _JobsListContent({
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
        itemBuilder: (_, index) => _JobTile(
          job: jobs[index],
          onPressed: () {
            context.router.push(
              JobDetailsRoute(job: jobs[index]),
            );
          },
        ),
      );
}

class _JobTile extends StatelessWidget {
  final Job job;
  final GestureTapCallback? onPressed;

  const _JobTile({
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
                  job.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  job.ral,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: job.seniority != Seniority.undefined,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: TagColor(
                        text: job.seniority.getString,
                        backgroundColor: job.seniority.color,
                        color: job.seniority.colorText,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: job.contract != ContractType.undefined,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: TagColor(
                        text: job.contract.getString,
                        backgroundColor: job.contract.color,
                        color: job.contract.colorText,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: job.team != TeamLocation.undefined,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: TagColor(
                        text: job.team.getString,
                        backgroundColor: job.team.color,
                        color: job.team.colorText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
