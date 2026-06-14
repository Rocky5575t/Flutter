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
      title: 'Catálogo de Flota',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const CardGalleryScreen(),
    );
  }
}

class CardGalleryScreen extends StatelessWidget {
  const CardGalleryScreen({super.key});

  // Lista de datos estructurada para la flota de vehículos
  final List<Map<String, String>> items = const [
    {
      "title": "Berlina Premium",
      "subtitle": "Confort y elegancia ejecutiva",
      "image": "https://images.unsplash.com/photo-1555215695-3004980ad54e?w=400"
    },
    {
      "title": "SUV Familiar",
      "subtitle": "Espacio y seguridad total",
      "image": "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=400"
    },
    {
      "title": "Deportivo Sport",
      "subtitle": "Máxima potencia en carretera",
      "image": "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400"
    },
    {
      "title": "Compacto Urbano",
      "subtitle": "Ágil y perfecto para ciudad",
      "image": "https://images.unsplash.com/photo-1541899481282-d53bffe3c35d?w=400"
    },
    {
      "title": "Eléctrico Eco",
      "subtitle": "Sostenibilidad y tecnología zero",
      "image": "https://images.unsplash.com/photo-1563720223185-11003d516935?w=400"
    },
    {
      "title": "Todo Terreno 4x4",
      "subtitle": "Aventura sin límites",
      "image": "https://images.unsplash.com/photo-1533558701576-23c65e413ebd?w=400"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo Modular de Flota"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: items.length,
          // Controla la distribución en rejilla
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       // Forzamos 2 columnas fijas
            crossAxisSpacing: 10,    // Espaciado horizontal
            mainAxisSpacing: 10,     // Espaciado vertical
            childAspectRatio: 0.82,  // Proporción para que quepa bien el texto inferior
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            
            return GestureDetector(
              // Capturamos el evento de click/toque
              onTap: () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar(); // Limpia el snackbar anterior rápido
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Abriendo ficha técnica: ${item['title']}"),
                    backgroundColor: Colors.indigo,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias, // Redondea las imágenes para que no se salgan del Card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Cabecera con imagen
                    Expanded(
                      child: Image.network(
                        item["image"]!,
                        fit: BoxFit.cover,
                        // Manejo de errores en Chrome por si falla el enlace o el CORS
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: Icon(Icons.directions_car, size: 50, color: Colors.indigo.withOpacity(0.4)),
                          );
                        },
                      ),
                    ),
                    // Texto descriptivo del vehículo
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"]!,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item["subtitle"]!,
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}