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
      title: 'Panel de Control de Mesa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CardLayoutScreen(),
    );
  }
}

class CardLayoutScreen extends StatelessWidget {
  const CardLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard: Gestión de Mesas'),
        backgroundColor: Colors.teal.withOpacity(0.1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' Acciones Principales',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),
              
              // Fila con 2 Cards principales (Expanded reparte el espacio al 50%)
              Row(
                children: [
                  Expanded(child: buildCard('Iniciar Torneo', Icons.play_circle_fill, Colors.teal)),
                  const SizedBox(width: 10),
                  Expanded(child: buildCard('Cerrar Caja', Icons.monetization_on, Colors.amber.shade800)),
                ],
              ),
              const SizedBox(height: 16),

              const Text(
                ' Estado de la Mesa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),

              // Fila con 3 Cards secundarias (Expanded las divide en 3 partes iguales)
              Row(
                children: [
                  Expanded(child: buildCard('Mesa 1', Icons.casino, Colors.blue)),
                  const SizedBox(width: 10),
                  Expanded(child: buildCard('Mesa 2', Icons.blur_circular, Colors.purple)),
                  const SizedBox(width: 10),
                  Expanded(child: buildCard('Mesa 3', Icons.add_box, Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),

              const Text(
                ' Registro de Jugadores Activos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 10),

              // Distribución automática con Wrap (Si no caben horizontalmente, saltan de línea solas)
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 18,
                    child: buildCard(
                      'Puesto ${index + 1}',
                      Icons.person,
                      Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Función optimizada para construir un Card personalizado
  Widget buildCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withOpacity(0.2), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 42, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}