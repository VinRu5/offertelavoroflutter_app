import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/property_dto.dart';

class CreatedTimeDTO extends PropertyDTO with EquatableMixin {
  static const _createdTimeKey = "created_time";

  final String createdTime;

  CreatedTimeDTO({
    required super.id,
    required super.type,
    required this.createdTime,
  });

  factory CreatedTimeDTO.fromJson(Map<String, dynamic> json) => CreatedTimeDTO(
        id: json[PropertyDTO.idKey],
        type: json[PropertyDTO.typeKey],
        createdTime: json[_createdTimeKey],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        createdTime,
      ];
}
