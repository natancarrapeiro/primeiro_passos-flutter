import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inicio/components/difficulty.dart';

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

  bool asserOrNetwork() {
    if (widget.foto.contains("http")) {
      return false;
    }
    return true;
  }

  Color newColor = Colors.blueAccent;

  randomColor() {
    var R = Random().nextInt(255);
    var G = Random().nextInt(255);
    var B = Random().nextInt(255);
    List<int> valores = [R, G, B];
    return valores;
  }

  void mudarCorDoWidget() {
    randomColor();
    setState(() {
      var valor = randomColor();

      int r = valor[0];
      int g = valor[1];
      int b = valor[2];
      newColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
//Build é o termo usado para identificar uma versão compilada de um programa
  //responsavel por atualizar automaticamente a pagina
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: newColor, borderRadius: BorderRadius.circular(6)),
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
                        child: asserOrNetwork()
                            ? Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 192,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        difficulty(deficultyLevel: widget.dificuldade)
                      ],
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: 52,
                          width: 52,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (nivel < (widget.dificuldade * 10)) {
                                    nivel++;
                                  } else {
                                    nivel = 1;
                                    mudarCorDoWidget();
                                  }
                                });
                                // print(nivel);
                              },
                              child: const Column(
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
                child: SizedBox(
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
                  "Nivel : $nivel",
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ]),
          ],
        )
      ]),
    );
  }
}
