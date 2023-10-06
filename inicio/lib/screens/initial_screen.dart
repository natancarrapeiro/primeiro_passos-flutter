import 'package:flutter/material.dart';
import 'package:inicio/data/taskInherited.dart';

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
        title: const Text(
          "Tarefas",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.blue,

        //topo
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 57),
        child: ListView(children: TaskInherited.of(context).taskList),
      ), //corpo
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/form");

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
