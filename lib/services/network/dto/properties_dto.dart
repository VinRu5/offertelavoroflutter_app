import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/services/network/dto/rich_text_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/select_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/title_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/url_dto.dart';
import 'package:pine/dto/dto.dart';

class PropertiesDTO extends DTO with EquatableMixin {
  static const _jobPostedKey = "Job Posted";
  static const _teamKey = "Team";
  static const _contractKey = "Contratto";
  static const _seniorityKey = "Seniority";
  static const _ralKey = "RAL";
  static const _nameKey = "Name";
  static const _qualificaKey = "Qualifica";
  static const _retribuzioneKey = "Retribuzione";
  static const _descrizioneOffertaKey = "Descrizione offerta";
  static const _comeCandidarsiKey = "Come candidarsi";
  static const _localitaKey = "Località";
  static const _nomeAziendaKey = "Nome azienda";
  static const _statoDiPubblicazioneKey = "Stato di pubblicazione";
  static const _urlSitoWeb = "URL sito web";
  static const _tempisticeKey = "Tempistiche";
  static const _richiestaDiLavoroKey = "Richiesta di lavoro";
  static const _budgetKey = "Budget";
  static const _ndaKey = "NDA";
  static const _codiceKey = "Codice";
  static const _tempisticheDiPagamentoKey = "Tempistiche di pagamento";
  static const _descrizioneDelProgettoKey = "Descrizione del progetto";
  static const _tipoDiRelazioneKey = "Tipo di relazione";

  final SelectDTO? jobPosted;
  final SelectDTO? team;
  final SelectDTO? contratto;
  final SelectDTO? seniority;
  final SelectDTO? ral;
  final TitleDTO? name;
  final RichTextDTO? qualifica;
  final RichTextDTO? retribuzione;
  final RichTextDTO? descrizioneOfferta;
  final RichTextDTO? comeCandidarsi;
  final RichTextDTO? localita;
  final RichTextDTO? nomeAzienda;
  final RichTextDTO? statoDiPubblicazione;
  final UrlDTO? urlSitoWeb;
  final RichTextDTO? tempistiche;
  final RichTextDTO? richiestaDiLavoro;
  final RichTextDTO? budget;
  final SelectDTO? nda;
  final TitleDTO? codice;
  final RichTextDTO? tempisticheDiPagamento;
  final RichTextDTO? descrizioneDelProgetto;
  final SelectDTO? tipoDiRelazione;

  PropertiesDTO({
    required this.jobPosted,
    required this.team,
    required this.contratto,
    required this.seniority,
    required this.ral,
    required this.name,
    required this.qualifica,
    required this.retribuzione,
    required this.descrizioneOfferta,
    required this.comeCandidarsi,
    required this.localita,
    required this.nomeAzienda,
    required this.statoDiPubblicazione,
    required this.urlSitoWeb,
    required this.tempistiche,
    required this.richiestaDiLavoro,
    required this.budget,
    required this.nda,
    required this.codice,
    required this.tempisticheDiPagamento,
    required this.descrizioneDelProgetto,
    required this.tipoDiRelazione,
  });

  factory PropertiesDTO.fromJson(Map<String, dynamic> json) => PropertiesDTO(
        jobPosted: json[_jobPostedKey] == null
            ? null
            : SelectDTO.fromJson(json[_jobPostedKey]),
        team:
            json[_teamKey] == null ? null : SelectDTO.fromJson(json[_teamKey]),
        contratto: json[_contractKey] == null
            ? null
            : SelectDTO.fromJson(json[_contractKey]),
        seniority: json[_seniorityKey] == null
            ? null
            : SelectDTO.fromJson(json[_seniorityKey]),
        ral: json[_ralKey] == null ? null : SelectDTO.fromJson(json[_ralKey]),
        name: json[_nameKey] == null ? null : TitleDTO.fromJson(json[_nameKey]),
        qualifica: json[_qualificaKey] == null
            ? null
            : RichTextDTO.fromJson(json[_qualificaKey]),
        retribuzione: json[_retribuzioneKey] == null
            ? null
            : RichTextDTO.fromJson(json[_retribuzioneKey]),
        descrizioneOfferta: json[_descrizioneOffertaKey] == null
            ? null
            : RichTextDTO.fromJson(json[_descrizioneOffertaKey]),
        comeCandidarsi: json[_comeCandidarsiKey] == null
            ? null
            : RichTextDTO.fromJson(json[_comeCandidarsiKey]),
        localita: json[_localitaKey] == null
            ? null
            : RichTextDTO.fromJson(json[_localitaKey]),
        nomeAzienda: json[_nomeAziendaKey] == null
            ? null
            : RichTextDTO.fromJson(json[_nomeAziendaKey]),
        statoDiPubblicazione: json[_statoDiPubblicazioneKey] == null
            ? null
            : RichTextDTO.fromJson(json[_statoDiPubblicazioneKey]),
        urlSitoWeb: json[_urlSitoWeb] == null
            ? null
            : UrlDTO.fromJson(json[_urlSitoWeb]),
        tempistiche: json[_tempisticeKey] == null
            ? null
            : RichTextDTO.fromJson(json[_tempisticeKey]),
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
        jobPosted,
        team,
        contratto,
        seniority,
        ral,
        name,
        qualifica,
        retribuzione,
        descrizioneOfferta,
        comeCandidarsi,
        localita,
        nomeAzienda,
        statoDiPubblicazione,
        urlSitoWeb,
        tempistiche,
        richiestaDiLavoro,
        budget,
        nda,
        codice,
        tempisticheDiPagamento,
        descrizioneDelProgetto,
        tipoDiRelazione,
      ];
}
