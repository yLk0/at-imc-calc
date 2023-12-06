import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Form(
          key: _formkey,
          child: SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Calculadora de IMC',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, bottom: 10),
                    child: TextFormField(
                      controller: alturaController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Informe sua altura.(Ex: 1.70)'),
                      validator: (altura) {
                        if (altura!.isEmpty) {
                          return 'Informe sua altura.(Ex: 1.70)';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, bottom: 10),
                    child: TextFormField(
                      controller: pesoController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Informe seu peso'),
                      validator: (peso) {
                        if (peso!.isEmpty) {
                          return 'Informe seu peso';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          double peso =
                              double.tryParse(pesoController.value.text)!;
                          double altura =
                              double.tryParse(alturaController.value.text)!;
                          if (peso / (altura * altura) < 18.5) {
                            await Navigator.pushNamed(context, '/resultado',
                                arguments: {
                                  'valor': 'Você está abaixo do peso.'
                                });
                          } else if (peso / (altura * altura) >= 18.5 &&
                              peso / (altura * altura) < 25) {
                            await Navigator.pushNamed(context, '/resultado',
                                arguments: {
                                  'valor': 'Você está com um peso saudável.'
                                });
                          } else if (peso / (altura * altura) >= 25 &&
                              peso / (altura * altura) < 30) {
                            await Navigator.pushNamed(context, '/resultado',
                                arguments: {
                                  'valor': 'Você está acima do peso.'
                                });
                          } else if (peso / (altura * altura) >= 30) {
                            await Navigator.pushNamed(context, '/resultado',
                                arguments: {
                                  'valor':
                                      'Você apresenta Obesidade, procure um médico.'
                                });
                          }
                        }
                      },
                      child: const Text('Calcular'))
                ],
              ),
            ),
          )),
    );
  }
}
