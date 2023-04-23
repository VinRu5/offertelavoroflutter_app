import 'package:logger/logger.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/freelance_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/job_mapper.dart';
import 'package:offertelavoroflutter_app/services/network/job_service.dart';

class JobRepository {
  final JobService jobService;
  final JobMapper jobMapper;
  final FreelanceMapper freelanceMapper;
  final Logger logger;

  JobRepository({
    required this.jobService,
    required this.jobMapper,
    required this.freelanceMapper,
    required this.logger,
  });

  Future<List<Job>> get allJobs async {
    try {
      final response = await jobService.allJob();

      return response.results.map(jobMapper.fromDTO).toList(growable: false);
    } catch (e) {
      logger.e("Error get all jobs");

      rethrow;
    }
  }

  Future<List<JobFreelance>> get allFreelance async {
    try {
      final response = await jobService.allFreelance();

      return response.results
          .map(freelanceMapper.fromDTO)
          .toList(growable: false);
    } catch (e) {
      logger.e("Error get all freelance");

      rethrow;
    }
  }

  Future<Job> jobByID(String id) async {
    try {
      final response = await jobService.jobByID(id);

      return jobMapper.fromDTO(response);
    } catch (e) {
      logger.e("Error get job by id: $id");

      rethrow;
    }
  }
}
