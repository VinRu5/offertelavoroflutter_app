import 'package:logger/logger.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/freelance_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/job_mapper.dart';
import 'package:offertelavoroflutter_app/services/network/dto/query_notion_request.dart';
import 'package:offertelavoroflutter_app/services/network/job_service.dart';

class JobRepository {
  final JobService jobService;
  final JobMapper jobMapper;
  final FreelanceMapper freelanceMapper;
  final Logger logger;
  bool _hasMoreJob = false;
  bool _hasMoreFreelance = false;
  List<Job> _jobList = [];
  List<JobFreelance> _freelanceList = [];
  String? _cursorJob;
  String? _cursorFreelance;

  JobRepository({
    required this.jobService,
    required this.jobMapper,
    required this.freelanceMapper,
    required this.logger,
  });

  bool get hasMoreJob => _hasMoreJob;
  bool get hasMoreFreelance => _hasMoreFreelance;

  Future<List<Job>> get firstListJobs async {
    try {
      final response = await jobService.fetchJobList(QueryNotionRequest());

      _jobList =
          response.results.map(jobMapper.fromDTO).toList(growable: false);
      _hasMoreJob = response.hasMore ?? false;

      _cursorJob = _hasMoreJob ? response.nextCursor : null;

      return _jobList;
    } catch (e) {
      logger.e("Error get all jobs");

      rethrow;
    }
  }

  Future<List<Job>> get fetchAnotherJobs async {
    try {
      final response = await jobService
          .fetchJobList(QueryNotionRequest(startCursor: _cursorJob));

      final newList =
          response.results.map(jobMapper.fromDTO).toList(growable: false);

      _jobList = [..._jobList, ...newList];

      _hasMoreJob = response.hasMore ?? false;

      _cursorJob = _hasMoreJob ? response.nextCursor : null;

      return _jobList;
    } catch (e) {
      logger.e("Error get all jobs");

      rethrow;
    }
  }

  Future<List<JobFreelance>> get firstListFreelance async {
    try {
      final response =
          await jobService.fetchFreelanceList(QueryNotionRequest());

      _hasMoreFreelance = response.hasMore ?? false;

      _cursorFreelance = _hasMoreFreelance ? response.nextCursor : null;

      _freelanceList =
          response.results.map(freelanceMapper.fromDTO).toList(growable: false);

      return _freelanceList;
    } catch (e) {
      logger.e("Error get all freelance");

      rethrow;
    }
  }

  Future<List<JobFreelance>> get fetchAnotherFreelance async {
    try {
      final response = await jobService
          .fetchFreelanceList(QueryNotionRequest(startCursor: _cursorJob));

      final newList =
          response.results.map(freelanceMapper.fromDTO).toList(growable: false);

      _freelanceList = [..._freelanceList, ...newList];

      _hasMoreFreelance = response.hasMore ?? false;

      _cursorFreelance = _hasMoreFreelance ? response.nextCursor : null;

      return _freelanceList;
    } catch (e) {
      logger.e("Error get all jobs");

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

  Future<JobFreelance> freelanceByID(String id) async {
    try {
      final response = await jobService.jobByID(id);

      return freelanceMapper.fromDTO(response);
    } catch (e) {
      logger.e("Error get job by id: $id");

      rethrow;
    }
  }
}
