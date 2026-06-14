import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const EjercicioMultimediaApp());
}

class EjercicioMultimediaApp extends StatelessWidget {
  const EjercicioMultimediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejercicio 3: Imágenes e Iconos'),
          actions: const [
            // Icono nativo de Material Design
            Icon(Icons.casino, size: 30), 
            SizedBox(width: 15),
            // Icono externo de FontAwesome
            FaIcon(FontAwesomeIcons.heart, size: 25), 
            SizedBox(width: 15),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Imagen desde URL (Bitmap)
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/1255/1255306.png',
                width: 100,
                height: 100,w
              ),
              const SizedBox(height: 25),
              
              // 2. Imagen vectorial SVG desde URL
              Image.network(
                'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1200&q=80',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 25),

              // 3. Imagen local desde Assets (Ya descomentada y operativa)
              Image.asset(
                'assets/img/dealer_button.png', 
                width: 100, 
                height: 100,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}