import 'package:mysql1/mysql1.dart';

class DB {
  MySqlConnection? connection;

  Future<MySqlConnection?> conect()async{
    try {
     final settings = ConnectionSettings(port:3306,user: 'root', db: 'mydb',host: 'localhost');
     print('deu bom');
     return await MySqlConnection.connect(settings);
     
    } catch (e) {
      connection = null;
      print('deu ruim');
    }finally{
      // ignore: control_flow_in_finally
      return connection;
    }

  }

  Future<void> close() async{
    try {
      if(connection != null){
        connection!.close();
        print('fechado');
      };
    } catch (e) {
      print('deu erro fechar');
    }finally{
      connection = null;
    }
  }

  query(String s, List<Object?> list) {}

}

void main(List<String> args) {
  DB inicio = DB();
  inicio.conect();
}