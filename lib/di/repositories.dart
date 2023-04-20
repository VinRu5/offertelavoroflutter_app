part of 'dependency_injector.dart';

List<RepositoryProvider> _repositories = [
  RepositoryProvider<JobRepository>(
    create: (context) => JobRepository(
      jobService: context.read<JobService>(),
      jobMapper: context.read<JobMapper>(),
      freelanceMapper: context.read<FreelanceMapper>(),
      logger: context.read<Logger>(),
    ),
  ),
  RepositoryProvider<FavouriteRepository>(
    create: (_) => FavouriteRepository(),
  ),
];
