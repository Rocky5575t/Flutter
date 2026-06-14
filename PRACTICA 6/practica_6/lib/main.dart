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
      title: 'Práctica 6 - Ejercicio 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Secciones'),
        backgroundColor: Colors.deepOrange.withOpacity(0.2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // CARD 1: Sección de Vehículos
            Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=500',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, stack) => const Icon(Icons.directions_car, size: 80),
                  ),
                  ListTile(
                    title: const Text('Gestión de Vehículos', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Controla los coches disponibles en la flota activa.'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PantallaVehicles()),
                        );
                      },
                      child: const Text('Ver más'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 2: Sección de Torneos
            Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=500',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, stack) => const Icon(Icons.casino, size: 80),
                  ),
                  ListTile(
                    title: const Text('Torneos y Mesas', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Configuración de ciegas, jugadores y estados.'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PantallaTorneos()),
                        );
                      },
                      child: const Text('Configurar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- PÁGINAS DESTINO DIFERENCIADAS ---

class PantallaVehicles extends StatelessWidget {
  const PantallaVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle: Vehículos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_car, size: 100, color: Colors.blue),
            const SizedBox(height: 16),
            const Text('Ficha detallada del inventario de coches', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver al menú'),
            )
          ],
        ),
      ),
    );
  }
}

class PantallaTorneos extends StatelessWidget {
  const PantallaTorneos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle: Torneos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.casino, size: 100, color: Colors.green),
            const SizedBox(height: 16),
            const Text('Panel de control y registro de crupieres', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Volver al menú'),
            )
          ],
        ),
      ),
    );
  }
}