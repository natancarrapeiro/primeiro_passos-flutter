import 'package:flutter/material.dart';
import 'package:inicio/task.dart';

class InitialScreen extends StatefulWidget {

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //tela
      appBar: AppBar(
        leading: Icon(Icons.task_alt),
        title: Text(
          "Tarefas",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        //topo
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 700),
        child: ListView(children: [
          Task(
              "flutter",
              "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
              3),
          Task(
              "python",
              "https://s3.dualstack.us-east-2.amazonaws.com/pythondotorg-assets/media/community/logos/python-logo-only.png",
              2),
          Task(
              "kotlin",
              "https://www.staffworx.co.uk/wp-content/uploads/2020/12/kotlin-logo-3-300x200.jpg",
              3),
          Task("java",
              "https://www.oracle.com/a/tech/img/rc10-java-badge-3.png", 4),
        ]),
      ), //corpo
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }
}
