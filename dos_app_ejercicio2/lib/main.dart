import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true, //  Activamos Material 3
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++; //  El contador sigue funcionando
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ================= APPBAR =================
      appBar: AppBar(
        centerTitle: true, //  Centra el título
        toolbarHeight: 80, //  Cambia la altura por defecto (56 → 80)
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold, //  Título en negrita
          ),
        ),
      ),

      // ================= DRAWER =================
      drawer: Drawer(
        width: 260, //  Modificamos el ancho por defecto
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), //  Icono leading
              title: Text('Inicio'),
              trailing: Icon(Icons.arrow_forward), //  Icono trailing
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: Container(
        //  Fondo degradado entre dos colores
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Imagen encima del texto
              const Icon(Icons.image, size: 80, color: Colors.white),

              const SizedBox(height: 16),

              const Text(
                'Has pulsado el botón:',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              //  El número de pulsaciones sigue visible
              Text(
                '$_counter',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white),
              ),

              const SizedBox(height: 16),

              //  Imagen debajo del texto
              const Icon(Icons.image_outlined,
                  size: 80, color: Colors.white),
            ],
          ),
        ),
      ),

      // ================= FLOATING ACTION BUTTON =================
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange, //  Color personalizado
        onPressed: _incrementCounter, //  Sigue funcionando el contador
        child: const Icon(Icons.add),
      ),

      //  Cambiamos la posición del FAB
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,

      // ================= BOTTOM NAVIGATION BAR =================
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //  Evita problemas con 4+ ítems
        selectedItemColor: Colors.orange, //  Color estado seleccionado
        unselectedItemColor: Colors.grey, //  Color estado no seleccionado
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
