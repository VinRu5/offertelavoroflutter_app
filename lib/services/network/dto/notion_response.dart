import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/job_dto.dart';
import 'package:pine/dto/dto.dart';

class NotionResponse extends DTO with EquatableMixin {
  final String? object;
  final List<JobDTO> results;
  final String? nextCursor;
  final bool? hasMore;
  final String? type;
  final Object? page;

  NotionResponse({
    required this.object,
    required this.results,
    required this.nextCursor,
    required this.hasMore,
    required this.type,
    required this.page,
  });

  @override
  List<Object?> get props => [
        object,
        results,
        nextCursor,
        hasMore,
        type,
        page,
      ];
}
