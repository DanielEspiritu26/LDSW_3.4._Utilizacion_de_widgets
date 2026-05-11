import 'package:flutter/material.dart';
import '../modelos/pelicula.dart';

class PantallaDetalle extends StatelessWidget {
  const PantallaDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula =
        ModalRoute.of(context)!.settings.arguments as Pelicula;

    return Scaffold(
      appBar: AppBar(
        title: Text(pelicula.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.movie, size: 100),
            const SizedBox(height: 20),
            Text(
              pelicula.titulo,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Género: ${pelicula.genero}"),
          ],
        ),
      ),
    );
  }
}