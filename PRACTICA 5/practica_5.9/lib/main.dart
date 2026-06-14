import 'package:flutter/material.dart';

void main() => runApp(const DetailingApp());

class DetailingApp extends StatelessWidget {
  const DetailingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Premium Mobile Detailing',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(title: const Text('Ficha del Servicio')),
        body: ListView(
          children: [
            // 1. Sección de Imagen Superior
            Image.network(
              'https://images.unsplash.com/photo-1601362840469-51e4d8d58785?w=800',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            
            // 2. Sección de Título y Valoración
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Limpieza Integral Premium',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Servicio a domicilio - Exterior e Interior',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.star, color: Colors.amber[500]),
                  const Text('41'),
                ],
              ),
            ),
            
            // 3. Fila de Botones de Acción
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BotonAccion(icono: Icons.call, etiqueta: 'LLAMAR'),
                _BotonAccion(icono: Icons.near_me, etiqueta: 'COBERTURA'),
                _BotonAccion(icono: Icons.share, etiqueta: 'COMPARTIR'),
              ],
            ),
            
            // 4. Sección de Texto Descriptivo
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'Nuestro servicio de detallado móvil traslada el estándar más alto de limpieza automotriz '
                'directamente a tu puerta. Incluye lavado exterior a mano con técnica de dos cubos, '
                'descontaminación férrica, encerado cerámico y una higienización interior exhaustiva de '
                'tapicería y conductos de ventilación. Evaluamos la viabilidad y cobertura en función del '
                'volumen de trabajo. Tu vehículo recuperará su aspecto de concesionario sin que tengas que salir de casa.',
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget auxiliar extraído de la documentación para crear los botones de forma modular
class _BotonAccion extends StatelessWidget {
  final IconData icono;
  final String etiqueta;

  const _BotonAccion({required this.icono, required this.etiqueta});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icono, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            etiqueta,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }
}