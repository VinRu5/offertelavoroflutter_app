import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';

class FavouriteJob extends Equatable {
  final String id;
  final String company;
  final String position;
  final String emoji;
  bool isAvailable;

  FavouriteJob({
    required this.id,
    this.company = '',
    this.position = '',
    this.emoji = '',
    this.isAvailable = true,
  });

  factory FavouriteJob.fromJob(Job job) => FavouriteJob(
        id: job.id,
        company: job.company,
        position: job.qualification,
        emoji: job.emoji,
      );

  factory FavouriteJob.fromFreelance(JobFreelance job) => FavouriteJob(
        id: job.id,
        position: job.code,
        emoji: job.emoji,
      );

  @override
  List<Object?> get props => [
        id,
        company,
        position,
        emoji,
      ];
}
