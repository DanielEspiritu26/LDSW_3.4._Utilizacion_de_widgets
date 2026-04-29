import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaAPI(),
    );
  }
}

class PantallaAPI extends StatefulWidget {
  @override
  _PantallaAPIState createState() => _PantallaAPIState();
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

  @override
  void initState() {
    super.initState();
    obtenerPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consumo de API")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nombre.isEmpty ? "Cargando..." : nombre.toUpperCase(),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            imagen.isEmpty
                ? CircularProgressIndicator()
                : Image.network(imagen),
          ],
        ),
      ),
    );
  }
}