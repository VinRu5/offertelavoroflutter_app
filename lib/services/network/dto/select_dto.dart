import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class SelectDTO extends DTO with EquatableMixin {
  static const _idKey = "id";
  static const _typeKey = "type";
  static const _selectKey = "select";

  final String? id;
  final String? type;
  final SelectContentDTO? select;

  SelectDTO({
    required this.id,
    required this.type,
    required this.select,
  });

  factory SelectDTO.fromJson(Map<String, dynamic> json) => SelectDTO(
        id: json[_idKey],
        type: json[_typeKey],
        select: SelectContentDTO.fromJson(json[_selectKey]),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        select,
      ];
}

class SelectContentDTO extends DTO with EquatableMixin {
  static const _idKey = "id";
  static const _nameKey = "name";
  static const _colorKey = "color";

  final String? id;
  final String? name;
  final String? color;

  SelectContentDTO({
    required this.id,
    required this.name,
    required this.color,
  });

  factory SelectContentDTO.fromJson(Map<String, dynamic> json) =>
      SelectContentDTO(
        id: json[_idKey],
        name: json[_nameKey],
        color: json[_colorKey],
      );

  @override
  List<Object?> get props => [
        id,
        name,
        color,
      ];
}
