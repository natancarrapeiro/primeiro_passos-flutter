import 'package:inicio/components/task.dart';
import 'package:inicio/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT) ';

  static const String _tablename = 'taskTable';

  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  save(Task tarefa) async {
    print('iniciando o save:');
    final Database bancoDeDados = await getDatabasase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('a tarefava nao existia.');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print("tarefa ja existe.");
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name=?', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('convertendo tarefa em map:');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    print("conersao feita map : $mapaDeTarefas");
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print("acesso findAll:");
    // peguei o banco de dados
    final Database bancoDeDasdos = await getDatabasase();
    final List<Map<String, dynamic>> result =
        await bancoDeDasdos.query(_tablename);
    print("procurando dados no banco ... encontrado: $result");
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print("convertendo Map em uma lista de tarefas : ...");
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print("Lista de tarefas : $tarefas");

    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print("buscando um elemento find: ...");
    final Database bancoDeDados = await getDatabasase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name=?', whereArgs: [nomeDaTarefa]);
    print("tarefa encontrada: ${toList(result)}");
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print("deletendo tarefa $nomeDaTarefa");
    final Database bancoDeDados = await getDatabasase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}
