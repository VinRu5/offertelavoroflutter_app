import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/generic_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/icon_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/parent_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/properties_dto.dart';
import 'package:pine/dto/dto.dart';

class JobDTO extends DTO with EquatableMixin {
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

  /// TODO::: implementare fromJson

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
