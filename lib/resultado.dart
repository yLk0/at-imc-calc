import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Voltar'),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SizedBox(
        child: Center(
          child: Text(
            data['valor'],
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 247, 245, 245)),
          ),
        ),
      ),
    );
  }
}
