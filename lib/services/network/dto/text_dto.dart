import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class TextDTO extends DTO with EquatableMixin {
  static const _typeKey = "type";
  static const _textKey = "text";
  static const _annotationsKey = "annotations";
  static const _plainTextKey = "plain_text";
  static const _hrefKey = "href";

  final String? type;
  final TextContentDTO? text;
  final AnnotationsDTO? annotations;
  final String? plainText;
  final String? href;

  TextDTO({
    required this.type,
    required this.text,
    required this.annotations,
    required this.plainText,
    required this.href,
  });

  factory TextDTO.fromJson(Map<String, dynamic> json) => TextDTO(
        type: json[_typeKey],
        text: TextContentDTO.fromJson(json[_textKey]),
        annotations: AnnotationsDTO.fromJson(json[_annotationsKey]),
        plainText: json[_plainTextKey],
        href: json[_hrefKey],
      );

  @override
  List<Object?> get props => [
        type,
        text,
        annotations,
        plainText,
        href,
      ];
}

class TextContentDTO extends DTO with EquatableMixin {
  static const _contentKey = "content";
  static const _linkKey = "link";

  final String? content;
  final String? link;

  TextContentDTO({
    required this.content,
    required this.link,
  });

  factory TextContentDTO.fromJson(Map<String, dynamic> json) => TextContentDTO(
        content: json[_contentKey],
        link: json[_linkKey],
      );

  @override
  List<Object?> get props => [
        content,
        link,
      ];
}

class AnnotationsDTO extends DTO with EquatableMixin {
  static const _boldKey = "bold";
  static const _italicKey = "italic";
  static const _strikethroughKey = "strikethrough";
  static const _undelineKey = "underline";
  static const _codeKey = "code";
  static const _colorKey = "color";

  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String? color;

  AnnotationsDTO({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    required this.color,
  });

  factory AnnotationsDTO.fromJson(Map<String, dynamic> json) => AnnotationsDTO(
        bold: json[_boldKey],
        italic: json[_italicKey],
        strikethrough: json[_strikethroughKey],
        underline: json[_undelineKey],
        code: json[_codeKey],
        color: json[_colorKey],
      );

  @override
  List<Object?> get props => [
        bold,
        italic,
        strikethrough,
        underline,
        code,
        color,
      ];
}
