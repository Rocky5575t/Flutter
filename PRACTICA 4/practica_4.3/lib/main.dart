import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const EjercicioVideoApp());
}

class EjercicioVideoApp extends StatelessWidget {
  const EjercicioVideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaReproductor(),
    );
  }
}

class PantallaReproductor extends StatefulWidget {
  const PantallaReproductor({super.key});

  @override
  State<PantallaReproductor> createState() => _PantallaReproductorState();
}

class _PantallaReproductorState extends State<PantallaReproductor> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // URL pública de un vídeo de prueba de Flutter (una mariposa)
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );

    // Inicializamos el controlador y guardamos el Future
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Forzamos el refresco para asegurar que el vídeo se pinte cuando esté listo
      setState(() {});
    });

    // Hacemos que el vídeo se reproduzca en bucle continuo
    _controller.setLooping(true);

    //  AÑADE ESTAS DOS LÍNEAS SI QUIERES AUTOPLAY:
  _controller.setVolume(0.0); // Chrome exige que esté silenciado para arrancar solo
  _controller.play();
  }

  @override
  void dispose() {
    // Liberamos la memoria del reproductor al cerrar la pantalla
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 5: Reproductor de Vídeo'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Cuando termina de cargar, muestra el vídeo adaptado a sus proporciones
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              );
            } else {
              // Muestra un círculo de carga mientras descarga el vídeo
              return const CircularProgressIndicator(
                color: Colors.deepPurple,
              );
            }
          },
        ),
      ),
      // Botón flotante abajo a la derecha para Play / Pause
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }
}