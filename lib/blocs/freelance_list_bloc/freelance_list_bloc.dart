import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';

part 'freelance_list_event.dart';
part 'freelance_list_state.dart';

class FreelanceListBloc extends Bloc<FreelanceListEvent, FreelanceListState> {
  final JobRepository jobRepository;

  FreelanceListBloc({required this.jobRepository})
      : super(const FetchingFreelanceListState()) {
    on<FetchFreelanceListEvent>(_onFetchFreelanceListEvent);
  }

  fetchFreelance() => add(const FetchFreelanceListEvent());

  FutureOr<void> _onFetchFreelanceListEvent(
      FetchFreelanceListEvent event, Emitter<FreelanceListState> emit) async {
    emit(const FetchingFreelanceListState());

    try {
      final freelanceJobs = await jobRepository.allFreelance;

      emit(
        freelanceJobs.isNotEmpty
            ? FetchedFreelanceListState(freelanceJobs)
            : const NoFreelanceListState(),
      );
    } catch (e) {
      emit(const ErrorFreelanceListState());
    }
  }
}
