import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:pine/dto/dto.dart';

class ParentDTO extends DTO with EquatableMixin {
  final String? type;
  final String? databaseId;

  ParentDTO({
    required this.type,
    required this.databaseId,
  });

  factory ParentDTO.fromJson(Map<String, dynamic> json) => ParentDTO(
        type: json[K.typeKey],
        databaseId: json[K.databaseIdKey],
      );

  @override
  List<Object?> get props => [
        type,
        databaseId,
      ];
}
