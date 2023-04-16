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
  }

  fetchJobs() => add(const FetchJobListEvent());

  FutureOr<void> _onFetchJobListEvent(
      JobListEvent event, Emitter<JobListState> emit) async {
    emit(const FetchingJobListState());

    try {
      final List<Job> jobs = await jobRepository.allJobs;

      emit(
        jobs.isNotEmpty ? FetchedJobListState(jobs) : const NoJobListState(),
      );
    } catch (e) {
      emit(const ErrorJobListState());
    }
  }
}
