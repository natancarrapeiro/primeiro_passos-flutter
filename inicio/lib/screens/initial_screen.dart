import 'package:flutter/material.dart';
import 'package:inicio/components/task.dart';

import 'package:inicio/data/task_dao.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //tela
      appBar: AppBar(
        leading: const Icon(Icons.task_alt),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon:const Icon( Icons.refresh))
        ],
        title: const Text(
          "Tarefas",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.blue,

        //topo
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 57),
        // widget que aguarda resposta
        // FutureBuilder(future:o que sera pego ,builder: o que sera mostrado
        //   FutureBuilder:ponto fraco: ele espera pela informação uma única vez
        // StreamBuilder é uma das soluções, caso suas informações venham toda
        // hora :https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("carregando"),
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("carregando"),
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text("carregando"),
                      ],
                    ),
                  );
                case ConnectionState.done:
                  //   caso de ja ter tudo caregado
                  // verifica se ele tem dados e se o items nao é nullo
                  if (snapshot.hasData && items != null) {
                    // verifica se eles nao estao vazio
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 130,
                          ),
                          Text(
                            "Não a tarefas",
                            style: TextStyle(fontSize: 35),
                          )
                        ],
                      ),
                    );
                  }
                  return const Text('Erro ao carregar Tarefas');
              }
            }),
      ),
      //corpo
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/form").then((value) => setState(() {
                print("caregando nova tela");
              }));

          //   metodo de usar sem routes
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => FormScreen()));
          //
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
