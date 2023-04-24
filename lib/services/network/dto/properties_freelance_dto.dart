import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/rich_text_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/select_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/title_dto.dart';
import 'package:pine/dto/dto.dart';

class PropertiesFreelanceDTO extends DTO with EquatableMixin {
  static const _tempisticeKey = "Tempistiche";
  static const _jobPostedKey = "Job Posted";
  static const _comeCandidarsiKey = "Come candidarsi";
  static const _richiestaDiLavoroKey = "Richiesta di lavoro";
  static const _budgetKey = "Budget";
  static const _ndaKey = "NDA";
  static const _codiceKey = "Codice";
  static const _tempisticheDiPagamentoKey = "Tempistiche di pagamento";
  static const _descrizioneDelProgettoKey = "Descrizione del progetto";
  static const _tipoDiRelazioneKey = "Tipo di relazione";

  final RichTextDTO? tempistiche;
  final SelectDTO? jobPosted;
  final RichTextDTO? comeCandidarsi;
  final RichTextDTO? richiestaDiLavoro;
  final RichTextDTO? budget;
  final SelectDTO? nda;
  final TitleDTO? codice;
  final RichTextDTO? tempisticheDiPagamento;
  final RichTextDTO? descrizioneDelProgetto;
  final SelectDTO? tipoDiRelazione;

  PropertiesFreelanceDTO({
    required this.tempistiche,
    required this.jobPosted,
    required this.comeCandidarsi,
    required this.richiestaDiLavoro,
    required this.budget,
    required this.nda,
    required this.codice,
    required this.tempisticheDiPagamento,
    required this.descrizioneDelProgetto,
    required this.tipoDiRelazione,
  });

  factory PropertiesFreelanceDTO.fromJson(Map<String, dynamic> json) =>
      PropertiesFreelanceDTO(
        tempistiche: json[_tempisticeKey] == null
            ? null
            : RichTextDTO.fromJson(json[_tempisticeKey]),
        jobPosted: json[_jobPostedKey] == null
            ? null
            : SelectDTO.fromJson(json[_jobPostedKey]),
        comeCandidarsi: json[_comeCandidarsiKey] == null
            ? null
            : RichTextDTO.fromJson(json[_comeCandidarsiKey]),
        richiestaDiLavoro: json[_richiestaDiLavoroKey] == null
            ? null
            : RichTextDTO.fromJson(json[_richiestaDiLavoroKey]),
        budget: json[_budgetKey] == null
            ? null
            : RichTextDTO.fromJson(json[_budgetKey]),
        nda: json[_ndaKey] == null ? null : SelectDTO.fromJson(json[_ndaKey]),
        codice: json[_codiceKey] == null
            ? null
            : TitleDTO.fromJson(json[_codiceKey]),
        tempisticheDiPagamento: json[_tempisticheDiPagamentoKey] == null
            ? null
            : RichTextDTO.fromJson(json[_tempisticheDiPagamentoKey]),
        descrizioneDelProgetto: json[_descrizioneDelProgettoKey] == null
            ? null
            : RichTextDTO.fromJson(json[_descrizioneDelProgettoKey]),
        tipoDiRelazione: json[_tipoDiRelazioneKey] == null
            ? null
            : SelectDTO.fromJson(json[_tipoDiRelazioneKey]),
      );

  @override
  List<Object?> get props => [
        tempistiche,
        jobPosted,
        comeCandidarsi,
        richiestaDiLavoro,
        budget,
        nda,
        codice,
        tempisticheDiPagamento,
        descrizioneDelProgetto,
        tipoDiRelazione,
      ];
}
