import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/text_dto.dart';
import 'package:pine/dto/dto.dart';

class TitleDTO extends DTO with EquatableMixin {
  static const _idKey = "id";
  static const _typeKey = "type";
  static const _titleKey = "title";

  final String? id;
  final String? type;
  final List<TextDTO> title;

  TitleDTO({
    required this.id,
    required this.type,
    required this.title,
  });

  factory TitleDTO.fromJson(Map<String, dynamic> json) => TitleDTO(
        id: json[_idKey],
        type: json[_typeKey],
        title: json[_titleKey].map(TextDTO.fromJson),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        title,
      ];
}
