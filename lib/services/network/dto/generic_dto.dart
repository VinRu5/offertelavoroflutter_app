import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class GenericDTO extends DTO with EquatableMixin {
  static const _objectKey = "object";
  static const _idKey = "id";

  final String object;
  final String id;

  GenericDTO({
    required this.object,
    required this.id,
  });

  factory GenericDTO.fromJson(Map<String, dynamic> json) => GenericDTO(
        object: json[_objectKey],
        id: json[_idKey],
      );

  @override
  List<Object?> get props => [
        object,
        id,
      ];
}
