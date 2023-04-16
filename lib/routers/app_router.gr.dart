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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    JobsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobsPage(),
      );
    },
    JobDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobDetailsPage(),
      );
    },
  };
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
/// [JobDetailsPage]
class JobDetailsRoute extends PageRouteInfo<void> {
  const JobDetailsRoute({List<PageRouteInfo>? children})
      : super(
          JobDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
