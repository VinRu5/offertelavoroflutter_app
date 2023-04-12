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
  });

  factory PropertiesDTO.fromJson(Map<String, dynamic> json) => PropertiesDTO(
        jobPosted: SelectDTO.fromJson(json[_jobPostedKey]),
        team: SelectDTO.fromJson(json[_teamKey]),
        contratto: SelectDTO.fromJson(json[_contractKey]),
        seniority: SelectDTO.fromJson(json[_seniorityKey]),
        ral: SelectDTO.fromJson(json[_ralKey]),
        name: TitleDTO.fromJson(json[_nameKey]),
        qualifica: RichTextDTO.fromJson(json[_qualificaKey]),
        retribuzione: RichTextDTO.fromJson(json[_retribuzioneKey]),
        descrizioneOfferta: RichTextDTO.fromJson(json[_descrizioneOffertaKey]),
        comeCandidarsi: RichTextDTO.fromJson(json[_comeCandidarsiKey]),
        localita: RichTextDTO.fromJson(json[_localitaKey]),
        nomeAzienda: RichTextDTO.fromJson(json[_nomeAziendaKey]),
        statoDiPubblicazione:
            RichTextDTO.fromJson(json[_statoDiPubblicazioneKey]),
        urlSitoWeb: UrlDTO.fromJson(json[_urlSitoWeb]),
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
      ];
}
