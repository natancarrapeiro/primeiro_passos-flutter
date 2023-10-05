import 'package:flutter/material.dart';
import 'package:inicio/components/task.dart';
import 'package:inicio/screens/form_screen.dart';

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
      body: ListView(children: const [
        Task("flutter", "assets/images/flutter.png", 3),
        Task("python", "assets/images/python.jpg", 1),
        Task("kotlin", "assets/images/kotlin.png", 3),
        Task("java", "assets/images/java.png", 4),
        Task("Android", "assets/images/android.png", 5),
        SizedBox(
          height: 80,
        )
      ]), //corpo
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/home/formulario");

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
