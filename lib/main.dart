import 'package:flutter/material.dart';
import 'mapa_utb.dart'; // Importar el módulo del mapa

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              "assets/images/fondo2.png",
              fit: BoxFit.cover,
            ),
          ),
          // Capa azul translúcida
          Positioned.fill(
            child: Container(
              color: Colors.blue.withOpacity(0.2), // Ajusta la opacidad aquí
            ),
          ),
          // Rectángulo superior con el logotipo
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 80, // Ajusta la altura si es necesario
              color: Colors.lightBlue.withOpacity(0.8), // Fondo semitransparente
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 60, // Ajusta el tamaño del logo
                ),
              ),
            ),
          ),
          // Contenido sobre la imagen y el filtro azul
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bienvenido a",
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  "UTBWayFinder",
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapaUTB()),
                    );
                  },
                  child: Text("Ver WayFinder"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
