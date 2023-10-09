import 'package:inicio/data/task_dao.dart';
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
    db.execute(TaskDao.tableSql);
  }, version: 1,);
}


