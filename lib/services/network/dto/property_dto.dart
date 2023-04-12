import 'package:pine/dto/dto.dart';

abstract class PropertyDTO extends DTO {
  static const idKey = "id";
  static const typeKey = "type";

  final String? id;
  final String? type;

  PropertyDTO({
    required this.id,
    required this.type,
  });
}
