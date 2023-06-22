class AfazerChecklistEntity {
  String titulo;
  bool isChecked;

  AfazerChecklistEntity({
    required this.titulo,
    this.isChecked = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'isChecked': isChecked,
      'titulo': titulo,
    };
  }

  factory AfazerChecklistEntity.fromJson(Map<String, dynamic> json) {
    return AfazerChecklistEntity(
      titulo: json['titulo'],
      isChecked: json['isChecked'],
    );
  }

  static List<AfazerChecklistEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((e) => AfazerChecklistEntity.fromJson(e)).toList() ?? [];
  }
}
