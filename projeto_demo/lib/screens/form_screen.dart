import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_demo_alura/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 750,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value){
                        if(value != null && value.isEmpty){
                          return 'Insira o nome da tarefa';
                        }
                      },
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty || int.parse(value) > 5 || int.parse(value) <= 0){
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Dificuldade',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value){
                        if(value != null && value.isEmpty){
                          return 'Insira a url da imagem';
                        }
                      },
                      onChanged: (text){
                        setState(() {

                        });
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Image',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                          return Image.asset('assets/images/nophoto.webp');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    if(_formKey.currentState!.validate()){
                      TaskInherited.of(widget.taskContext).newTask(nameController.text, imageController.text, int.parse(difficultyController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Salvando nova tarefa')
                          )
                      );
                      Navigator.pop(context);
                    }
                  }, child: const Text('Adicionar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
