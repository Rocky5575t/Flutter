import 'package:flutter/material.dart';

void main() {
  runApp(const EjercicioRichTextApp());
}

class EjercicioRichTextApp extends StatelessWidget {
  const EjercicioRichTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Ejercicios 1 y 2: RichText')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Ejemplo 1: Anuncio de Inmobiliaria
              RichText(
                text: const TextSpan(
                  text: 'Se vende ',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Ático Exclusivo',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    TextSpan(text: '\ncon vistas al mar.'),
                  ],
                ),
              ),
              // Ejemplo 2: Destacar una oferta
              RichText(
                text: const TextSpan(
                  text: 'Precio: ',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: '250.000€',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: ' 210.000€',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}