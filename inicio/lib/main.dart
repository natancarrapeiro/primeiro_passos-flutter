import 'package:flutter/material.dart';
import 'package:inicio/data/taskInherited.dart';
import 'package:inicio/screens/form_screen.dart';
import 'package:inicio/screens/initial_screen.dart';


void main() {
  runApp(const MyApp()); //runApp é a aplicacão que aparece na tela
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});
 @override
  Widget build(BuildContext context) {
    // coloquei o taskInherit antes do materiallApp por causa das routes
   // caso nao tenha  use
   // home :TaskInherited(child: const nome da tela inicial())
    return TaskInherited(
      child: MaterialApp(
        title: 'Carraperinho',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // apos usar o routes nao preciso mais usar o home: tela()
        // home:const InitialScreen(),
        initialRoute: "/" ,
        routes: {
          "/":(context)=>const InitialScreen(),
          "/form":(context)=>const FormScreen(),
        },
      ),
    );
  }
}

//  StatelessWidget deixa a tela estatica variaveis que mudao nao sera mostrada


