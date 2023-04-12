import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/generic_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/icon_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/parent_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/properties_dto.dart';
import 'package:pine/dto/dto.dart';

class JobDTO extends DTO with EquatableMixin {
  static const _objectKey = "object";
  static const _idKey = "id";
  static const _createdTimeKey = "created_time";
  static const _lastEditedTimeKey = "last_edited_time";
  static const _createdByKey = "created_by";
  static const _lastEditedByKey = "last_edited_by";
  static const _coverKey = "cover";
  static const _iconKey = "icon";
  static const _parentKey = "parent";
  static const _archivedKey = "archived";
  static const _propertiesKey = "properties";
  static const _urlKey = "url";

  final String? object;
  final String? id;
  final String? createdTime;
  final String? lastEditedTime;
  final GenericDTO? createdBy;
  final GenericDTO? lastEditedBy;
  final GenericDTO? cover;
  final IconDTO? icon;
  final ParentDTO? parent;
  final bool? archived;
  final PropertiesDTO? properties;
  final String? url;

  JobDTO({
    required this.object,
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.createdBy,
    required this.lastEditedBy,
    required this.cover,
    required this.icon,
    required this.parent,
    required this.properties,
    required this.archived,
    required this.url,
  });

  factory JobDTO.fromJson(Map<String, dynamic> json) => JobDTO(
        object: json[_objectKey],
        id: json[_idKey],
        createdTime: json[_createdTimeKey],
        lastEditedTime: json[_lastEditedTimeKey],
        createdBy: GenericDTO.fromJson(json[_createdByKey]),
        lastEditedBy: GenericDTO.fromJson(json[_lastEditedByKey]),
        cover: GenericDTO.fromJson(json[_coverKey]),
        icon: IconDTO.fromJson(json[_iconKey]),
        parent: ParentDTO.fromJson(json[_parentKey]),
        properties: PropertiesDTO.fromJson(json[_propertiesKey]),
        archived: json[_archivedKey],
        url: json[_urlKey],
      );

  @override
  List<Object?> get props => [
        object,
        id,
        createdTime,
        lastEditedTime,
        createdBy,
        lastEditedBy,
        icon,
        parent,
        properties,
        archived,
        url,
      ];
}
