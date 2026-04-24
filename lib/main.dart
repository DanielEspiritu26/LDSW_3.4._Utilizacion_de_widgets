import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inicio(),
    );
  }
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

         
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/7640049/pexels-photo-7640049.jpeg', // puedes cambiarla
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

      
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

             
                Icon(
                  Icons.movie,
                  size: 80,
                  color: Colors.black,
                ),

                SizedBox(height: 20),

                
                Text(
                  'Catálogo de Películas',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

            
                Text(
                  'Hello World',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
