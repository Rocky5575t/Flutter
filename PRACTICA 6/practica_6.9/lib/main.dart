import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: const TodoApp(),
    ),
  );
}

// 1. MODELO DE DATOS DE LA TAREA
class Task {
  final String title;
  final String priority; // 'Alta', 'Media', 'Baja'
  bool isDone;

  Task({required this.title, required this.priority, this.isDone = false});
}

// 2. CONTROLADOR DE ESTADO CON PROVIDER
class TodoProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Revisar niveles del coche de alquiler', priority: 'Alta'),
    Task(title: 'Estudiar combinaciones de ciegas en póker', priority: 'Media'),
    Task(title: 'Actualizar paquetes de dependencias', priority: 'Baja'),
  ];

  List<Task> get tasks => _tasks;

  void addTask(String title, String priority) {
    _tasks.add(Task(title: title, priority: priority));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestor de Tareas Avanzado',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const TodoScreen(),
    );
  }
}

// 3. INTERFAZ GRÁFICA PRINCIPAL
class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    String selectedPriority = 'Baja'; // Prioridad por defecto exigida

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas con Prioridad'),
        backgroundColor: Colors.teal.withOpacity(0.2),
      ),
      body: Column(
        children: [
          // Formulario superior para añadir tareas rápidas
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: 'Nueva tarea...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Selector de Prioridad (Dropdown)
                StatefulBuilder(
                  builder: (context, setInnerState) => DropdownButton<String>(
                    value: selectedPriority,
                    items: const [
                      DropdownMenuItem(value: 'Baja', child: Text('Baja')),
                      DropdownMenuItem(value: 'Media', child: Text('Media')),
                      DropdownMenuItem(value: 'Alta', child: Text('Alta')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setInnerState(() => selectedPriority = value);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      context.read<TodoProvider>().addTask(textController.text, selectedPriority);
                      textController.clear();
                    }
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          
          // Listado reactivo de tareas usando el widget Consumer
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                return ListView.builder(
                  itemCount: todoProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = todoProvider.tasks[index];
                    
                    // Asignación dinámica de color según la prioridad del enunciado
                    Color priorityColor = Colors.green;
                    if (task.priority == 'Media') priorityColor = Colors.orange;
                    if (task.priority == 'Alta') priorityColor = Colors.red;

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: ListTile(
                        leading: Checkbox(
                          value: task.isDone,
                          onChanged: (_) => todoProvider.toggleTask(index),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration: task.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        // Badge visual personalizado para la prioridad
                        subtitle: Container(
                          margin: const EdgeInsets.only(top: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: priorityColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: priorityColor, width: 1), 
                          ),
                          child: Text(
                            'Prioridad: ${task.priority}',
                            style: TextStyle(color: priorityColor, fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.grey),
                          onPressed: () => todoProvider.deleteTask(index),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}