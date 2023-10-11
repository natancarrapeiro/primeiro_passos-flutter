import 'package:flutter/material.dart';
import 'package:inicio/components/task.dart';
import 'package:inicio/data/task_dao.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imgUrlController = TextEditingController();

  // variavel que recebe uma chave global
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // form ele visualisa o formulario se ele esta correto
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
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
                          validator: (String? value) {
                            if (valueValidator(value)) {
                              return 'Insira nome a Tarefa';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (difficultyValidator(value)) {
                              return 'Insira dificuldade entre 1 a 5';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (valueValidator(value)) {
                              return "Insira uma URL de Imagem ";
                            }
                            return null;
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
                    height: 80,
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
                      onPressed: () async {
                        // pego a chave e verifico se ela esta tudo bem
                        if (_formKey.currentState!.validate()) {
                          // entro no context da onde armazena a os dados e
                          // pega a função de criar uma nova task e insiro os
                          // dados de captura do form
                          await TaskDao().save(Task(
                              nameController.text,
                              imgUrlController.text,
                              int.parse(difficultyController.text)));

                          // sem o banco de dados
                          // TaskInherited.of(context).newTask(
                          //   nameController.text,
                          //   imgUrlController.text,
                          //   int.parse(difficultyController.text),
                          // );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Tarefa  criada'),
                            ),
                          );
                          // Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed("/");
                          // sem usar o routes
                          // Navigator.pop(context);
                        }
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
      ),
    );
  }
}
