import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const CalculoIMC());
}

class ResultadoIMC {
  static String get excesso => 'assets/images/excesso.jpg';
  static String get magreza => 'assets/images/magreza.jpg';
  static String get normal => 'assets/images/normal.jpg';
  static String get obesidade2 => 'assets/images/obesidade2.jpg';
  static String get obesidade => 'assets/images/obesidade.jpg';
}

class CalculoIMC extends StatefulWidget {
  const CalculoIMC({super.key});

  @override
  State<CalculoIMC> createState() => _CalculoIMCState();
}

class _CalculoIMCState extends State<CalculoIMC> {
  String resultadoIMC = ResultadoIMC.normal;
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();

  @override
  void dispose() {
    alturaController.dispose();
    pesoController.dispose();
    super.dispose();
  }

  calcularIMC() {
    double altura = double.parse(alturaController.text);
    double peso = double.parse(pesoController.text);
    double imc = peso / (pow(altura / 100, 2));
    String novoResultadoIMC;

    if (imc < 18.5) {
      novoResultadoIMC = ResultadoIMC.magreza;
    } else if (imc < 25) {
      novoResultadoIMC = ResultadoIMC.normal;
    } else if (imc < 30) {
      novoResultadoIMC = ResultadoIMC.excesso;
    } else if (imc < 35) {
      novoResultadoIMC = ResultadoIMC.obesidade;
    } else {
      novoResultadoIMC = ResultadoIMC.obesidade2;
    }

    setState(() {
      resultadoIMC = novoResultadoIMC;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      title: 'IMC',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('IMC')),
        body: Column(children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: alturaController,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Altura',
                        hintText: '180cm'),
                  ),
                  TextField(
                    controller: pesoController,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: false),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Peso',
                        hintText: '80Kg'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => calcularIMC(),
                        child: const Text('Calcular')),
                  )
                ]),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Image.asset(resultadoIMC),
          )
        ]),
      ),
    );
  }
}
