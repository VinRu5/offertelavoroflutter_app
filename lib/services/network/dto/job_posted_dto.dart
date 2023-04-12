import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class JobPostedDTO extends DTO with EquatableMixin {
  static const _idKey = "id";
  static const _typeKey = "type";
  static const _createdTimeKey = "created_time";

  final String id;
  final String type;
  final String createdTime;

  JobPostedDTO({
    required this.id,
    required this.type,
    required this.createdTime,
  });

  factory JobPostedDTO.fromJson(Map<String, dynamic> json) => JobPostedDTO(
        id: json[_idKey],
        type: json[_typeKey],
        createdTime: json[_createdTimeKey],
      );

  @override
  List<Object?> get props => [
        id,
        type,
        createdTime,
      ];
}
