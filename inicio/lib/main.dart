import 'package:flutter/material.dart';
import 'package:inicio/initial_screen.dart';
import 'package:inicio/task.dart';

void main() {
  runApp(MyApp()); //runApp é a aplicacão que aparece na tela
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carraperinho',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:InitialScreen(),
    );
  }
}
//  StatelessWidget deixa a tela estatica variaveis que mudao nao sera mostrada


