import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class IconDTO extends DTO with EquatableMixin {
  static const _typeKey = "type";
  static const _emojiKey = "emoji";

  final String type;
  final String emoji;

  IconDTO({
    required this.type,
    required this.emoji,
  });

  factory IconDTO.fromJson(Map<String, dynamic> json) => IconDTO(
        type: json[_typeKey],
        emoji: json[_emojiKey],
      );

  @override
  List<Object?> get props => [
        type,
        emoji,
      ];
}
