import 'dart:convert';

import 'package:shelf/shelf.dart';

class Jsonview {

  static Response resposta(Map<String, dynamic> dados){
    return Response(200,body: jsonEncode(dados),headers: {'conten-type':'aplication/json'});

  }

  static Response respostaErro(messagem,erro, [int statuscode = 500]){
    return Response(500, body: jsonEncode({'messagem':messagem,"erro":erro}));
  }

}

void main(List<String> args) {
  Jsonview.respostaErro('erro', 'erro');
}