import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class QueryNotionRequest extends DTO with EquatableMixin {
  static const _pageSizeKey = "page_size";
  static const _startCursorKey = "start_cursor";

  final int? pageSize;
  final String? startCursor;

  QueryNotionRequest({
    this.pageSize,
    this.startCursor,
  });

  Map<String, dynamic> toJson() => {
        if (pageSize != null) _pageSizeKey: pageSize,
        if (startCursor != null) _startCursorKey: startCursor,
      };

  @override
  List<Object?> get props => [
        pageSize,
        startCursor,
      ];
}
