part of 'dependency_injector.dart';

List<SingleChildWidget> _mappers = [
  Provider<JobMapper>(
    create: (_) => JobMapper(),
  )
];
