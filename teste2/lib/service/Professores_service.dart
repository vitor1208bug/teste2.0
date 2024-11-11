import 'dart:convert';

import '../database/db.dart';
import '../models/professores_models.dart';

class ProfessoresService {
  DB connection = DB();

  Future<void> addProfesores(ProfessoresModels professor) async {
    final conect = await connection.conect();
    await conect!.query(
        'INSERT INTO professores(nomeProfessores, senhaProfessores) VALUES(?,?)',
        [professor.nomeProfessor, professor.senhaProfessor]);
    await connection.close();
  }

  Future<ProfessoresModels> getoneProf(int professor) async {
    final conect = await connection.conect();
    var getOneUser = await conect!
        .query('SELECT * FROM Professores WHERE idProfessores = $professor ');
    connection.close();
    final profMap =
        getOneUser.map((user) => ProfessoresModels.fromMap(user.fields)).first;
    return profMap;
  }

  Future<void> delete(ProfessoresModels professor) async {
    final connect = await connection.conect();
    connect!.query(
        "DELETE FROM professores WHERE idProfessores = ${professor.idProfessor} ");
    print('fucionario deletado');
    await connect.close();
  }

  Future<List<ProfessoresModels>> getAllProfesores() async {
    final conection = await connection.conect();
    var getall = await conection!.query('SELECT * FROM professores');
    conection.close();
    final funcionarios =
        getall.map((user) => ProfessoresModels.fromMap(user.fields)).toList();
    return funcionarios;
  }
}

void main(List<String> args) async {
  Map<String, dynamic> teste = {"chave1": 1, "chave2": 2};
  List teste2 = [1, 2, 3, 4, 5, 6];
  print(teste);
  print(jsonEncode(teste2));
  print(jsonDecode(jsonEncode(teste2)).runtimeType);
}
