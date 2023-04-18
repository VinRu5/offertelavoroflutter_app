part of 'dependency_injector.dart';

List<SingleChildWidget> _mappers = [
  Provider<JobMapper>(
    create: (_) => JobMapper(),
  ),
  Provider<FreelanceMapper>(
    create: (_) => FreelanceMapper(),
  )
];
