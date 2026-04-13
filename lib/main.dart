import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LDSW - Widgets básicos'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

         
            Text(
              'Catálogo de Películas',
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 20),

         
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Acción'),
                Text('Comedia'),
                Text('Terror'),
              ],
            ),

            SizedBox(height: 20),

            Container(
              width: 200,
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Película destacada',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.grey,
                ),
                Text(
                  'Top 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}