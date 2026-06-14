import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestures e InkWell',
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaTap(),
        '/swipe': (context) => const PantallaSwipe(),
      },
    );
  }
}

// PANTALLA 1: Detector de toques simples (Tap)
class PantallaTap extends StatelessWidget {
  const PantallaTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detección de Tap')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('¡Contenedor pulsado con éxito!')),
                );
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text('¡Púlsame!', style: TextStyle(fontSize: 22, color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // EJERCICIO 6: Navegación usando el widget InkWell con efecto onda
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/swipe'),
              borderRadius: BorderRadius.circular(8),
              splashColor: Colors.blue.withOpacity(0.3),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Ir a Pantalla Swipe →',
                  style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PANTALLA 2: Detector de arrastre horizontal (Swipe)
class PantallaSwipe extends StatefulWidget {
  const PantallaSwipe({super.key});

  @override
  State<PantallaSwipe> createState() => _PantallaSwipeState();
}

class _PantallaSwipeState extends State<PantallaSwipe> {
  Color _backgroundColor = Colors.blue;

  void _changeColorOnSwipe(DragUpdateDetails details) {
    setState(() {
      if (details.delta.dx > 0) {
        _backgroundColor = Colors.green; // Deslizar a la derecha
      } else if (details.delta.dx < 0) {
        _backgroundColor = Colors.red;   // Deslizar a la izquierda
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detección de Swipe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onHorizontalDragUpdate: _changeColorOnSwipe,
              child: Container(
                width: 220,
                height: 220,
                color: _backgroundColor,
                child: const Center(
                  child: Text(
                    'Arrastra a los lados\n(Verde / Rojo)',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(8),
              splashColor: Colors.red.withOpacity(0.3),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '← Volver Atrás',
                  style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}