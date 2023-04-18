// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    JobsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    JobDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<JobDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobDetailsPage(
          job: args.job,
          key: args.key,
        ),
      );
    },
    FreelanceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FreelanceDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FreelanceDetailsPage(
          job: args.job,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [JobsPage]
class JobsRoute extends PageRouteInfo<void> {
  const JobsRoute({List<PageRouteInfo>? children})
      : super(
          JobsRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobDetailsPage]
class JobDetailsRoute extends PageRouteInfo<JobDetailsRouteArgs> {
  JobDetailsRoute({
    required Job job,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          JobDetailsRoute.name,
          args: JobDetailsRouteArgs(
            job: job,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'JobDetailsRoute';

  static const PageInfo<JobDetailsRouteArgs> page =
      PageInfo<JobDetailsRouteArgs>(name);
}

class JobDetailsRouteArgs {
  const JobDetailsRouteArgs({
    required this.job,
    this.key,
  });

  final Job job;

  final Key? key;

  @override
  String toString() {
    return 'JobDetailsRouteArgs{job: $job, key: $key}';
  }
}

/// generated route for
/// [FreelanceDetailsPage]
class FreelanceDetailsRoute extends PageRouteInfo<FreelanceDetailsRouteArgs> {
  FreelanceDetailsRoute({
    required JobFreelance job,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FreelanceDetailsRoute.name,
          args: FreelanceDetailsRouteArgs(
            job: job,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FreelanceDetailsRoute';

  static const PageInfo<FreelanceDetailsRouteArgs> page =
      PageInfo<FreelanceDetailsRouteArgs>(name);
}

class FreelanceDetailsRouteArgs {
  const FreelanceDetailsRouteArgs({
    required this.job,
    this.key,
  });

  final JobFreelance job;

  final Key? key;

  @override
  String toString() {
    return 'FreelanceDetailsRouteArgs{job: $job, key: $key}';
  }
}
