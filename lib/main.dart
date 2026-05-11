import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pantallas/inicio.dart';
import 'pantallas/catalogo.dart';
import 'pantallas/detalle.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicio(),
        '/catalogo': (context) => const PantallaCatalogo(),
        '/detalle': (context) => const PantallaDetalle(), 
      },
    );
  }
}