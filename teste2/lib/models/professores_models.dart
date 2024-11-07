import 'dart:convert';

class ProfessoresModels {
  int? idProfessor;
  String nomeProfessor;
  String senhaProfessor;

  ProfessoresModels({
    this.idProfessor,
    required this.nomeProfessor,
    required this.senhaProfessor,
  });

  Map<String, dynamic> toMap() {
    return {
      'idProfessor': idProfessor,
      'nomeProfessor': nomeProfessor,
      'senhaProfessor': senhaProfessor,
    };
  }

  factory ProfessoresModels.fromMap(Map<String, dynamic> map) {
    return ProfessoresModels(
      idProfessor: map['idProfessor'],
      nomeProfessor: map['nomeProfessor'] ?? '',
      senhaProfessor: map['senhaProfessor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessoresModels.fromJson(String source) => ProfessoresModels.fromMap(json.decode(source));

}
