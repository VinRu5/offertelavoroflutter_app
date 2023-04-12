import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/text_dto.dart';
import 'package:pine/dto/dto.dart';

class RichTextDTO extends DTO with EquatableMixin {
  static const _idKey = "id";
  static const _typeKey = "type";
  static const _richTextKey = "rich_text";

  final String? id;
  final String? type;
  final List<TextDTO> richText;

  RichTextDTO({
    required this.id,
    required this.type,
    required this.richText,
  });

  factory RichTextDTO.fromJson(Map<String, dynamic> json) => RichTextDTO(
        id: json[_idKey],
        type: json[_typeKey],
        richText: json[_richTextKey].map(TextDTO.fromJson),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        richText,
      ];
}
