import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class UrlDTO extends DTO with EquatableMixin {
  static const _idKey = "id";
  static const _typeKey = "type";
  static const _urlKey = "url";

  final String? id;
  final String? type;
  final String? url;

  UrlDTO({
    required this.id,
    required this.type,
    required this.url,
  });

  factory UrlDTO.fromJson(Map<String, dynamic> json) => UrlDTO(
        id: json[_idKey],
        type: json[_typeKey],
        url: json[_urlKey],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        url,
      ];
}
