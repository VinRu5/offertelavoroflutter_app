import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';

part 'job_list_event.dart';
part 'job_list_state.dart';

class JobListBloc extends Bloc<JobListEvent, JobListState> {
  final JobRepository jobRepository;

  JobListBloc({required this.jobRepository})
      : super(const FetchingJobListState()) {
    on<FetchJobListEvent>(_onFetchJobListEvent);
    on<FetchMoreJobListEvent>(_onFetchMoreJobListEvent);
  }

  fetchFirstPageJobs() => add(const FetchJobListEvent());
  fetchMoreJobs() => add(const FetchMoreJobListEvent());

  FutureOr<void> _onFetchJobListEvent(
      JobListEvent event, Emitter<JobListState> emit) async {
    emit(const FetchingJobListState());

    try {
      final List<Job> jobs = await jobRepository.firstListJobs;

      emit(
        jobs.isNotEmpty
            ? FetchedJobListState(
                jobs: jobs,
                hasMore: jobRepository.hasMoreJob,
              )
            : const NoJobListState(),
      );
    } catch (e) {
      emit(const ErrorJobListState());
    }
  }

  FutureOr<void> _onFetchMoreJobListEvent(
      FetchMoreJobListEvent event, Emitter<JobListState> emit) async {
    try {
      final List<Job> jobs = await jobRepository.fetchAnotherJobs;

      emit(
        jobs.isNotEmpty
            ? FetchedJobListState(
                jobs: jobs,
                hasMore: jobRepository.hasMoreJob,
              )
            : const NoJobListState(),
      );
    } catch (e) {
      emit(const ErrorJobListState());
    }
  }
}
