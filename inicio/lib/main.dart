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
      home: Stack(
        //pai de todos
        alignment: AlignmentDirectional.center,
        children: [
          //filhos
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
    );
  }
}
