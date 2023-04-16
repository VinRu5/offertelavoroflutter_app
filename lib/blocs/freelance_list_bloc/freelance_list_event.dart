part of 'freelance_list_bloc.dart';

abstract class FreelanceListEvent extends Equatable {
  const FreelanceListEvent();

  @override
  List<Object> get props => [];
}

class FetchFreelanceListEvent extends FreelanceListEvent {
  const FetchFreelanceListEvent();
}
