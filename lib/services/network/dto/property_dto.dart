import 'package:pine/dto/dto.dart';

abstract class PropertyDto extends DTO {
  static const _idKey = "id";
  static const _typeKey = "type";

  final String? id;
  final String? type;

  PropertyDto({
    required this.id,
    required this.type,
  });
}
