import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraIMC(),
    );
  }
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  double altura = 0.0;
  double peso = 0.0;
  int idade = 0;
  double resultado = 0.0;

  void calcularIMC() {
    setState(() {
      resultado = peso / (altura * altura);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100.0, // Defina a largura desejada
              height: 100.0, // Defina a altura desejada
              child: Image.asset('../assets/logo.png'), // Substitua 'assets/imc_image.png' pela imagem que deseja usar.
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                altura = double.tryParse(value) ?? 0.0;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (m)',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                peso = double.tryParse(value) ?? 0.0;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                idade = int.tryParse(value) ?? 0;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Idade',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calcularIMC,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Resultado: ${resultado.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
