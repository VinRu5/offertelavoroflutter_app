import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class ParentDTO extends DTO with EquatableMixin {
  static const _typeKey = "type";
  static const _databaseIdKey = "database_id";

  final String type;
  final String databaseId;

  ParentDTO({
    required this.type,
    required this.databaseId,
  });

  factory ParentDTO.fromJson(Map<String, dynamic> json) => ParentDTO(
        type: json[_typeKey],
        databaseId: json[_databaseIdKey],
      );

  @override
  List<Object?> get props => [
        type,
        databaseId,
      ];
}
