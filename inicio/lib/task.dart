import 'package:flutter/material.dart';
import 'package:inicio/difficulty.dart';

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
                          difficulty(
                              deficultyLevel:widget.dificuldade)
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
