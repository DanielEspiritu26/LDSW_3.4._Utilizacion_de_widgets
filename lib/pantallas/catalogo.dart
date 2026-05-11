import 'package:flutter/material.dart';
import '../servicios/firebase_servicio.dart';
import '../modelos/pelicula.dart';

class PantallaCatalogo extends StatelessWidget {
  const PantallaCatalogo({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseServicio servicio = FirebaseServicio();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Películas"),
      ),
      body: StreamBuilder<List<Pelicula>>(
        stream: servicio.obtenerPeliculas(),
        builder: (context, snapshot) {
     
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

    
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error al cargar datos:\n${snapshot.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No hay películas registradas"),
            );
          }

      
          final peliculas = snapshot.data!;

          return ListView.builder(
            itemCount: peliculas.length,
            itemBuilder: (context, index) {
              final peli = peliculas[index];

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.movie), 
                  title: Text(peli.titulo),
                  subtitle: Text(peli.genero),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detalle',
                      arguments: peli,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}