import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); //runApp é a aplicacão que aparece na tela
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

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
      ),
    );
  }
}
//  StatelessWidget deixa a tela estatica variaveis que mudao nao sera mostrada

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
//Build é o termo usado para identificar uma versão compilada de um programa
  //responsavel por atualizar automaticamente a pagina
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(6)),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white70,
                ),
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 72,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        // ao arendondar a img o decoration nao funciona aos
                        // filhos onde teve que encapsular dentro do ClipRRect
                        // para assim usar o border
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 192,
                            child: Text(
                              widget.nome,
                              style: TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                //condição para cor da estrelha, (operação)[?]pergunta( resposta)[:]se nao (resposta)
                                color: (widget.dificuldade >= 1)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 2)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 3)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 4)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: (widget.dificuldade >= 5)
                                    ? Colors.blue
                                    : Colors.blue[100],
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: 52,
                            width: 52,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    nivel++;
                                  });
                                  print(nivel);
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    Icon(Icons.arrow_drop_up),
                                    Text(
                                      "UP",
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      )
                    ]),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: (widget.dificuldade > 0)
                          ? (nivel / widget.dificuldade) / 10
                          : 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Nivel : ' + "$nivel",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ]),
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
