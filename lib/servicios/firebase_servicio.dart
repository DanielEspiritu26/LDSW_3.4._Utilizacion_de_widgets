import 'package:cloud_firestore/cloud_firestore.dart';
import '../modelos/pelicula.dart';

class FirebaseServicio {
  final CollectionReference peliculasRef =
      FirebaseFirestore.instance.collection('peliculas');

  Stream<List<Pelicula>> obtenerPeliculas() {
    return peliculasRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Pelicula.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }
}
