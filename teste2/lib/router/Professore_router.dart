import 'package:shelf_router/shelf_router.dart';
import 'package:teste2/controller/professores_controler.dart';

class ProfessoreRouter {
  final ProfessoresControler professoresControler = ProfessoresControler();

 Router get rotas{
  final rotas = Router();

  rotas.get('/Profesores', professoresControler.getoneProfControler);
  rotas.delete('/Profesores/delete', professoresControler.deleteProfesoresControler);
  // rotas.add(verb, route, handler)

  return rotas;
 }
 
  
}