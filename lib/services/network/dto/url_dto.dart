import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/property_dto.dart';

class UrlDTO extends PropertyDTO with EquatableMixin {
  // static const _idKey = "id";
  // static const _typeKey = "type";
  static const _urlKey = "url";

  // final String? id;
  // final String? type;
  final String? url;

  UrlDTO({
    super.id,
    super.type,
    required this.url,
  });

  factory UrlDTO.fromJson(Map<String, dynamic> json) => UrlDTO(
        id: json[PropertyDTO.idKey],
        type: json[PropertyDTO.typeKey],
        url: json[_urlKey],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        url,
      ];
}
