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
      title: 'Estado Local (setState)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ejercicio 7: Operaciones con setState'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1; // Empezamos en 1 para que la multiplicación tenga sentido inicial

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Multiplica el estado del contador por 2
  void _multiplyCounter() {
    setState(() {
      _counter *= 2;
    });
  }

  // Resetea el contador a 0
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.purple.withOpacity(0.2),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Valor actual del contador:', style: TextStyle(fontSize: 16)),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            const SizedBox(height: 30),
            // Botón de Multiplicar
            ElevatedButton.icon(
              onPressed: _multiplyCounter,
              icon: const Icon(Icons.clear),
              label: const Text('Multiplicar por 2'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade100),
            ),
            const SizedBox(height: 12),
            // Botón de Resetear
            ElevatedButton.icon(
              onPressed: _resetCounter,
              icon: const Icon(Icons.refresh),
              label: const Text('Resetear Contador'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}