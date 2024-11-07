import '../database/db.dart';
import '../models/professores_models.dart';

class ProfessoresService {
  DB connection = DB();

  Future<void> addProfesores(ProfessoresModels professor) async {
    final conect =  await connection.conect();
    await conect!.query(
        'INSERT Professores(idProfessor, nomeProfessor, senhaProfessor) VALUES(?,?,?)',
        [
          professor.idProfessor,
          professor.nomeProfessor,
          professor.senhaProfessor
        ]);
      connection.close();
  }

  Future<ProfessoresModels> getoneProf(int professor)async{
    final conect = await connection.conect();
    var getOneUser = await conect!.query(
        'SELECT * FROM funcionario WHERE idfuncionario = $professor ');
    connection.close();
    final profMap =  getOneUser.map((user)=> ProfessoresModels.fromMap(user.fields)).first;
    return profMap;
  }

  Future<void> delete(ProfessoresModels professor)async{
    final connect = await connection.conect();
    connect!.query("DELETE FROM professores WHERE = ${professor.idProfessor} ");
    print('fucionario deletado');
    connect.close();
  }
}
