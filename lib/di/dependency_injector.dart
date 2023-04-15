import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/services/network/interceptors/auth_interceptor.dart';
import 'package:offertelavoroflutter_app/services/network/job_service.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';

part 'blocs.dart';
part 'mappers.dart';
part 'providers.dart';
part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        mappers: _mappers,
        providers: _providers,
        repositories: _repositories,
        blocs: _blocs,
        child: child,
      );
}