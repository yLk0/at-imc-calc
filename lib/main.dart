import 'package:imc/home.dart';
import 'package:imc/resultado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/resultado': (context) => const Resultado()
    },
  ));
}
