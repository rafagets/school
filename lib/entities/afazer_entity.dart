import 'afazer_checklist_enty.dart';

class AfazerEntity {
  String uuid;
  String titulo;
  DateTime dataInicio;
  DateTime dataFim;
  bool? isConcluido;
  List<AfazerChecklistEntity>? conteudos;
  String? image;

  AfazerEntity({
    required this.uuid,
    required this.titulo,
    required this.dataInicio,
    required this.dataFim,
    this.isConcluido,
    this.conteudos,
    this.image,
  });
}
