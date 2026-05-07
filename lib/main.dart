import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaAPI(),
    );
  }
}

class PantallaAPI extends StatefulWidget {
  const PantallaAPI({super.key});

  @override
  State<PantallaAPI> createState() => _PantallaAPIState();
}

class _PantallaAPIState extends State<PantallaAPI> {
  String nombre = "";
  String imagen = "";

  Future<void> obtenerPokemon() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu');
    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      final data = json.decode(respuesta.body);
      setState(() {
        nombre = data['name'];
        imagen = data['sprites']['front_default'];
      });
    }
  }

  Future<void> guardarPokemon() async {
    await FirebaseFirestore.instance.collection('pokemons').add({
      'nombre': nombre,
      'imagen': imagen,
      'fecha': DateTime.now(),
    });
  }

  @override
  void initState() {
    super.initState();
    obtenerPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase + API")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nombre.isEmpty ? "Cargando..." : nombre.toUpperCase(),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            imagen.isEmpty
                ? const CircularProgressIndicator()
                : Image.network(imagen),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: nombre.isEmpty ? null : guardarPokemon,
              child: const Text("Guardar en Firebase"),
            ),
          ],
        ),
      ),
    );
  }
}