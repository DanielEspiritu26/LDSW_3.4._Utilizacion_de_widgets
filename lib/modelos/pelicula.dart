class Pelicula {
  final String id;
  final String titulo;
  final String genero;
  final String imagen;

  Pelicula({
    required this.id,
    required this.titulo,
    required this.genero,
    required this.imagen,
  });

  factory Pelicula.fromMap(String id, Map<String, dynamic> data) {
    return Pelicula(
      id: id,
      titulo: data['titulo'] ?? '',
      genero: data['genero'] ?? '',
      imagen: data['imagen'] ?? '',
    );
  }
}