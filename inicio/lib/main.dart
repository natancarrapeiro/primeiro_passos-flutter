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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Container(
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      color: Colors.redAccent,
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.purple,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      color: Colors.pink,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      color: Colors.tealAccent,
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
                Container(
                  color: Colors.orange,
                  height: 50,
                  width: 300,
                  child: Text(
                    "natan carrapeiro",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    //botao
                    onPressed: () {
                      print("botao apertado");
                      //função ao aperta o botao
                    },
                    child: Text("botao"))
                //texto do botao
              ]),
        ));
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
