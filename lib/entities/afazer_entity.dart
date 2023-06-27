import 'afazer_checklist_enty.dart';

class AfazerEntity {
  String uuid;
  String titulo;
  DateTime dataInicio;
  DateTime dataFim;
  bool? isConcluido;
  List<AfazerChecklistEntity> conteudos;
  String? image;

  AfazerEntity({
    required this.uuid,
    required this.titulo,
    required this.dataInicio,
    required this.dataFim,
    this.conteudos = const [],
    this.isConcluido = false,
    this.image,
  });

  factory AfazerEntity.fromJson(Map<String, dynamic> json) {
    return AfazerEntity(
      uuid: json['uuid'],
      titulo: json['titulo'],
      dataInicio: DateTime.fromMicrosecondsSinceEpoch(json['dataInicio']),
      dataFim: DateTime.fromMicrosecondsSinceEpoch(json['dataFim']),
      isConcluido: json['isConcluido'],
      conteudos: AfazerChecklistEntity.fromJsonList(json['conteudos']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'titulo': titulo,
      'dataInicio': dataInicio.microsecondsSinceEpoch,
      'dataFim': dataFim.microsecondsSinceEpoch,
      'isConcluido': isConcluido,
      'conteudos': conteudos,
      if (image != null) 'image': image,
    };
  }

  static List<AfazerEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => AfazerEntity.fromJson(item)).toList() ?? [];
  }
}
