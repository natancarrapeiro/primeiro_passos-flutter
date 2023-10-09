import 'package:sqflite/sqflite.dart';

// import manual do join 'package:path/path.dart'
import 'package:path/path.dart';

//Future espera os dados chegar
Future <Database> getDatabasase() async {
  //  join(pega o caminho para o db(),"nome") caminho definido
  final String path = join(await getDatabasesPath(), 'task.db');
  // abre o caminho para o DB
  // caso nao ache crie uma tabela
  return openDatabase(path, onCreate: (db, version) {
    db.execute(tableSql);
  }, version: 1,);
}

const String tableSql='CREATE TABLE $_tablename('
    '$_name TEXT, '
    '$_difficulty INTEGER, '
    '$_image TEXT) ';

const String _tablename='taskTable';

const String _name="name";
const String _difficulty= "difficulty";
const String _image="image";
