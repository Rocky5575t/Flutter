import 'package:flutter/cupertino.dart';

void main() {
  runApp(const AppCupertino());
}

class AppCupertino extends StatelessWidget {
  const AppCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: ListaCrupieresScreen(),
    );
  }
}

class ListaCrupieresScreen extends StatefulWidget {
  const ListaCrupieresScreen({super.key});

  @override
  State<ListaCrupieresScreen> createState() => _ListaCrupieresScreenState();
}

class _ListaCrupieresScreenState extends State<ListaCrupieresScreen> {
  // Lista constante original
  final List<String> _todosLosCrupieres = ['Carlos', 'María', 'Alberto', 'Elena', 'Jorge', 'Sofía'];
  
  // Lista que se muestra en pantalla y que se filtra
  List<String> _crupieresFiltrados = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _crupieresFiltrados = _todosLosCrupieres;
  }

  // Action para actualizar la lista en base a la búsqueda
  void _updateUserList(String texto) {
    setState(() {
      if (texto.isEmpty) {
        _crupieresFiltrados = _todosLosCrupieres;
      } else {
        _crupieresFiltrados = _todosLosCrupieres
            .where((nombre) => nombre.toLowerCase().contains(texto.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Gestión de Mesa (iOS)"),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoSearchTextField(
                controller: _searchController,
                placeholder: 'Buscar crupier...',
                // Gesture 1: Cada vez que se teclea una letra
                onChanged: (value) => _updateUserList(value),
                // Gesture 2: Cuando se pulsa "Intro" en el teclado
                onSubmitted: (value) => _updateUserList(value),
                // Gesture 3: Al pulsar la "X" para borrar todo
                onSuffixTap: () {
                  _searchController.clear();
                  _updateUserList('');
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _crupieresFiltrados.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: CupertinoColors.systemGrey5)),
                    ),
                    child: CupertinoListTile(
                      title: Text(_crupieresFiltrados[index]),
                      leading: const Icon(CupertinoIcons.person_alt_circle, size: 30, color: CupertinoColors.systemGrey),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        // Gesture 4: Mostrar una alerta nativa de iOS al pulsar
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text("Asignación de Puesto"),
                            content: Text("¿Deseas asignar a ${_crupieresFiltrados[index]} a la Mesa 1?"),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text("Cancelar"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                child: const Text("Confirmar"),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}