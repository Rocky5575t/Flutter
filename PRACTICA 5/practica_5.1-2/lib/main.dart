import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialAppDemo());
}

class MaterialAppDemo extends StatefulWidget {
  const MaterialAppDemo({super.key});

  @override
  State<MaterialAppDemo> createState() => _MaterialAppDemoState();
}

class _MaterialAppDemoState extends State<MaterialAppDemo> {
  // Variable de estado para controlar el modo oscuro
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flota Rent a Car',
      themeMode: _themeMode, // Control dinámico del tema
      
      // TEMA CLARO (Light Mode)
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.white),
      ),
      
      // TEMA OSCURO (Dark Mode)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blueAccent,
        useMaterial3: true,
      ),
      
      home: DashboardScreen(onThemeToggle: _toggleTheme),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const DashboardScreen({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Vehículos'),
        actions: [
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.light ? Icons.dark_mode : Icons.light_mode),
            onPressed: onThemeToggle, // Alterna el tema al pulsar
            tooltip: 'Cambiar Tema',
          ),
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.car_rental, size: 80, color: Colors.blue),
                const SizedBox(height: 16),
                const Text('Audi A4 - Matrícula: 1234 LZX', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('Estado: Disponible en base'),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {
                    // Navegación (Push) a la pantalla de detalles
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DetalleReservaScreen()),
                    );
                  },
                  icon: const Icon(Icons.assignment),
                  label: const Text('Gestionar Reserva'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetalleReservaScreen extends StatelessWidget {
  const DetalleReservaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Reserva')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Configuración de Fechas y Cliente', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                // Volver atrás (Pop)
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver al Panel'),
            )
          ],
        ),
      ),
    );
  }
}