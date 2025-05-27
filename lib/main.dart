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
      backgroundColor: Color(0xFFFFF3E0), // Fondo beige
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),

            // Logo centrado arriba
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 300,
              ),
            ),

            Spacer(),

            // Textos principales
            Text(
              "Bienvenido a",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.brown[700],
              ),
            ),
            Text(
              "UTBWayFinder",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),

            SizedBox(height: 40),

            // Botón con animación
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) => MapaUTB(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[400],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("Ver WayFinder"),
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
