import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  final JobRepository jobRepository;

  JobDetailsBloc(this.jobRepository) : super(const FetchingJobDetailsState()) {
    on<FetchJobDetailsEvent>(_onFetchJobDetailsEvent);
  }

  fetchJob(String id) => add(FetchJobDetailsEvent(id));

  FutureOr<void> _onFetchJobDetailsEvent(
      FetchJobDetailsEvent event, Emitter<JobDetailsState> emit) async {
    emit(const FetchingJobDetailsState());

    try {
      final job = await jobRepository.jobByID(event.jobID);

      emit(FetchedJobDetailsState(job));
    } catch (e) {
      emit(const ErrorJobDetailsState());
    }
  }
}
