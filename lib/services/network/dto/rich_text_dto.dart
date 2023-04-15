import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/property_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/text_dto.dart';
import 'package:pine/dto/dto.dart';

class RichTextDTO extends PropertyDTO with EquatableMixin {
  static const _richTextKey = "rich_text";

  final List<TextDTO> richText;

  RichTextDTO({
    required super.id,
    required super.type,
    required this.richText,
  });

  factory RichTextDTO.fromJson(Map<String, dynamic> json) => RichTextDTO(
        id: json[PropertyDTO.idKey],
        type: json[PropertyDTO.typeKey],
        richText: json[_richTextKey]
            .map<TextDTO>((item) => TextDTO.fromJson(item))
            .toList(growable: false),
      );

  @override
  List<Object?> get props => [
        id,
        type,
        richText,
      ];
}
