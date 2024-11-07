import 'package:shelf/shelf.dart';
import 'package:teste2/models/professores_models.dart';
import 'package:teste2/service/Professores_service.dart';
import 'package:teste2/view/jsonview.dart';

class ProfessoresControler {
  ProfessoresService professoresService = ProfessoresService();

  Future<Response> addProfesoresControler(Request requests)async{
      try {
        await professoresService.addProfesores(ProfessoresModels.fromJson(await requests.readAsString()));
        return Jsonview.resposta({'mensagem':'deu certo addProfessor'});
      } catch (e) {
        return Jsonview.respostaErro("'deu ruim'", e.toString());
      }
  }
  
  Future<Response> deleteProfesoresControler(Request requests)async{
    try {
      await professoresService.delete(ProfessoresModels.fromJson(await requests.readAsString()));
      return Jsonview.resposta({"messagem":"deu certo"});
    } catch (e) {
      return Jsonview.respostaErro("messagem", e.toString());
    }
  }

  Future<Response> getoneProfControler(Response requests, int idProfessor)async{
      try {
        await professoresService.getoneProf(idProfessor);
        return Jsonview.resposta({'mensage':"deu certo"});
      } catch (e) {
        return Jsonview.respostaErro("messagem", e.toString());
      }
  }











}