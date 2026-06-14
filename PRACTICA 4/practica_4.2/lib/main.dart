import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppConTabBar());
}

class MyAppConTabBar extends StatelessWidget {
  const MyAppConTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App con TabBar',
      // Aquí cambiamos el Home clásico por el controlador de pestañas
      home: DefaultTabController(
        length: 4, // 1. PASO: Definimos que ahora son 4 pestañas
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Ejemplo TabBarView Modular'),
            bottom: const TabBar(
              // 2. PASO: Añadimos los 4 botones de la barra superior
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Inicio'),
                Tab(icon: Icon(Icons.star), text: 'Favoritos'),
                Tab(icon: Icon(Icons.directions_car), text: 'Vehículos'), // Nueva pestaña
                Tab(icon: Icon(Icons.settings), text: 'Ajustes'),
              ],
            ),
          ),
          body: const TabBarView(
            // 3. PASO: Enlazamos cada pestaña con su Widget modular correspondiente
            children: [
              MiContenidoInicio(),
              MiContenidoFavoritos(),
              MiContenidoVehiculos(), // Nuevo contenido modular
              MiContenidoAjustes(),
            ],
          ),
        ),
      ),
    );
  }
}

// --- WIDGETS PERSONALIZADOS (MODULARIDAD) ---
// Al separarlos del código principal, tu proyecto queda mucho más limpio y ordenado.

class MiContenidoInicio extends StatelessWidget {
  const MiContenidoInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 50, color: Colors.blue),
          SizedBox(height: 10),
          Text('Bienvenido a la Pantalla de Inicio', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class MiContenidoFavoritos extends StatelessWidget {
  const MiContenidoFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, size: 50, color: Colors.amber),
          SizedBox(height: 10),
          Text('Tus elementos favoritos', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class MiContenidoVehiculos extends StatelessWidget {
  const MiContenidoVehiculos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.directions_car, size: 50, color: Colors.green),
          SizedBox(height: 10),
          Text('Gestión de la Flota de Vehículos', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class MiContenidoAjustes extends StatelessWidget {
  const MiContenidoAjustes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 50, color: Colors.grey),
          SizedBox(height: 10),
          Text('Configuración del Sistema', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}