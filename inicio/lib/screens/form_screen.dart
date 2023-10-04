import 'package:flutter/material.dart';

class formScreen extends StatefulWidget {
  const formScreen({super.key});

  @override
  State<formScreen> createState() => _formScreenState();
}

class _formScreenState extends State<formScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imgUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.task),
        title: const Text(
          "Cadrastro de tarefas",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          height: 780,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.blueAccent,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nome da Tarefa",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.black),
                      maxLength: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.blueAccent,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Dificuldade",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.black),
                      maxLength: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (texto) {
                        setState(() {});
                      },
                      controller: imgUrlController,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.blueAccent,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Img/url",
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.black),
                      maxLength: 30,
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: Colors.blue),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(int.parse(difficultyController.text));
                    print(imgUrlController.text);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Castrate")],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
