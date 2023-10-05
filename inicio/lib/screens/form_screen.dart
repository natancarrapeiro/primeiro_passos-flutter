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
        child: SingleChildScrollView(
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.blueAccent,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Dificuldade de 1 a 5",
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                        style: const TextStyle(color: Colors.black),
                        maxLength: 1,
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
                        keyboardType: TextInputType.url,
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
                      imgUrlController.text,
                      // tratarmento de exception
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset("assets/images/semImagem.png");
                      },
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
      ),
    );
  }
}
