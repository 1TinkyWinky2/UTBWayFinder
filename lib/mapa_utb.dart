import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaUTB extends StatefulWidget {
  @override
  _MapaUTBState createState() => _MapaUTBState();
}

class _MapaUTBState extends State<MapaUTB> {
  late GoogleMapController mapController;

  final LatLng _centroUTB = const LatLng(10.370313895625339, -75.46561924377788);

  Set<Marker> _crearMarcadores(BuildContext context) {
    return {
      Marker(
        markerId: MarkerId('entrada'),
        position: LatLng(10.370556977353985, -75.46581859237462),
        infoWindow: InfoWindow(
          title: 'Entrada Principal',
          snippet: 'Bienvenido a la UTB',
        ),
      ),
      Marker(
        markerId: MarkerId('biblioteca'),
        position: LatLng(10.369985582964892, -75.46506350295624),
        infoWindow: InfoWindow(
          title: 'Biblioteca',
          snippet: 'Toca para ver más',
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(16),
                  height: 250,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/bibloteca.png', // Asegúrate que la imagen esté bien nombrada
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Biblioteca UTB',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Centro de recursos académicos con salas de estudio, libros y acceso digital.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      Marker(
        markerId: MarkerId('cafeteria'),
        position: LatLng(10.370436905382595, -75.4654064307357),
        infoWindow: InfoWindow(
          title: 'Cafetería',
          snippet: 'Zona de comidas',
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa Satelital UTB"),
        backgroundColor: Colors.blueAccent,
      ),
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: _centroUTB,
          zoom: 17.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        minMaxZoomPreference: MinMaxZoomPreference(18.0, 21.0),
        cameraTargetBounds: CameraTargetBounds(
          LatLngBounds(
            southwest: LatLng(10.3685, -75.4670),
            northeast: LatLng(10.3720, -75.4640),
          ),
        ),
        markers: _crearMarcadores(context),

        // ⛔ Detecta si el usuario se va fuera de los límites
        onCameraMove: (CameraPosition position) {
          final bounds = LatLngBounds(
            southwest: LatLng(10.3685, -75.4670),
            northeast: LatLng(10.3720, -75.4640),
          );

          if (!bounds.contains(position.target)) {
            // 🌀 Regresa al centro si se sale del área
            mapController.animateCamera(
              CameraUpdate.newLatLng(_centroUTB),
            );
          }
        },
      ),
    );
  }
}
