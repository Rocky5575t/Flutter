import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

// NUESTRO MODELO DE NEGOCIO (ESTADO CENTRALIZADO)
class CounterModel extends ChangeNotifier {
  int _count = 1;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Notifica el cambio a todos los widgets que escuchan
  }

  void multiply() {
    _count *= 2;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch redibuja este árbol cada vez que se llama a notifyListeners()
    final counter = context.watch<CounterModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 8: Global Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Valor del Estado Global:', style: TextStyle(fontSize: 16)),
            Text(
              '${counter.count}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 30),
            // Ejecutamos acciones eficientemente con context.read
            ElevatedButton.icon(
              onPressed: () => context.read<CounterModel>().multiply(),
              icon: const Icon(Icons.bolt),
              label: const Text('Multiplicar x2 (Provider)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => context.read<CounterModel>().reset(),
              icon: const Icon(Icons.clear_all),
              label: const Text('Resetear (Provider)'),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterModel>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}