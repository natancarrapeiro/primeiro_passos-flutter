import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //runApp é a aplicacão que aparece na tela
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carraperinho',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        //tela
        appBar: AppBar(
          title: Text("Tarefas"),
          backgroundColor: Colors.blue,
          //topo
        ),
        body: ListView(children: [
          Task("Aprender flutter"),
          Task("python"),
          Task("kotlin"),
          Task("java"),
          Task("JS"),
          Task("c#"),
          Task("C++"),
          Task("HTML"),
          Task("Android"),
          Task("IOS"),
        ]), //corpo
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
//  StatelessWidget deixa a tela estatica variaveis que mudao nao sera mostrada

class Task extends StatefulWidget {
  final String nome;

  const Task(this.nome, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(children: [
          Container(
            color: Colors.blueAccent,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Color.fromARGB(246, 250, 246, 246),
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          widget.nome,
                          style: TextStyle(
                            fontSize: 24,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                            print(nivel);
                          },
                          child: Icon(Icons.arrow_drop_up))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: nivel / 10,
                      ),
                      width: 230,
                    ),
                    Text(
                      "Nivel $nivel",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

//organisação dos widgets Colum /Row
void coluna() {
  //como se usa o Colum e suas funções

  // home: Column(
  //     mainAxisAlignment: MainAxisAlignment.center, //eixo principal
  //     crossAxisAlignment: CrossAxisAlignment.center, //eixo secundario
  //     children: [
  //        //filhos
  //     Container(
  //           color: Colors.amber,
  //            width: 200,
  //           height: 200,
  //           ),
  //           Container(
  //             color: Colors.blueGrey,
  //             width: 100,
  //             height: 100,
  //           )
  //         ]),
}

void linha() {
  //  home: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           color: Colors.amber,
  //           width: 200,
  //           height: 200,
  //         ),
  //         Container(
  //           color: Colors.blueGrey,
  //           width: 200,
  //           height: 200,
  //         )
  //       ],
  //     ),
}
