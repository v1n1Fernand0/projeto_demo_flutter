import 'package:flutter/material.dart';
import 'package:projeto_demo_alura/data/task_inherited.dart';
import 'package:projeto_demo_alura/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 32),
          child: Text('Flutter: Primeiros passos  '),
        ),
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (newContext) => FormScreen(taskContext: context)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
