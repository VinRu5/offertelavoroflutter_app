import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/job_dto.dart';
import 'package:pine/dto/dto.dart';

class NotionResponse extends DTO with EquatableMixin {
  static const _objectKey = "object";
  static const _resultsKey = "results";
  static const _nextCursorKey = "next_cursor";
  static const _hasMoreKey = "has_more";
  static const _typeKey = "type";
  static const _pageKey = "page";

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

  factory NotionResponse.fromJson(Map<String, dynamic> json) => NotionResponse(
        object: json[_objectKey],
        results: json[_resultsKey].map(JobDTO.fromJson),
        nextCursor: json[_nextCursorKey],
        hasMore: json[_hasMoreKey],
        type: json[_typeKey],
        page: json[_pageKey],
      );

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
