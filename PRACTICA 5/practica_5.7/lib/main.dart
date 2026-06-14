import 'package:flutter/material.dart';

void main() => runApp(const AnimacionesApp());

class AnimacionesApp extends StatelessWidget {
  const AnimacionesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaAnimaciones(),
    );
  }
}

class PantallaAnimaciones extends StatefulWidget {
  const PantallaAnimaciones({super.key});

  @override
  State<PantallaAnimaciones> createState() => _PantallaAnimacionesState();
}

class _PantallaAnimacionesState extends State<PantallaAnimaciones> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplos de Animación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 1. Animación de Forma, Color y Tamaño
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              width: _expandido ? 200 : 100,
              height: _expandido ? 100 : 100,
              decoration: BoxDecoration(
                color: _expandido ? Colors.teal : Colors.deepOrange,
                borderRadius: BorderRadius.circular(_expandido ? 50 : 8),
              ),
              alignment: _expandido ? Alignment.center : Alignment.bottomCenter,
              child: const Icon(Icons.star, color: Colors.white, size: 40),
            ),

            // 2. Animación de Opacidad (Desvanecimiento)
            AnimatedOpacity(
              opacity: _expandido ? 1.0 : 0.2,
              duration: const Duration(seconds: 1),
              child: const Text('Texto que aparece y desaparece', style: TextStyle(fontSize: 18)),
            ),

            // 3. Transición entre dos iconos
            AnimatedCrossFade(
              firstChild: const Icon(Icons.play_circle_filled, size: 80, color: Colors.green),
              secondChild: const Icon(Icons.pause_circle_filled, size: 80, color: Colors.red),
              crossFadeState: _expandido ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _expandido = !_expandido; // Dispara todas las animaciones a la vez
          });
        },
        child: const Icon(Icons.animation),
      ),
    );
  }
}