import 'package:flutter/material.dart';
import 'package:inicio/screens/form_screen.dart';
import 'package:inicio/screens/initial_screen.dart';


void main() {
  runApp(const MyApp()); //runApp é a aplicacão que aparece na tela
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carraperinho',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // apos usar o routes nao preciso mais usar o home: tela()
      // home:const InitialScreen(),
      initialRoute: "/home",
      routes: {
        "/home":(context)=>InitialScreen(),
        "/home/formulario":(context)=>FormScreen(),
      },
    );
  }
}

//  StatelessWidget deixa a tela estatica variaveis que mudao nao sera mostrada


